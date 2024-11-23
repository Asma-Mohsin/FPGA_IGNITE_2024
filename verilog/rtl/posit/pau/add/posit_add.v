// Source: https://github.com/manish-kj/PACoGen/blob/master/add/posit_add.v

`timescale 1ns / 1ps
module posit_add (in1, in2, start, out, inf, zero, done);

function [31:0] log2;
input reg [31:0] value;
	begin
	value = value-1;
	for (log2=0; value>0; log2=log2+1)
        	value = value>>1;
      	end
endfunction

parameter N = 16;
parameter Bs = log2(N); 
parameter es = 2;

input [N-1:0] in1, in2;
input start; 
output [N-1:0] out;
output inf, zero;
output done;

wire start0= start;
wire s1 = in1[N-1];
wire s2 = in2[N-1];
wire zero_tmp1 = |in1[N-2:0];
wire zero_tmp2 = |in2[N-2:0];
wire inf1 = in1[N-1] & (~zero_tmp1),
	inf2 = in2[N-1] & (~zero_tmp2);
wire zero1 = ~(in1[N-1] | zero_tmp1),
	zero2 = ~(in2[N-1] | zero_tmp2);
assign inf = inf1 | inf2,
	zero = zero1 & zero2;

//Data Extraction
wire rc1, rc2;
wire [Bs-1:0] regime1, regime2;
wire [es-1:0] e1, e2;
wire [N-es-1:0] mant1, mant2;
wire [N-1:0] xin1 = s1 ? -in1 : in1;
wire [N-1:0] xin2 = s2 ? -in2 : in2;
data_extract_v1 #(.N(N),.es(es)) uut_de1(.in(xin1), .rc(rc1), .regime(regime1), .exp(e1), .mant(mant1));
data_extract_v1 #(.N(N),.es(es)) uut_de2(.in(xin2), .rc(rc2), .regime(regime2), .exp(e2), .mant(mant2));

wire [N-es:0] m1 = {zero_tmp1,mant1}, 
	m2 = {zero_tmp2,mant2};

//Large Checking and Assignment
wire in1_gt_in2 = (xin1[N-2:0] >= xin2[N-2:0]) ? 1'b1 : 1'b0;

wire ls = in1_gt_in2 ? s1 : s2;
wire op = s1 ~^ s2;

wire lrc = in1_gt_in2 ? rc1 : rc2;
wire src = in1_gt_in2 ? rc2 : rc1;

wire [Bs-1:0] lr = in1_gt_in2 ? regime1 : regime2;
wire [Bs-1:0] sr = in1_gt_in2 ? regime2 : regime1;

wire [es-1:0] le = in1_gt_in2 ? e1 : e2;
wire [es-1:0] se = in1_gt_in2 ? e2 : e1;

wire [N-es:0] lm = in1_gt_in2 ? m1 : m2;
wire [N-es:0] sm = in1_gt_in2 ? m2 : m1;

//Exponent Difference: Lower Mantissa Right Shift Amount
wire [es+Bs+1:0] diff;
wire [Bs:0] lr_N;
wire [Bs:0] sr_N;
abs_regime #(.N(Bs)) uut_abs_regime1 (lrc, lr, lr_N);
abs_regime #(.N(Bs)) uut_abs_regime2 (src, sr, sr_N);
sub_N #(.N(es+Bs+1)) uut_ediff ({lr_N,le}, {sr_N, se}, diff);
wire [Bs-1:0] exp_diff = (|diff[es+Bs:Bs]) ? {Bs{1'b1}} : diff[Bs-1:0];

//DSR Right Shifting
wire [N-1:0] DSR_right_in;
generate
	if (es >= 2) 
	assign DSR_right_in = {sm,{es-1{1'b0}}};
	else 
	assign DSR_right_in = sm;
endgenerate

wire [N-1:0] DSR_right_out;
wire [Bs-1:0] DSR_e_diff  = exp_diff;
DSR_right_N_S #(.N(N), .S(Bs))  dsr1(.a(DSR_right_in), .b(DSR_e_diff), .c(DSR_right_out));

//Mantissa Addition
wire [N-1:0] add_m_in1;
generate
	if (es >= 2) 
	assign add_m_in1 = {lm,{es-1{1'b0}}};
	else 
	assign add_m_in1 = lm;
endgenerate

wire [N:0] add_m;
add_sub_N #(.N(N)) uut_add_sub_N (op, add_m_in1, DSR_right_out, add_m);
wire [1:0] mant_ovf = add_m[N:N-1];

//LOD
wire [N-1:0] LOD_in = {(add_m[N] | add_m[N-1]), add_m[N-2:0]};
wire [Bs-1:0] left_shift;
LOD_N #(.N(N)) l2(.in(LOD_in), .out(left_shift));

//DSR Left Shifting
wire [N-1:0] DSR_left_out_t;
DSR_left_N_S #(.N(N), .S(Bs)) dsl1(.a(add_m[N:1]), .b(left_shift), .c(DSR_left_out_t));
wire [N-1:0] DSR_left_out = DSR_left_out_t[N-1] ? DSR_left_out_t[N-1:0] : {DSR_left_out_t[N-2:0],1'b0}; 


//Exponent and Regime Computation
wire [es+Bs+1:0] le_o_tmp, le_o;
sub_N #(.N(es+Bs+1)) sub3 ({lr_N,le}, {{es+1{1'b0}},left_shift}, le_o_tmp);
add_1 #(.N(es+Bs+1)) uut_add_mantovf (le_o_tmp, mant_ovf[1], le_o);

wire [es-1:0] e_o;
wire [Bs-1:0] r_o;
reg_exp_op #(.es(es), .Bs(Bs)) uut_reg_ro (le_o[es+Bs:0], e_o, r_o);

//Exponent and Mantissa Packing
wire [2*N-1+3:0] tmp_o;
generate
	if(es > 2)
		assign tmp_o = { {N{~le_o[es+Bs]}}, le_o[es+Bs], e_o, DSR_left_out[N-2:es-2], |DSR_left_out[es-3:0]};
	else 
		assign tmp_o = { {N{~le_o[es+Bs]}}, le_o[es+Bs], e_o, DSR_left_out[N-2:0], {3-es{1'b0}} };

endgenerate


//Including/Pushing Regime bits in Exponent-Mantissa Packing
wire [3*N-1+3:0] tmp1_o;
DSR_right_N_S #(.N(3*N+3), .S(Bs)) dsr2 (.a({tmp_o,{N{1'b0}}}), .b(r_o), .c(tmp1_o));


//Rounding RNE : ulp_add = G.(R + S) + L.G.(~(R+S))
wire L = tmp1_o[N+4], G = tmp1_o[N+3], R = tmp1_o[N+2], St = |tmp1_o[N+1:0],
     ulp = ((G & (R | St)) | (L & G & ~(R | St)));
wire [N-1:0] rnd_ulp = {{N-1{1'b0}},ulp};

wire [N:0] tmp1_o_rnd_ulp;
add_N #(.N(N)) uut_add_ulp (tmp1_o[2*N-1+3:N+3], rnd_ulp, tmp1_o_rnd_ulp);
wire [N-1:0] tmp1_o_rnd = (r_o < N-es-2) ? tmp1_o_rnd_ulp[N-1:0] : tmp1_o[2*N-1+3:N+3];


//Final Output
wire [N-1:0] tmp1_oN = ls ? -tmp1_o_rnd : tmp1_o_rnd;
assign out = inf|zero|(~DSR_left_out[N-1]) ? {inf,{N-1{1'b0}}} : {ls, tmp1_oN[N-1:1]},
	done = start0;

endmodule
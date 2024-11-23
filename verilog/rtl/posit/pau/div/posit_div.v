// Source: https://github.com/manish-kj/PACoGen/blob/master/div/posit_div.v

`timescale 1ns / 1ps

//(* use_dsp = "no" *)
module posit_div(in1, in2, start, out, inf, zero, done);
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
parameter es = 3;
parameter NR_Iter = 1;							// 2 for 32 bits, 1 for 16 bits, 0 for 8bits
parameter NRB = 2**NR_Iter;
parameter M = N-es;
parameter IW_MAX = 8;							//Max intial approximation storage bit-width
parameter IW = (NRB == 1 ) ? M : (M/NRB + ((M%NRB > 0) ? 1 : 0));	//(must be <= IW_MAX) 1/4th width of Mantissa: inverse width to be used in NR iterations multiplication 
parameter AW_MAX = 8;							//Max Address width of the intial approximation storage
parameter AW = (NRB == 1) ? M : (M/NRB + ((M%NRB > 0) ? 1 : 0));	//Actual address width used for initial approximation (AW must be <= AW_MAX)


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
assign inf = inf1 | zero2,
	zero = zero1 | inf2;

//Data Extraction
wire rc1, rc2;
wire [Bs-1:0] regime1, regime2;
wire [es-1:0] e1, e2;
wire [M-1:0] mant1, mant2;
wire [N-1:0] xin1 = s1 ? -in1 : in1;
wire [N-1:0] xin2 = s2 ? -in2 : in2;
data_extract_v1 #(.N(N),.es(es)) uut_de1(.in(xin1), .rc(rc1), .regime(regime1), .exp(e1), .mant(mant1));
data_extract_v1 #(.N(N),.es(es)) uut_de2(.in(xin2), .rc(rc2), .regime(regime2), .exp(e2), .mant(mant2));

wire [M:0] m1 = {zero_tmp1,mant1}, 
	m2 = {zero_tmp2,mant2};

//Sign, Exponent and Mantissa Computation
wire div_s = s1 ^ s2;

wire [Bs+1:0] r1 = rc1 ? {2'b0,regime1} : -regime1;
wire [Bs+1:0] r2 = rc2 ? {2'b0,regime2} : -regime2;

wire [IW_MAX:0] m2_inv0_tmp;
generate
	if (M >= AW_MAX) //for 2 NR iteration
		if (AW == AW_MAX)
			a1_inv_8bit9_lat0 i_uut (.clk(),.addr(m2[M-1:M-AW_MAX]),.dout(m2_inv0_tmp));
		else
			a1_inv_8bit9_lat0 i_uut (.clk(),.addr({m2[M-1:M-AW],{AW_MAX-AW{1'b0}}}),.dout(m2_inv0_tmp));
	else
		a1_inv_8bit9_lat0 i_uut (.clk(),.addr({m2[M-1:0],{AW_MAX-M{1'b0}}}),.dout(m2_inv0_tmp));//M =< AW_MAX, to use only a look-up table with 0-NR iteration.
endgenerate

wire [IW:0] m2_inv0;
assign m2_inv0 = m2_inv0_tmp[IW_MAX:IW_MAX-IW];

wire [2*M+1:0] div_m;
genvar i;
generate 
	wire [2*M+1:0] m2_inv [NR_Iter:0];

	if (NR_Iter > 0) begin
		assign m2_inv[0] = {1'b0,m2_inv0,{M-IW{1'b0}},{M{1'b0}}};
		wire [2*M+1:0] m2_inv_X_m2 [NR_Iter-1:0];
		wire [M+1:0] two_m2_inv_X_m2 [NR_Iter-1:0];
		for (i = 0; i < NR_Iter; i=i+1)begin : NR_Iteration
			assign m2_inv_X_m2[i] = {m2_inv[i][2*M:2*M-IW*(i+1)],{2*M-IW*(i+1)-M{1'b0}}} * m2;
			sub_N #(.N(M+1)) uut_sub_m2 ({1'b1,{M{1'b0}}}, {1'b0,m2_inv_X_m2[i][2*M+1:M+3],|m2_inv_X_m2[i][M+2:0]}, two_m2_inv_X_m2[i]);
			assign m2_inv[i+1] = {m2_inv[i][2*M:2*M-IW*(i+1)],{M-IW*(i+1){1'b0}}} * {two_m2_inv_X_m2[i][M-1:0],1'b0};
		end
	end
	else begin
		assign m2_inv[0] = {1'b0,m2_inv0,{M{1'b0}}};
	end
	assign div_m = ~|mant2 ? {1'b0,m1,{M{1'b0}}} : m1 * m2_inv[NR_Iter][2*M:M];

endgenerate

wire div_m_udf = div_m[2*M+1];
wire [2*M+1:0] div_mN = ~div_m_udf ? div_m << 1'b1 : div_m;

//Exponent and Regime Computation
wire bin = (~|mant2 | div_m_udf) ? 0 : 1;
wire [Bs+es+1:0] div_e;// = {r1, e1} - {r2, e2} - bin;// 1 + ~|mant2 + div_m_udf;
sub_N_Bin #(.N(Bs+es+1)) uut_div_e ({r1,e1}, {r2,e2}, bin, div_e);

wire [es-1:0] e_o;
wire [Bs:0] r_o;
reg_exp_op #(.es(es), .Bs(Bs)) uut_reg_ro (div_e[es+Bs+1:0], e_o, r_o);

//Exponent and Mantissa Packing
wire [2*N-1+3:0]tmp_o = {{N{~div_e[es+Bs+1]}},div_e[es+Bs+1],e_o,div_mN[2*M:2*M-(N-es-1)+1], div_mN[2*M-(N-es-1):2*M-(N-es-1)-1],|div_mN[2*M-(N-es-1)-2:0] };


//Including Regime bits in Exponent-Mantissa Packing
wire [3*N-1+3:0] tmp1_o;
DSR_right_N_S #(.N(3*N+3), .S(Bs+1)) dsr2 (.a({tmp_o,{N{1'b0}}}), .b(r_o[Bs] ? {Bs{1'b1}} : r_o), .c(tmp1_o));


//Rounding RNE : ulp_add = G.(R + S) + L.G.(~(R+S))
wire L = tmp1_o[N+4], G = tmp1_o[N+3], R = tmp1_o[N+2], St = |tmp1_o[N+1:0],
     ulp = ((G & (R | St)) | (L & G & ~(R | St)));
wire [N-1:0] rnd_ulp = {{N-1{1'b0}},ulp};

wire [N:0] tmp1_o_rnd_ulp;
add_N #(.N(N)) uut_add_ulp (tmp1_o[2*N-1+3:N+3], rnd_ulp, tmp1_o_rnd_ulp);
wire [N-1:0] tmp1_o_rnd = (r_o < M-2) ? tmp1_o_rnd_ulp[N-1:0] : tmp1_o[2*N-1+3:N+3];


//Final Output
wire [N-1:0] tmp1_oN = div_s ? -tmp1_o_rnd : tmp1_o_rnd;
assign out = inf|zero|(~div_mN[2*M+1]) ? {inf,{N-1{1'b0}}} : {div_s, tmp1_oN[N-1:1]},
	done = start0;

endmodule
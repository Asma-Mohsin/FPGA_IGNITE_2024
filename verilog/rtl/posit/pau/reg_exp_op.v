module reg_exp_op (exp_o, e_o, r_o);
parameter es=3;
parameter Bs=5;
input [es+Bs:0] exp_o;
output [es-1:0] e_o;
output [Bs-1:0] r_o;

assign e_o = exp_o[es-1:0];

wire [es+Bs:0] exp_oN_tmp;
conv_2c #(.N(es+Bs)) uut_conv_2c1 (~exp_o[es+Bs:0],exp_oN_tmp);
wire [es+Bs:0] exp_oN = exp_o[es+Bs] ? exp_oN_tmp[es+Bs:0] : exp_o[es+Bs:0];
assign r_o = (~exp_o[es+Bs] || |(exp_oN[es-1:0])) ? exp_oN[es+Bs-1:es] + 1 : exp_oN[es+Bs-1:es];
endmodule
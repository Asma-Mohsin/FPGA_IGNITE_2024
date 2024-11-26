module sub_N_Bin (a,b,bin,c);
parameter N=10;
input [N:0] a,b;
input bin;
output [N:0] c;
assign c = a - b - bin;
endmodule
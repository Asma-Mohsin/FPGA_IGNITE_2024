module add_N_Cin (a,b,cin,c);
parameter N=10;
input [N:0] a,b;
input cin;
output [N:0] c;
assign c = a + b + cin;
endmodule
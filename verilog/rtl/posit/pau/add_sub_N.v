module add_sub_N (op,a,b,c);
parameter N=10;
input op;
input [N-1:0] a,b;
output [N:0] c;
wire [N:0] c_add, c_sub;

add_N #(.N(N)) a11 (a,b,c_add);
sub_N #(.N(N)) s11 (a,b,c_sub);
assign c = op ? c_add : c_sub;
endmodule
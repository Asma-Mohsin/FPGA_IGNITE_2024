`timescale 1ns/1ps
/* verilator lint_off UNOPTFLAT*/
module ro_top #(
    parameter SIZE = 8
) (
    input clk,
    input en,
    output [SIZE-1:0] d_out
);

    reg  [  SIZE-1:0] d_out_internal;
    wire [2*SIZE-1:0] ro_out;
    wire [  SIZE-1:0] xor_out;

    // Generate ring oscillators
    genvar i;
    generate
        for (i = 0; i < SIZE; i = i + 1) begin
            generic_ro #(
                .SIZE(1)
            ) ro_1 (
                .en(en),
                .ro_out(ro_out[2*i])
            );  // 3-inv elements
            generic_ro #(
                .SIZE(2)
            ) ro_2 (
                .en(en),
                .ro_out(ro_out[2*i+1])
            );  // 5-inv elements
            assign xor_out[i] = ro_out[2*i] ^ ro_out[2*i+1];
        end
    endgenerate

    // FF that sample the XOR output
    always @(posedge clk) begin
        d_out_internal <= xor_out;
    end

    // Assign to output
    assign d_out = d_out_internal;

endmodule

// Meaning SIZE parameter:
// SIZE=1 : 2inv + NAND -> 3 inv elements
// SIZE=2 : 4inv + NAND -> 5 inv elements
// SIZE=3 : 6inv + NAND -> 7 inv elements
module generic_ro #(
    parameter SIZE = 2
) (
    input  en,
    output ro_out
);

    wire [2*SIZE:0] interm_wires;
    //assign #1 interm_wires[0] = ~(interm_wires[2*SIZE] & en);
    assign interm_wires[0] = ~(interm_wires[2*SIZE] & en);  // for synthesis
    assign ro_out = interm_wires[2*SIZE];

    genvar i;

    generate
        for (i = SIZE * 2; i > 0; i = i - 1) begin
            notGate n (
                interm_wires[i-1],
                interm_wires[i]
            );
        end
    endgenerate

endmodule




module notGate (
    a,
    inversedA
);

    input a;
    output inversedA;

    //assign #1 inversedA = ~a;
    assign inversedA = ~a;  // for synthesis

endmodule

module randModule (
    en,
    randOut
);
    input en;
    output randOut;

    wire w0;
    wire w1;
    wire w2;

    //assign #1 w0 = ~( w2 & en );
    assign w0 = ~(w2 & en);  // for synthesis
    notGate notGate_1 (
        w0,
        w1
    );
    notGate notGate_2 (
        w1,
        w2
    );
    assign randOut = w2;
endmodule
/* verilator lint_on UNOPTFLAT*/

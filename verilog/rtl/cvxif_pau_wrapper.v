`timescale 1ns / 1ps

// This module is used as a wrapper for the posit coprocessor since
// the number of logic analyzer signals is limited.
// register_rs0 and register_rs1 are connected to the same logic analyer pins
// and have to be loaded in one after another. This is possible since two
// possible values of register_rs_valid are unsused in the top module of the
// coprocessor. In the software it has to be made sure that the data is set
// before the register_rs_valid value is changed to the value which selects
// target register for the current data.

module cvxif_pau_wrapper (
    input             clk,
    input             rst,
    input             issue_valid,
    output reg        issue_ready,
    input      [31:0] issue_req_instr,
    output reg        issue_resp_accept,
    output            issue_resp_writeback,
    output reg [ 1:0] issue_resp_register_read,
    input             register_valid,
    output reg        register_state,
    input      [31:0] register_rs0_rs1,
    input      [ 1:0] register_rs_valid,
    output reg        result_valid,
    input             result_ready,
    output reg [31:0] result_data
);

    reg state;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            register_state <= 1'b0;
        end else begin
            if (register_state == 1'b0) begin
                // The software signalizes that rs0 is valid
                if ((register_rs_valid == 2'b00) && register_valid) begin
                    register_rs0   <= register_rs0_rs1;
                    // The hardware signalizes that rs1 has been written
                    register_state <= 1'b1;
                end
            end else begin
                if ((register_rs_valid == 2'b10) && register_valid) begin
                    register_rs1   <= register_rs0_rs1;
                    register_state <= 1'b0;
                end
            end
        end
    end



    cvxif_pau cvxif_pau_inst (
        .clk(clk),
        .rst(rst),
        .issue_valid(issue_valid),
        .issue_ready(issue_ready),
        .issue_req_instr(issue_req_instr),
        .issue_resp_accept(issue_resp_accept),
        .issue_resp_writeback(issue_resp_writeback),
        .issue_resp_register_read(issue_resp_register_read),
        .register_valid(register_valid),
        .register_ready(register_ready),
        .register_rs0(register_rs0),
        .register_rs1(register_rs1),
        .register_rs_valid(register_rs_valid),
        .result_valid(result_valid),
        .result_ready(result_ready),
        .result_data(result_data)
    );
endmodule

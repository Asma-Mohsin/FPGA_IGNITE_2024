`timescale 1ns / 1ps
/* verilator lint_off UNDRIVEN */
/* verilator lint_off UNUSEDSIGNAL */
/// sta-blackbox
(* blackbox *)
module cvxif_pau (
    input             clk,
    input             rst,
    input             issue_valid,
    output reg        issue_ready,
    input      [31:0] issue_req_instr,
    output reg        issue_resp_accept,
    output            issue_resp_writeback,
    output reg [ 1:0] issue_resp_register_read,
    input             register_valid,
    output            register_ready,
    input      [31:0] register_rs0,
    input      [31:0] register_rs1,
    input      [ 1:0] register_rs_valid,


    output reg        result_valid,
    input             result_ready,
    output reg [31:0] result_data
);

/* verilator lint_on UNDRIVEN */
/* verilator lint_on UNUSEDSIGNAL */
endmodule

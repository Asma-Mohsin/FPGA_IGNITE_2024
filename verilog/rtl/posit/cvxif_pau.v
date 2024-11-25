module cvxif_pau (
    clk,
    rst,
    issue_valid,
    issue_ready,
    issue_req_instr,
    issue_resp_accept,
    issue_resp_writeback,
    issue_resp_register_read,
    register_valid,
    register_ready,
    register_rs0,
    register_rs1,
    register_rs_valid,
    result_valid,
    result_ready,
    result_data
);
    input clk;
    input rst;
    input issue_valid;
    output reg issue_ready;
    input [31:0] issue_req_instr;
    output reg issue_resp_accept;
    output wire issue_resp_writeback;
    output reg [1:0] issue_resp_register_read;
    input register_valid;
    output wire register_ready;
    input [31:0] register_rs0;
    input [31:0] register_rs1;
    input [1:0] register_rs_valid;
    output reg result_valid;
    input result_ready;
    output reg [31:0] result_data;
    localparam COUNTER_LEN = 2;
    localparam PAU_WAIT_TIME = 3;
    localparam PAU_N = 16;
    localparam PAU_ES = 1;
    reg [2:0] op;
    reg [2:0] next_op;
    reg [15:0] a;
    reg [15:0] b;
    reg [15:0] next_a;
    reg [15:0] next_b;
    wire [15:0] c_add;
    wire [15:0] c_mul;
    wire [15:0] c_div;
    reg start;
    wire done_add;
    wire done_mul;
    wire done_div;
    reg [1:0] pau_wait_counter;
    reg [1:0] next_pau_wait_counter;
    reg add_i;
    reg add_z;
    reg mul_i;
    reg mul_z;
    reg div_i;
    reg div_z;

    assign register_ready = 1'b0;
    posit_add #(
        .N (PAU_N),
        .es(PAU_ES)
    ) u_posit_add (
        .in1  (a),
        .in2  (b),
        .start(start),
        .out  (c_add),
        .inf  (add_i),
        .zero (add_z),
        .done (done_add)
    );
    posit_mult #(
        .N (PAU_N),
        .es(PAU_ES)
    ) u_posit_mult (
        .in1  (a),
        .in2  (b),
        .start(start),
        .out  (c_mul),
        .inf  (mul_i),
        .zero (mul_z),
        .done (done_mul)
    );
    posit_div #(
        .N (PAU_N),
        .es(PAU_ES)
    ) u_posit_div (
        .in1  (a),
        .in2  (b),
        .start(start),
        .out  (c_div),
        .inf  (div_i),
        .zero (div_z),
        .done (done_div)
    );
    localparam ADD_OP = 3'b000;
    localparam SUB_OP = 3'b001;
    localparam MUL_OP = 3'b010;
    localparam DIV_OP = 3'b011;
    wire match_instruction;
    assign match_instruction = ((issue_req_instr[6:0] == 7'b1111011) && (issue_req_instr[31:25] == 7'b0000000)) && ((((issue_req_instr[14:12] == ADD_OP) || (issue_req_instr[14:12] == SUB_OP)) || (issue_req_instr[14:12] == MUL_OP)) || (issue_req_instr[14:12] == DIV_OP));
    assign issue_resp_writeback = 1'b1;
    wire done;
    assign done = (done_add | done_mul) | done_div;
    reg [1:0] current_state;
    reg [1:0] next_state;
    always @(posedge clk)
        if (rst) begin
            current_state <= 2'd0;
            pau_wait_counter <= 0;
            result_data <= 0;
        end else begin
            current_state <= next_state;
            op <= next_op;
            a <= next_a;
            b <= next_b;
            pau_wait_counter <= next_pau_wait_counter;
            if ((current_state == 2'd2) && (next_state == 2'd3))
                case (issue_req_instr[14:12])
                    ADD_OP: result_data <= c_add;
                    SUB_OP: result_data <= c_add;
                    MUL_OP: result_data <= c_mul;
                    DIV_OP: result_data <= c_div;
                endcase
        end
    always @(*) begin
        next_state = current_state;
        next_op = op;
        next_a = a;
        next_b = b;
        next_pau_wait_counter = pau_wait_counter;
        issue_ready = 1'b0;
        issue_resp_accept = 1'b0;
        result_valid = 1'b0;
        start = 1'b0;
        case (current_state)
            2'd0: begin
                issue_ready = 1'b1;
                if (issue_valid && match_instruction) begin
                    issue_resp_accept = 1'b1;
                    next_op = issue_req_instr[14:12];
                    issue_resp_register_read = 2'b11;
                    next_state = 2'd1;
                end
            end
            2'd1:
            if (register_valid && (register_rs_valid == 2'b11)) begin
                next_a = register_rs0[15:0];
                next_b = register_rs1[15:0];
                next_pau_wait_counter = {COUNTER_LEN{1'b0}};
                next_state = 2'd2;
            end
            2'd2: begin
                start = 1'b1;
                if (pau_wait_counter < PAU_WAIT_TIME) next_pau_wait_counter = pau_wait_counter + 1;
                else if (done && (pau_wait_counter == PAU_WAIT_TIME)) next_state = 2'd3;
            end
            2'd3: begin
                result_valid = 1'b1;
                if (result_ready) next_state = 2'd0;
            end
        endcase
    end
endmodule

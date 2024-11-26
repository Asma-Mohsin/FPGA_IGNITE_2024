`resetall
`default_nettype none
module mux4_cxu (
	clk,
	rst,
	clk_en,
	req_valid,
	req_ready,
	req_cxu,
	req_state,
	req_func,
	req_insn,
	req_data0,
	req_data1,
	resp_valid,
	resp_ready,
	resp_status,
	resp_data,
	t_req_valid,
	t_req_ready,
	t_req_cxu,
	t_req_state,
	t_req_func,
	t_req_insn,
	t_req_data0,
	t_req_data1,
	t_resp_valid,
	t_resp_ready,
	t_resp_status,
	t_resp_data
);
	parameter signed [31:0] CXU_LI_VERSION = 'h10000;
	parameter signed [31:0] CXU_N_CXUS = 4;
	parameter signed [31:0] CXU_N_STATES = 0;
	parameter signed [31:0] CXU_CXU_ID_W = $clog2(CXU_N_CXUS);
	parameter signed [31:0] CXU_STATE_ID_W = $clog2(CXU_N_STATES);
	parameter signed [31:0] CXU_FUNC_ID_W = 3;
	parameter signed [31:0] CXU_INSN_W = 0;
	parameter signed [31:0] CXU_DATA_W = 32;
	parameter signed [31:0] N_REQS = 16;
	input wire clk;
	input wire rst;
	input wire clk_en;
	input wire req_valid;
	output wire req_ready;
	function signed [31:0] common_pkg_max;
		input reg signed [31:0] a;
		input reg signed [31:0] b;
		common_pkg_max = (a >= b ? a : b);
	endfunction
	function signed [31:0] common_pkg_msb;
		input reg signed [31:0] width;
		common_pkg_msb = common_pkg_max(width - 1, 0);
	endfunction
	input wire [common_pkg_msb(CXU_CXU_ID_W):0] req_cxu;
	input wire [common_pkg_msb(CXU_STATE_ID_W):0] req_state;
	input wire [common_pkg_msb(CXU_FUNC_ID_W):0] req_func;
	input wire [common_pkg_msb(CXU_INSN_W):0] req_insn;
	input wire [common_pkg_msb(CXU_DATA_W):0] req_data0;
	input wire [common_pkg_msb(CXU_DATA_W):0] req_data1;
	output wire resp_valid;
	input wire resp_ready;
	localparam signed [31:0] cxu_pkg_CXU_STATUS_W = 3;
	output wire [2:0] resp_status;
	output wire [common_pkg_msb(CXU_DATA_W):0] resp_data;
	output reg t_req_valid;
	input wire t_req_ready;
	output reg [common_pkg_msb(CXU_CXU_ID_W):0] t_req_cxu;
	output reg [common_pkg_msb(CXU_STATE_ID_W):0] t_req_state;
	output reg [common_pkg_msb(CXU_FUNC_ID_W):0] t_req_func;
	output reg [common_pkg_msb(CXU_INSN_W):0] t_req_insn;
	output reg [common_pkg_msb(CXU_DATA_W):0] t_req_data0;
	output reg [common_pkg_msb(CXU_DATA_W):0] t_req_data1;
	input wire t_resp_valid;
	output reg t_resp_ready;
	input wire [2:0] t_resp_status;
	input wire [common_pkg_msb(CXU_DATA_W):0] t_resp_data;
	wire [common_pkg_msb(CXU_CXU_ID_W):0] t0_req_cxu;
	wire [common_pkg_msb(CXU_DATA_W):0] t0_req_data0;
	wire [common_pkg_msb(CXU_DATA_W):0] t0_req_data1;
	wire [common_pkg_msb(CXU_FUNC_ID_W):0] t0_req_func;
	wire [common_pkg_msb(CXU_INSN_W):0] t0_req_insn;
	reg t0_req_ready;
	wire [common_pkg_msb(CXU_STATE_ID_W):0] t0_req_state;
	wire t0_req_valid;
	reg [common_pkg_msb(CXU_DATA_W):0] t0_resp_data;
	wire t0_resp_ready;
	reg [2:0] t0_resp_status;
	reg t0_resp_valid;
	wire [common_pkg_msb(CXU_CXU_ID_W):0] t1_req_cxu;
	wire [common_pkg_msb(CXU_DATA_W):0] t1_req_data0;
	wire [common_pkg_msb(CXU_DATA_W):0] t1_req_data1;
	wire [common_pkg_msb(CXU_FUNC_ID_W):0] t1_req_func;
	wire [common_pkg_msb(CXU_INSN_W):0] t1_req_insn;
	reg t1_req_ready;
	wire [common_pkg_msb(CXU_STATE_ID_W):0] t1_req_state;
	wire t1_req_valid;
	reg [common_pkg_msb(CXU_DATA_W):0] t1_resp_data;
	wire t1_resp_ready;
	reg [2:0] t1_resp_status;
	reg t1_resp_valid;
	wire [common_pkg_msb(CXU_CXU_ID_W):0] t2_req_cxu;
	wire [common_pkg_msb(CXU_DATA_W):0] t2_req_data0;
	wire [common_pkg_msb(CXU_DATA_W):0] t2_req_data1;
	wire [common_pkg_msb(CXU_FUNC_ID_W):0] t2_req_func;
	wire [common_pkg_msb(CXU_INSN_W):0] t2_req_insn;
	reg t2_req_ready;
	wire [common_pkg_msb(CXU_STATE_ID_W):0] t2_req_state;
	wire t2_req_valid;
	reg [common_pkg_msb(CXU_DATA_W):0] t2_resp_data;
	wire t2_resp_ready;
	reg [2:0] t2_resp_status;
	reg t2_resp_valid;
	wire [common_pkg_msb(CXU_CXU_ID_W):0] t3_req_cxu;
	wire [common_pkg_msb(CXU_DATA_W):0] t3_req_data0;
	wire [common_pkg_msb(CXU_DATA_W):0] t3_req_data1;
	wire [common_pkg_msb(CXU_FUNC_ID_W):0] t3_req_func;
	wire [common_pkg_msb(CXU_INSN_W):0] t3_req_insn;
	reg t3_req_ready;
	wire [common_pkg_msb(CXU_STATE_ID_W):0] t3_req_state;
	wire t3_req_valid;
	reg [common_pkg_msb(CXU_DATA_W):0] t3_resp_data;
	wire t3_resp_ready;
	reg [2:0] t3_resp_status;
	reg t3_resp_valid;
	switch_cxu_core #(
		.CXU_LI_VERSION(CXU_LI_VERSION),
		.CXU_N_CXUS(CXU_N_CXUS),
		.CXU_N_STATES(CXU_N_STATES),
		.CXU_CXU_ID_W(CXU_CXU_ID_W),
		.CXU_STATE_ID_W(CXU_STATE_ID_W),
		.CXU_FUNC_ID_W(CXU_FUNC_ID_W),
		.CXU_INSN_W(CXU_INSN_W),
		.CXU_DATA_W(CXU_DATA_W),
		.N_INIS(1),
		.N_TGTS(4),
		.N_REQS(N_REQS)
	) core(
		.clk(clk),
		.rst(rst),
		.clk_en(clk_en),
		.i_req_valids(req_valid),
		.i_req_readys(req_ready),
		.i_req_cxus(req_cxu),
		.i_req_states(req_state),
		.i_req_funcs(req_func),
		.i_req_insns(req_insn),
		.i_req_data0s(req_data0),
		.i_req_data1s(req_data1),
		.i_resp_valids(resp_valid),
		.i_resp_readys(resp_ready),
		.i_resp_statuss(resp_status),
		.i_resp_datas(resp_data),
		.t_req_valids({t3_req_valid, t2_req_valid, t1_req_valid, t0_req_valid}),
		.t_req_readys({t3_req_ready, t2_req_ready, t1_req_ready, t0_req_ready}),
		.t_req_cxus({t3_req_cxu, t2_req_cxu, t1_req_cxu, t0_req_cxu}),
		.t_req_states({t3_req_state, t2_req_state, t1_req_state, t0_req_state}),
		.t_req_funcs({t3_req_func, t2_req_func, t1_req_func, t0_req_func}),
		.t_req_insns({t3_req_insn, t2_req_insn, t1_req_insn, t0_req_insn}),
		.t_req_data0s({t3_req_data0, t2_req_data0, t1_req_data0, t0_req_data0}),
		.t_req_data1s({t3_req_data1, t2_req_data1, t1_req_data1, t0_req_data1}),
		.t_resp_valids({t3_resp_valid, t2_resp_valid, t1_resp_valid, t0_resp_valid}),
		.t_resp_readys({t3_resp_ready, t2_resp_ready, t1_resp_ready, t0_resp_ready}),
		.t_resp_statuss({t3_resp_status, t2_resp_status, t1_resp_status, t0_resp_status}),
		.t_resp_datas({t3_resp_data, t2_resp_data, t1_resp_data, t0_resp_data})
	);
	reg [1:0] select;
	always @(clk)
		if (rst)
			select <= 2'b00;
		else if (req_valid)
			select <= req_cxu;
	always @(*)
		case (select)
			2'b00: begin
				t_req_valid = t0_req_valid;
				t_req_cxu = t0_req_cxu;
				t_req_state = t0_req_state;
				t_req_func = t0_req_func;
				t_req_insn = t0_req_insn;
				t_req_data0 = t0_req_data0;
				t_req_data1 = t0_req_data1;
				t_resp_ready = t0_resp_ready;
				t0_resp_valid = t_resp_valid;
				t0_req_ready = t_req_ready;
				t0_resp_status = t_resp_status;
				t0_resp_data = t_resp_data;
			end
			2'b01: begin
				t_req_valid = t1_req_valid;
				t_req_cxu = t1_req_cxu;
				t_req_state = t1_req_state;
				t_req_func = t1_req_func;
				t_req_insn = t1_req_insn;
				t_req_data0 = t1_req_data0;
				t_req_data1 = t1_req_data1;
				t_resp_ready = t1_resp_ready;
				t1_resp_valid = t_resp_valid;
				t1_req_ready = t_req_ready;
				t1_resp_status = t_resp_status;
				t1_resp_data = t_resp_data;
			end
			2'b10: begin
				t_req_valid = t2_req_valid;
				t_req_cxu = t2_req_cxu;
				t_req_state = t2_req_state;
				t_req_func = t2_req_func;
				t_req_insn = t2_req_insn;
				t_req_data0 = t2_req_data0;
				t_req_data1 = t2_req_data1;
				t_resp_ready = t2_resp_ready;
				t2_resp_valid = t_resp_valid;
				t2_req_ready = t_req_ready;
				t2_resp_status = t_resp_status;
				t2_resp_data = t_resp_data;
			end
			2'b11: begin
				t_req_valid = t3_req_valid;
				t_req_cxu = t3_req_cxu;
				t_req_state = t3_req_state;
				t_req_func = t3_req_func;
				t_req_insn = t3_req_insn;
				t_req_data0 = t3_req_data0;
				t_req_data1 = t3_req_data1;
				t_resp_ready = t3_resp_ready;
				t3_resp_valid = t_resp_valid;
				t3_req_ready = t_req_ready;
				t3_resp_status = t_resp_status;
				t3_resp_data = t_resp_data;
			end
		endcase
endmodule

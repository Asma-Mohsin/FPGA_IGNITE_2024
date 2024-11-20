
//Warning the following primitive mux4_cxu was added automatically.
(* blackbox, keep *)
module mux4_cxu (
	CLK,
  // UserCLK,
	rst,
	// clk_en,
  UserCLK_en,
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
	input wire CLK;
	// input wire clk;
	input wire rst;
	// input wire clk_en;
  input wire UserCLK_en;
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
endmodule

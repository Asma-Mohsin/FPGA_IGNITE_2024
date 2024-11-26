`resetall
`default_nettype none
module switch_cxu_core (
	clk,
	rst,
	clk_en,
	i_req_valids,
	i_req_readys,
	i_req_cxus,
	i_req_states,
	i_req_funcs,
	i_req_insns,
	i_req_data0s,
	i_req_data1s,
	i_resp_valids,
	i_resp_readys,
	i_resp_statuss,
	i_resp_datas,
	t_req_valids,
	t_req_readys,
	t_req_cxus,
	t_req_states,
	t_req_funcs,
	t_req_insns,
	t_req_data0s,
	t_req_data1s,
	t_resp_valids,
	t_resp_readys,
	t_resp_statuss,
	t_resp_datas
);
	parameter signed [31:0] CXU_LI_VERSION = 'h10000;
	parameter signed [31:0] CXU_N_CXUS = 4;
	parameter signed [31:0] CXU_N_STATES = 1;
	parameter signed [31:0] CXU_CXU_ID_W = $clog2(CXU_N_CXUS);
	parameter signed [31:0] CXU_STATE_ID_W = $clog2(CXU_N_STATES);
	parameter signed [31:0] CXU_FUNC_ID_W = 3;
	parameter signed [31:0] CXU_INSN_W = 0;
	parameter signed [31:0] CXU_DATA_W = 32;
	parameter signed [31:0] N_INIS = 1;
	parameter signed [31:0] N_TGTS = CXU_N_CXUS;
	parameter signed [31:0] N_REQS = 16;
	input wire clk;
	input wire rst;
	input wire clk_en;
	function signed [31:0] common_pkg_max;
		input reg signed [31:0] a;
		input reg signed [31:0] b;
		common_pkg_max = (a >= b ? a : b);
	endfunction
	function signed [31:0] common_pkg_msb;
		input reg signed [31:0] width;
		common_pkg_msb = common_pkg_max(width - 1, 0);
	endfunction
	input wire [common_pkg_msb(N_INIS):0] i_req_valids;
	output reg [common_pkg_msb(N_INIS):0] i_req_readys;
	input wire [(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? (N_INIS * (common_pkg_msb(CXU_CXU_ID_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(CXU_CXU_ID_W))) + (common_pkg_msb(CXU_CXU_ID_W) - 1)):(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_CXU_ID_W) + 0)] i_req_cxus;
	input wire [(common_pkg_msb(CXU_STATE_ID_W) >= 0 ? (N_INIS * (common_pkg_msb(CXU_STATE_ID_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(CXU_STATE_ID_W))) + (common_pkg_msb(CXU_STATE_ID_W) - 1)):(common_pkg_msb(CXU_STATE_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_STATE_ID_W) + 0)] i_req_states;
	input wire [(common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? (N_INIS * (common_pkg_msb(CXU_FUNC_ID_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(CXU_FUNC_ID_W))) + (common_pkg_msb(CXU_FUNC_ID_W) - 1)):(common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_FUNC_ID_W) + 0)] i_req_funcs;
	input wire [(common_pkg_msb(CXU_INSN_W) >= 0 ? (N_INIS * (common_pkg_msb(CXU_INSN_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(CXU_INSN_W))) + (common_pkg_msb(CXU_INSN_W) - 1)):(common_pkg_msb(CXU_INSN_W) >= 0 ? 0 : common_pkg_msb(CXU_INSN_W) + 0)] i_req_insns;
	input wire [(common_pkg_msb(CXU_DATA_W) >= 0 ? (N_INIS * (common_pkg_msb(CXU_DATA_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(CXU_DATA_W))) + (common_pkg_msb(CXU_DATA_W) - 1)):(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W) + 0)] i_req_data0s;
	input wire [(common_pkg_msb(CXU_DATA_W) >= 0 ? (N_INIS * (common_pkg_msb(CXU_DATA_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(CXU_DATA_W))) + (common_pkg_msb(CXU_DATA_W) - 1)):(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W) + 0)] i_req_data1s;
	output reg [common_pkg_msb(N_INIS):0] i_resp_valids;
	input wire [common_pkg_msb(N_INIS):0] i_resp_readys;
	localparam signed [31:0] cxu_pkg_CXU_STATUS_W = 3;
	output reg [(common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? (N_INIS * (common_pkg_msb(cxu_pkg_CXU_STATUS_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(cxu_pkg_CXU_STATUS_W))) + (common_pkg_msb(cxu_pkg_CXU_STATUS_W) - 1)):(common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? 0 : common_pkg_msb(cxu_pkg_CXU_STATUS_W) + 0)] i_resp_statuss;
	output reg [(common_pkg_msb(CXU_DATA_W) >= 0 ? (N_INIS * (common_pkg_msb(CXU_DATA_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(CXU_DATA_W))) + (common_pkg_msb(CXU_DATA_W) - 1)):(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W) + 0)] i_resp_datas;
	output reg [common_pkg_msb(N_TGTS):0] t_req_valids;
	input wire [common_pkg_msb(N_TGTS):0] t_req_readys;
	output reg [(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? (N_TGTS * (common_pkg_msb(CXU_CXU_ID_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(CXU_CXU_ID_W))) + (common_pkg_msb(CXU_CXU_ID_W) - 1)):(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_CXU_ID_W) + 0)] t_req_cxus;
	output reg [(common_pkg_msb(CXU_STATE_ID_W) >= 0 ? (N_TGTS * (common_pkg_msb(CXU_STATE_ID_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(CXU_STATE_ID_W))) + (common_pkg_msb(CXU_STATE_ID_W) - 1)):(common_pkg_msb(CXU_STATE_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_STATE_ID_W) + 0)] t_req_states;
	output reg [(common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? (N_TGTS * (common_pkg_msb(CXU_FUNC_ID_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(CXU_FUNC_ID_W))) + (common_pkg_msb(CXU_FUNC_ID_W) - 1)):(common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_FUNC_ID_W) + 0)] t_req_funcs;
	output reg [(common_pkg_msb(CXU_INSN_W) >= 0 ? (N_TGTS * (common_pkg_msb(CXU_INSN_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(CXU_INSN_W))) + (common_pkg_msb(CXU_INSN_W) - 1)):(common_pkg_msb(CXU_INSN_W) >= 0 ? 0 : common_pkg_msb(CXU_INSN_W) + 0)] t_req_insns;
	output reg [(common_pkg_msb(CXU_DATA_W) >= 0 ? (N_TGTS * (common_pkg_msb(CXU_DATA_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(CXU_DATA_W))) + (common_pkg_msb(CXU_DATA_W) - 1)):(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W) + 0)] t_req_data0s;
	output reg [(common_pkg_msb(CXU_DATA_W) >= 0 ? (N_TGTS * (common_pkg_msb(CXU_DATA_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(CXU_DATA_W))) + (common_pkg_msb(CXU_DATA_W) - 1)):(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W) + 0)] t_req_data1s;
	input wire [common_pkg_msb(N_TGTS):0] t_resp_valids;
	output reg [common_pkg_msb(N_TGTS):0] t_resp_readys;
	input wire [(common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? (N_TGTS * (common_pkg_msb(cxu_pkg_CXU_STATUS_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(cxu_pkg_CXU_STATUS_W))) + (common_pkg_msb(cxu_pkg_CXU_STATUS_W) - 1)):(common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? 0 : common_pkg_msb(cxu_pkg_CXU_STATUS_W) + 0)] t_resp_statuss;
	input wire [(common_pkg_msb(CXU_DATA_W) >= 0 ? (N_TGTS * (common_pkg_msb(CXU_DATA_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(CXU_DATA_W))) + (common_pkg_msb(CXU_DATA_W) - 1)):(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W) + 0)] t_resp_datas;
	localparam signed [31:0] INI_W = $clog2(N_INIS);
	localparam signed [31:0] TGT_W = $clog2(N_TGTS);
	localparam signed [31:0] N_REQS_W = $clog2(N_REQS);
	reg [(common_pkg_msb(N_REQS_W) >= 0 ? (N_INIS * (common_pkg_msb(N_REQS_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(N_REQS_W))) + (common_pkg_msb(N_REQS_W) - 1)):(common_pkg_msb(N_REQS_W) >= 0 ? 0 : common_pkg_msb(N_REQS_W) + 0)] i_n_reqs;
	reg [(common_pkg_msb(TGT_W) >= 0 ? (N_INIS * (common_pkg_msb(TGT_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(TGT_W))) + (common_pkg_msb(TGT_W) - 1)):(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W) + 0)] i_tgts;
	reg [(common_pkg_msb(INI_W) >= 0 ? (N_TGTS * (common_pkg_msb(INI_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(INI_W))) + (common_pkg_msb(INI_W) - 1)):(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W) + 0)] t_inis;
	function automatic [(common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W)) - 1:0] sv2v_cast_4F309;
		input reg [(common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W)) - 1:0] inp;
		sv2v_cast_4F309 = inp;
	endfunction
	function automatic [(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)) - 1:0] sv2v_cast_69A03;
		input reg [(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)) - 1:0] inp;
		sv2v_cast_69A03 = inp;
	endfunction
	function i_eligible;
		input reg signed [31:0] i;
		input reg signed [31:0] t;
		i_eligible = (i_n_reqs[(common_pkg_msb(N_REQS_W) >= 0 ? 0 : common_pkg_msb(N_REQS_W)) + (i * (common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W)))+:(common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W))] == sv2v_cast_4F309(0)) || ((i_n_reqs[(common_pkg_msb(N_REQS_W) >= 0 ? 0 : common_pkg_msb(N_REQS_W)) + (i * (common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W)))+:(common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W))] != sv2v_cast_4F309(N_REQS - 1)) && (i_tgts[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (i * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))] == sv2v_cast_69A03(t)));
	endfunction
	reg [common_pkg_msb(N_TGTS):0] t_xfers;
	reg [common_pkg_msb(N_INIS):0] i_xfers;
	reg [(common_pkg_msb(INI_W) >= 0 ? (N_TGTS * (common_pkg_msb(INI_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(INI_W))) + (common_pkg_msb(INI_W) - 1)):(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W) + 0)] t_inis_nxt;
	reg [(common_pkg_msb(TGT_W) >= 0 ? (N_INIS * (common_pkg_msb(TGT_W) + 1)) - 1 : (N_INIS * (1 - common_pkg_msb(TGT_W))) + (common_pkg_msb(TGT_W) - 1)):(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W) + 0)] i_tgts_nxt;
	reg [common_pkg_msb(N_INIS):0] i_req_hss;
	reg [common_pkg_msb(N_INIS):0] i_resp_hss;
	reg [common_pkg_msb(N_TGTS):0] t_req_hss;
	reg [common_pkg_msb(N_TGTS):0] t_resp_hss;
	reg [common_pkg_msb(N_INIS):0] i_resp_avails;
	reg [common_pkg_msb(N_TGTS):0] t_req_avails;
	always @(*) begin
		i_req_hss = i_req_valids & i_req_readys;
		i_resp_hss = i_resp_valids & i_resp_readys;
		t_req_hss = t_req_valids & t_req_readys;
		t_resp_hss = t_resp_valids & t_resp_readys;
		i_resp_avails = ~i_resp_valids | i_resp_readys;
		t_req_avails = ~t_req_valids | t_req_readys;
	end
	always @(posedge clk)
		if (rst) begin
			i_n_reqs <= 1'sb0;
			i_tgts <= 1'sb0;
		end
		else if (clk_en) begin : sv2v_autoblock_1
			reg signed [31:0] i;
			for (i = 0; i < N_INIS; i = i + 1)
				begin
					if (i_req_hss[i] != i_resp_hss[i])
						i_n_reqs[(common_pkg_msb(N_REQS_W) >= 0 ? 0 : common_pkg_msb(N_REQS_W)) + (i * (common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W)))+:(common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W))] <= (i_req_hss[i] ? i_n_reqs[(common_pkg_msb(N_REQS_W) >= 0 ? 0 : common_pkg_msb(N_REQS_W)) + (i * (common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W)))+:(common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W))] + 1'b1 : i_n_reqs[(common_pkg_msb(N_REQS_W) >= 0 ? 0 : common_pkg_msb(N_REQS_W)) + (i * (common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W)))+:(common_pkg_msb(N_REQS_W) >= 0 ? common_pkg_msb(N_REQS_W) + 1 : 1 - common_pkg_msb(N_REQS_W))] - 1'b1);
					if (i_req_hss[i])
						i_tgts[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (i * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))] <= i_tgts_nxt[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (i * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))];
				end
		end
	wire [common_pkg_msb(N_TGTS):0] t_readys;
	reg [common_pkg_msb(N_INIS):0] i_matchs;
	generate
		if (N_INIS > 1) begin : plural
			wire [common_pkg_msb(N_TGTS):0] valids;
			wire [(common_pkg_msb(INI_W) >= 0 ? (N_TGTS * (common_pkg_msb(INI_W) + 1)) - 1 : (N_TGTS * (1 - common_pkg_msb(INI_W))) + (common_pkg_msb(INI_W) - 1)):(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W) + 0)] heads;
			genvar t;
			for (t = 0; t < N_TGTS; t = t + 1) begin : qs
				queue #(
					.W(INI_W),
					.N(N_REQS)
				) q(
					.clk(clk),
					.rst(rst),
					.clk_en(clk_en),
					.i_valid(t_req_hss[t]),
					.i_ready(t_readys[t]),
					.i(t_inis[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))]),
					.o_valid(valids[t]),
					.o_ready(t_resp_hss[t]),
					.o(heads[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))])
				);
			end
			always @(*) begin : sv2v_autoblock_2
				reg signed [31:0] i;
				for (i = 0; i < N_INIS; i = i + 1)
					i_matchs[i] = valids[i_tgts[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (i * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))]] && (heads[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (i_tgts[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (i * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))] * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))] == i);
			end
		end
		else begin : genblk1
			assign t_readys = 1'sb1;
			wire [(common_pkg_msb(N_INIS) >= 0 ? common_pkg_msb(N_INIS) + 1 : 1 - common_pkg_msb(N_INIS)):1] sv2v_tmp_0DA48;
			assign sv2v_tmp_0DA48 = 1'sb1;
			always @(*) i_matchs = sv2v_tmp_0DA48;
		end
	endgenerate
	function automatic [(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)) - 1:0] sv2v_cast_2A3DA;
		input reg [(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)) - 1:0] inp;
		sv2v_cast_2A3DA = inp;
	endfunction
	function automatic [common_pkg_msb(INI_W):0] i_pri_enc;
		input reg [common_pkg_msb(N_INIS):0] vector;
		input reg [common_pkg_msb(INI_W):0] last;
		reg [common_pkg_msb(INI_W):0] ini;
		reg found;
		begin
			ini = 0;
			found = 0;
			begin : sv2v_autoblock_3
				reg signed [31:0] pass;
				for (pass = 0; pass < 2; pass = pass + 1)
					begin : sv2v_autoblock_4
						reg signed [31:0] i;
						for (i = 0; i < N_INIS; i = i + 1)
							if (!found && (((i > last) || (pass == 1)) && vector[i])) begin
								found = 1;
								ini = sv2v_cast_2A3DA(i);
							end
					end
			end
			i_pri_enc = ini;
		end
	endfunction
	function automatic [(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? common_pkg_msb(CXU_CXU_ID_W) + 1 : 1 - common_pkg_msb(CXU_CXU_ID_W)) - 1:0] sv2v_cast_BC7A4;
		input reg [(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? common_pkg_msb(CXU_CXU_ID_W) + 1 : 1 - common_pkg_msb(CXU_CXU_ID_W)) - 1:0] inp;
		sv2v_cast_BC7A4 = inp;
	endfunction
	always @(t_readys or t_req_avails or t_inis or i_tgts or i_n_reqs or i_n_reqs or i_req_cxus or i_req_valids) begin
		i_req_readys = 1'sb0;
		t_xfers = 1'sb0;
		t_inis_nxt = 1'sb0;
		i_tgts_nxt = 1'sb0;
		begin : sv2v_autoblock_5
			reg signed [31:0] t;
			for (t = 0; t < N_TGTS; t = t + 1)
				begin : sv2v_autoblock_6
					reg [common_pkg_msb(N_INIS):0] i_req_mask;
					reg [common_pkg_msb(INI_W):0] ini;
					i_req_mask = 1'sb0;
					begin : sv2v_autoblock_7
						reg signed [31:0] i;
						for (i = 0; i < N_INIS; i = i + 1)
							if ((i_req_valids[i] && (i_req_cxus[(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_CXU_ID_W)) + (i * (common_pkg_msb(CXU_CXU_ID_W) >= 0 ? common_pkg_msb(CXU_CXU_ID_W) + 1 : 1 - common_pkg_msb(CXU_CXU_ID_W)))+:(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? common_pkg_msb(CXU_CXU_ID_W) + 1 : 1 - common_pkg_msb(CXU_CXU_ID_W))] == sv2v_cast_BC7A4(t))) && i_eligible(i, t))
								i_req_mask[i] = 1;
					end
					ini = i_pri_enc(i_req_mask, t_inis[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))]);
					if (((i_req_mask != 0) && t_req_avails[t]) && t_readys[t]) begin
						t_xfers[t] = 1;
						i_req_readys[ini] = 1;
						t_inis_nxt[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))] = ini;
						i_tgts_nxt[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (ini * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))] = sv2v_cast_69A03(t);
					end
				end
		end
	end
	always @(posedge clk)
		if (rst) begin
			t_inis <= 1'sb0;
			t_req_valids <= 1'sb0;
			t_req_cxus <= 1'sb0;
			t_req_states <= 1'sb0;
			t_req_funcs <= 1'sb0;
			t_req_insns <= 1'sb0;
			t_req_data0s <= 1'sb0;
			t_req_data1s <= 1'sb0;
		end
		else if (clk_en) begin : sv2v_autoblock_8
			reg signed [31:0] t;
			for (t = 0; t < N_TGTS; t = t + 1)
				if (t_xfers[t]) begin
					t_inis[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))] <= sv2v_cast_2A3DA(t_inis_nxt[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))]);
					t_req_valids[t] <= 1;
					t_req_cxus[(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_CXU_ID_W)) + (t * (common_pkg_msb(CXU_CXU_ID_W) >= 0 ? common_pkg_msb(CXU_CXU_ID_W) + 1 : 1 - common_pkg_msb(CXU_CXU_ID_W)))+:(common_pkg_msb(CXU_CXU_ID_W) >= 0 ? common_pkg_msb(CXU_CXU_ID_W) + 1 : 1 - common_pkg_msb(CXU_CXU_ID_W))] <= 1'sb0;
					t_req_states[(common_pkg_msb(CXU_STATE_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_STATE_ID_W)) + (t * (common_pkg_msb(CXU_STATE_ID_W) >= 0 ? common_pkg_msb(CXU_STATE_ID_W) + 1 : 1 - common_pkg_msb(CXU_STATE_ID_W)))+:(common_pkg_msb(CXU_STATE_ID_W) >= 0 ? common_pkg_msb(CXU_STATE_ID_W) + 1 : 1 - common_pkg_msb(CXU_STATE_ID_W))] <= i_req_states[(common_pkg_msb(CXU_STATE_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_STATE_ID_W)) + (t_inis_nxt[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))] * (common_pkg_msb(CXU_STATE_ID_W) >= 0 ? common_pkg_msb(CXU_STATE_ID_W) + 1 : 1 - common_pkg_msb(CXU_STATE_ID_W)))+:(common_pkg_msb(CXU_STATE_ID_W) >= 0 ? common_pkg_msb(CXU_STATE_ID_W) + 1 : 1 - common_pkg_msb(CXU_STATE_ID_W))];
					t_req_funcs[(common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_FUNC_ID_W)) + (t * (common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? common_pkg_msb(CXU_FUNC_ID_W) + 1 : 1 - common_pkg_msb(CXU_FUNC_ID_W)))+:(common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? common_pkg_msb(CXU_FUNC_ID_W) + 1 : 1 - common_pkg_msb(CXU_FUNC_ID_W))] <= i_req_funcs[(common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? 0 : common_pkg_msb(CXU_FUNC_ID_W)) + (t_inis_nxt[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))] * (common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? common_pkg_msb(CXU_FUNC_ID_W) + 1 : 1 - common_pkg_msb(CXU_FUNC_ID_W)))+:(common_pkg_msb(CXU_FUNC_ID_W) >= 0 ? common_pkg_msb(CXU_FUNC_ID_W) + 1 : 1 - common_pkg_msb(CXU_FUNC_ID_W))];
					t_req_insns[(common_pkg_msb(CXU_INSN_W) >= 0 ? 0 : common_pkg_msb(CXU_INSN_W)) + (t * (common_pkg_msb(CXU_INSN_W) >= 0 ? common_pkg_msb(CXU_INSN_W) + 1 : 1 - common_pkg_msb(CXU_INSN_W)))+:(common_pkg_msb(CXU_INSN_W) >= 0 ? common_pkg_msb(CXU_INSN_W) + 1 : 1 - common_pkg_msb(CXU_INSN_W))] <= i_req_insns[(common_pkg_msb(CXU_INSN_W) >= 0 ? 0 : common_pkg_msb(CXU_INSN_W)) + (t_inis_nxt[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))] * (common_pkg_msb(CXU_INSN_W) >= 0 ? common_pkg_msb(CXU_INSN_W) + 1 : 1 - common_pkg_msb(CXU_INSN_W)))+:(common_pkg_msb(CXU_INSN_W) >= 0 ? common_pkg_msb(CXU_INSN_W) + 1 : 1 - common_pkg_msb(CXU_INSN_W))];
					t_req_data0s[(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W)) + (t * (common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W)))+:(common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W))] <= i_req_data0s[(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W)) + (t_inis_nxt[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))] * (common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W)))+:(common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W))];
					t_req_data1s[(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W)) + (t * (common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W)))+:(common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W))] <= i_req_data1s[(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W)) + (t_inis_nxt[(common_pkg_msb(INI_W) >= 0 ? 0 : common_pkg_msb(INI_W)) + (t * (common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W)))+:(common_pkg_msb(INI_W) >= 0 ? common_pkg_msb(INI_W) + 1 : 1 - common_pkg_msb(INI_W))] * (common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W)))+:(common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W))];
				end
				else if (t_req_readys[t])
					t_req_valids[t] <= 0;
		end
	always @(*) begin
		i_xfers = 1'sb0;
		t_resp_readys = 1'sb0;
		begin : sv2v_autoblock_9
			reg signed [31:0] i;
			for (i = 0; i < N_INIS; i = i + 1)
				if ((i_resp_avails[i] && i_matchs[i]) && t_resp_valids[i_tgts[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (i * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))]]) begin
					i_xfers[i] = 1;
					t_resp_readys[i_tgts[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (i * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))]] = 1;
				end
		end
	end
	always @(posedge clk)
		if (rst) begin
			i_resp_valids <= 1'sb0;
			i_resp_statuss <= 1'sb0;
			i_resp_datas <= 1'sb0;
		end
		else if (clk_en) begin : sv2v_autoblock_10
			reg signed [31:0] i;
			for (i = 0; i < N_INIS; i = i + 1)
				if (i_xfers[i]) begin
					i_resp_valids[i] <= 1;
					i_resp_statuss[(common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? 0 : common_pkg_msb(cxu_pkg_CXU_STATUS_W)) + (i * (common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? common_pkg_msb(cxu_pkg_CXU_STATUS_W) + 1 : 1 - common_pkg_msb(cxu_pkg_CXU_STATUS_W)))+:(common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? common_pkg_msb(cxu_pkg_CXU_STATUS_W) + 1 : 1 - common_pkg_msb(cxu_pkg_CXU_STATUS_W))] <= t_resp_statuss[(common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? 0 : common_pkg_msb(cxu_pkg_CXU_STATUS_W)) + (i_tgts[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (i * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))] * (common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? common_pkg_msb(cxu_pkg_CXU_STATUS_W) + 1 : 1 - common_pkg_msb(cxu_pkg_CXU_STATUS_W)))+:(common_pkg_msb(cxu_pkg_CXU_STATUS_W) >= 0 ? common_pkg_msb(cxu_pkg_CXU_STATUS_W) + 1 : 1 - common_pkg_msb(cxu_pkg_CXU_STATUS_W))];
					i_resp_datas[(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W)) + (i * (common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W)))+:(common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W))] <= t_resp_datas[(common_pkg_msb(CXU_DATA_W) >= 0 ? 0 : common_pkg_msb(CXU_DATA_W)) + (i_tgts[(common_pkg_msb(TGT_W) >= 0 ? 0 : common_pkg_msb(TGT_W)) + (i * (common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W)))+:(common_pkg_msb(TGT_W) >= 0 ? common_pkg_msb(TGT_W) + 1 : 1 - common_pkg_msb(TGT_W))] * (common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W)))+:(common_pkg_msb(CXU_DATA_W) >= 0 ? common_pkg_msb(CXU_DATA_W) + 1 : 1 - common_pkg_msb(CXU_DATA_W))];
				end
				else if (i_resp_readys[i])
					i_resp_valids[i] <= 0;
		end
endmodule

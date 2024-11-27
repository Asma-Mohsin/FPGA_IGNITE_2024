`timescale 1ns / 1ps

/* verilator lint_off UNOPTFLAT */
module flexbex_soc_top #(
) (
    `ifdef USE_POWER_PINS
	input wire vccd1,
	input wire vssd1,
`endif

    //Config related ports
    input clk,
    input resetn,
    input SelfWriteStrobe,
    input [31:0] SelfWriteData,
    input Rx,
    output ComActive,
    output ReceiveLED,
    input s_clk,
    input s_data,
    //efpga_top related ports
    output [23:0] A_config_C,
    output [23:0] B_config_C,
    output [23:0] Config_accessC,
    output [11:0] I_top,
    input [11:0] O_top,
    output [11:0] T_top,
    // eFPGA user interface padding ports
    output [78:0] UIO_TOP_UOUT_PAD,
    input [11:0] UIO_TOP_UIN_PAD, // 16 + 20 - 25 = 11 bits
    output [159:0] UIO_BOT_UOUT_PAD,
    input [159:0] UIO_BOT_UIN_PAD
);
    wire [159:0] UIO_BOT_UIN;
    wire [159:0] UIO_BOT_UOUT;
    wire [159:0] UIO_TOP_UIN;
    wire [159:0] UIO_TOP_UOUT;

    //general
    wire ibex_debug_req_i;
    wire ibex_fetch_enable_i;
    //irq
    wire ibex_irq_i;
    wire [4:0] ibex_irq_id_i;
    wire [4:0] ibex_irq_id_o;
    wire ibex_irq_ack_o;
    // ---------------------- 8 inputs / 6 outputs

    //instruction memory --> eFPGA
    wire [31:0] mem_instr_rdata_i;
    wire mem_instr_gnt_i;
    wire mem_instr_rvalid_i;
    // 32 bits but just 12 bits are used, since the memory macro just supports 12 bits
    /* verilator lint_off UNUSEDSIGNAL */
    wire [31:0] mem_instr_addr_o;
    /* verilator lint_on UNUSEDSIGNAL */
    wire mem_instr_req_o;
    // ------------------- 34 inputs / 14 outputs

    // data memory --> sram macro
    wire [31:0] mem_data_rdata_i;
    wire mem_data_gnt_i;
    wire mem_data_rvalid_i;
    wire [31:0] mem_data_wdata_o;
    // just 12 bits are used, since the memory macro just supports 12 bits
    /* verilator lint_off UNUSEDSIGNAL */
    wire [31:0] mem_data_addr_o;
    /* verilator lint_on UNUSEDSIGNAL */
    wire [3:0] mem_data_be_o;
    wire mem_data_req_o;
    wire mem_data_we_o;
    // ------------------- 34 inputs / 50  outputs --> sram macro

    //cxu
    wire [31:0] cx_req_data0_o;
    wire [31:0] cx_req_data1_o;
    wire [31:0] cx_insn_o;
    wire [24:0] cx_func_o;
    wire [1:0] cx_virt_state_id_o;
    wire [1:0] cx_cxu_id_o;
    wire [1:0] cx_state_id_o;
    wire cx_resp_valid_i;  // 1 bit
    wire cx_rst_o;
    wire cx_req_valid_o;
    // ------------------- 131 outputs - 59 not connected = 72 outputs
    wire [31:0] cx_resp_data_i;
    wire cx_resp_state_i;
    // ------------------- 38 inputs
    wire [3:0] cx_resp_status_i;

    // Set to constant 1 to keep the data valid
    assign mem_data_rvalid_i = 1'b1;

    assign {  //140 bits ibex inputs <-> eFPGA outputs
            UIO_TOP_UOUT_PAD,
            ibex_debug_req_i,  // 1 bit
            ibex_fetch_enable_i,  // 1 bit
            ibex_irq_i,  // 1 bit
            ibex_irq_id_i,  // 5 bits
            cx_resp_valid_i,  // 1 bit
            cx_resp_state_i,  // 1 bit
            cx_resp_status_i,  // 4 bits
            cx_resp_data_i,  // 32 bits
            mem_data_gnt_i,  // 1 bit ??? not sure
            // mem_data_rvalid_i,  // 1 bit ??? not sure
            mem_instr_gnt_i,  // 1 bit
            mem_instr_rvalid_i,  // 1 bit
            mem_instr_rdata_i  //32 bits
        } = UIO_TOP_UOUT;  //79

    assign UIO_TOP_UIN = {  //140 bits ibex outputs <-> eFPGA inputs
            UIO_TOP_UIN_PAD,
            ibex_irq_ack_o,  // 1 bit
            ibex_irq_id_o,  // 5 bits
            cx_rst_o,  // 1 bit
            cx_virt_state_id_o,  // 2 bits
            cx_cxu_id_o,  // 2 bits
            cx_state_id_o,  // 2 bits
            cx_req_valid_o,  // 1 bit
            cx_func_o,  // 25
            cx_insn_o,  // 32 bits
            cx_req_data1_o,  // 32 bits
            cx_req_data0_o,  // 32 bits
            mem_instr_req_o,  // 1 bit
            mem_instr_addr_o[11:0]  // has 32 bits but our ram only supports 12 bit addressing
        };  //126

    assign UIO_BOT_UOUT_PAD = UIO_BOT_UOUT;

    assign UIO_BOT_UIN = UIO_BOT_UIN_PAD;

    // we only conncect DATA memory to this 1kb ram block
    // instruction memory is connected to the fabric
    /* verilator lint_off PINCONNECTEMPTY */
     (* blackbox *)
    sky130_sram_1kbyte_1rw1r_32x256_8 data_mem_i (
         `ifdef USE_POWER_PINS
        .vccd1(vccd1),
        .vssd1(vssd1),
    `endif
        // read write port
        .clk0(clk),
        .csb0(~mem_data_req_o),  // chip select active low
        .web0(~mem_data_we_o),  // active low write control
        .wmask0(mem_data_be_o),  // write mask
        .addr0(mem_data_addr_o[7:0]),  // write address
        .din0(mem_data_wdata_o),  // write data
        .dout0(mem_data_rdata_i),  // read data 0
        // read only port:
        .clk1(  /*clk*/),  //clk
        .csb1(  /*~instr_req_i*/),  //active low chip select
        .addr1(  /*instr_addr_i*/),  //read address
        .dout1(  /*instr_rdata_o*/)  // read data 1
    );
    /* verilator lint_on PINCONNECTEMPTY */

    ibex_core ibex_i (
        .clk_i (clk),    //
        .rst_ni(resetn),

        .test_en_i(1'b1),
        .core_id_i(4'd0),
        .cluster_id_i(6'd0),
        .boot_addr_i(32'd0),

        .instr_req_o(mem_instr_req_o),
        .instr_gnt_i(mem_instr_gnt_i),
        .instr_rvalid_i(mem_instr_rvalid_i),
        .instr_addr_o(mem_instr_addr_o), // just 12 bits are used, since the memory macro just supports 12 bits
        .instr_rdata_i(mem_instr_rdata_i),

        .data_req_o(mem_data_req_o),
        .data_gnt_i(mem_data_gnt_i),
        .data_rvalid_i(mem_data_rvalid_i),
        .data_we_o(mem_data_we_o),
        .data_be_o(mem_data_be_o),
        .data_addr_o(mem_data_addr_o), // just 12 bits are used, since the memory macro just supports 12 bits
        .data_wdata_o(mem_data_wdata_o),
        .data_rdata_i(mem_data_rdata_i),
        .data_err_i(1'b0),

        .irq_i(ibex_irq_i),
        .irq_id_i(ibex_irq_id_i),
        .irq_ack_o(ibex_irq_ack_o),
        .irq_id_o(ibex_irq_id_o),

        .debug_req_i(ibex_debug_req_i),

        /* verilator lint_off PINCONNECTEMPTY */
        .cx_clk(),  // not connected since we are using global clock
        /* verilator lint_on PINCONNECTEMPTY */
        .cx_rst(cx_rst_o),
        .cx_req_valid(cx_req_valid_o),
        .cx_cxu_id(cx_cxu_id_o),
        .cx_state_id(cx_state_id_o),
        .cx_req_data0(cx_req_data0_o),
        .cx_req_data1(cx_req_data1_o),
        .cx_resp_valid(cx_resp_valid_i),
        .cx_resp_state(cx_resp_state_i),
        .cx_resp_status(cx_resp_status_i),
        .cx_resp_data(cx_resp_data_i),
        .cx_virt_state_id(cx_virt_state_id_o),
        .cx_insn_o(cx_insn_o),
        .cx_func_o(cx_func_o),

        .fetch_enable_i(ibex_fetch_enable_i),  //start_ibex
        .ext_perf_counters_i(1'b0)  //
    );

    eFPGA_top eFPGA_top_i (
         `ifdef USE_POWER_PINS
        .vccd1(vccd1),
        .vssd1(vssd1),
    `endif
        .CLK(clk),
        .resetn(resetn),
        .SelfWriteStrobe(SelfWriteStrobe),
        .SelfWriteData(SelfWriteData),
        .Rx(Rx),
        .ComActive(ComActive),
        .ReceiveLED(ReceiveLED),
        .s_clk(s_clk),
        .s_data(s_data),
        .A_config_C(A_config_C),
        .B_config_C(B_config_C),
        .Config_accessC(Config_accessC),
        .I_top(I_top),
        .O_top(O_top),
        .T_top(T_top),
        .UIO_BOT_UIN(UIO_BOT_UIN),
        .UIO_BOT_UOUT(UIO_BOT_UOUT),
        .UIO_TOP_UIN(UIO_TOP_UIN),
        .UIO_TOP_UOUT(UIO_TOP_UOUT)

    );

endmodule
/* verilator lint_on UNOPTFLAT */


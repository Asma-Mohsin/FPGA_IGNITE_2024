`timescale 1ns / 1ps

module summer_school_top_wrapper #(
    parameter NUM_OF_TOTAL_FABRIC_IOS = 31,
    parameter NUM_OF_LOGIC_ANALYZER_BITS = 128,
    parameter WB_DATA_WIDTH = 32
) (
/*`ifdef USE_POWER_PINS
    inout vccd1,  // User area 1 1.8V supply
    inout vssd1,  // User area 1 digital ground
`endif
*/
    // Wishbone ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [WB_DATA_WIDTH-1:0] wbs_dat_i,
    input [WB_DATA_WIDTH-1:0] wbs_adr_i,
    output [WB_DATA_WIDTH-1:0] wbs_dat_o,  // not used
    output reg wbs_ack_o,
    output wire wbs_sta_o,

    // Logic Analyzer Signals
    output [NUM_OF_LOGIC_ANALYZER_BITS-1:0] la_data_out,
    /* verilator lint_off UNUSEDSIGNAL */
    input [NUM_OF_LOGIC_ANALYZER_BITS-1:0] la_data_in,  // la_data_in'[127:109,39:9,7:0] not used
    input [NUM_OF_LOGIC_ANALYZER_BITS-1:0] la_oenb,  // not used
    /* verilator lint_on UNUSEDSIGNAL */

    // IOs
    input  [NUM_OF_TOTAL_FABRIC_IOS-1:0] io_in,
    output [NUM_OF_TOTAL_FABRIC_IOS-1:0] io_out,
    output [NUM_OF_TOTAL_FABRIC_IOS-1:0] io_oeb,

    // Independent clock (on independent integer divider)
    input user_clock2
);

    // The number of IOs that can be used by the FPGA user design
    localparam NUM_FABRIC_USER_IOS = 12;
    localparam [31:0] BASE_WB_ADDRESS = 32'h3000_0000;
    localparam [31:0] CONFIG_DATA_WB_ADDRESS = BASE_WB_ADDRESS;

    // The Output enable input of the IO cell is inverted, so define parameters for increased readability
    localparam OUTPUT_ENABLE = 1'b0;
    localparam OUTPUT_DISABLE = 1'b1;

    // Fabric IOs
    localparam EXTERNAL_CLK_IO = 0;
    localparam CLK_SEL_0_IO = 1;
    localparam CLK_SEL_1_IO = 2;
    localparam CLK_SEL_0 = 0;
    localparam CLK_SEL_1 = 1;

    localparam S_CLK_IO = 3;
    localparam S_DATA_IO = 4;
    localparam EFPGA_UART_RX_IO = 5;
    localparam RECEIVE_LED_IO = 6;

    // eFPGA IOs
    localparam EFPGA_USED_NUM_IOS = 12;  // Due to pin count limitation, we don't use all eFPGA IOs
    localparam EFPGA_IO_LOWEST = 7; // This maps to MPRJ_IO[14], which is io[0] on the FABulous board
    localparam EFPGA_IO_HIGHEST = EFPGA_IO_LOWEST + EFPGA_USED_NUM_IOS - 1;
    // NOTE:: This was introduced since the fabric was changed shortly before
    // the submission and with this all other pins can stay at their previous
    // location
    localparam EFPGA_IO_PADDING = 0;

    localparam SELECT_MODULE_IO = EFPGA_IO_HIGHEST + 1 + EFPGA_IO_PADDING; // Select module IO is located after the eFPGA IOs
    localparam SEL_IO = SELECT_MODULE_IO + 1;  // Sel is located after select module

    // VGA IOs
    localparam VGA_NUM_IOS = 8;
    localparam VGA_IO_LOWEST = SEL_IO + 1;  // VGA is located after the eFPGA pins
    localparam VGA_IO_HIGHEST = VGA_IO_LOWEST + VGA_NUM_IOS - 1;

    localparam RESETN_IO = VGA_IO_HIGHEST + 1;  // resetn is located after the VGA pins

    // NOTE: The external clock is not used anymore but still left in since we
    // did not want to mess anything up shortly before the tapeout
    localparam EXTERNAL_CLK_SHIFTED_IO = RESETN_IO + 1;  // unused IO - was shifted external clock is located after resetn
    wire [NUM_FABRIC_USER_IOS-1:0] I_top;
    wire [NUM_FABRIC_USER_IOS-1:0] T_top;
    wire [NUM_FABRIC_USER_IOS-1:0] O_top;

    wire CLK;  // This clock can go to the CPU (connects to the fabric LUT output flops)
    wire resetn;
    wire external_clock;

    // CPU configuration port
    wire SelfWriteStrobe;  // must decode address and write enable
    wire [32-1:0] SelfWriteData;  // configuration data write port

    // Wishbone configuration signals
    wire config_strobe;
    reg [31:0] config_data;

    //Whishbone clock domain crossing signals
    reg wb_to_fpga;
    reg feedback0;
    reg feedback1;

    // UART configuration port
    wire efpga_uart_rx;
    wire ReceiveLED;

    // BitBang configuration port
    wire s_clk;
    wire s_data;

    // Module selection signals
    wire select_module;
    wire sel;

    wire [1:0] clk_sel;

    // Latch for config_strobe
    reg config_strobe_reg1 = 0;
    reg config_strobe_reg2 = 0;
    reg config_strobe_reg3 = 0;

    /* verilator lint_off UNUSEDSIGNAL */
    wire [78:0] UIO_TOP_UOUT_PAD;
    wire [159:0] UIO_BOT_UOUT_PAD;
    /* verilator lint_on UNUSEDSIGNAL */

    reg [159:0] UIO_BOT_UIN_PAD;
    assign UIO_BOT_UIN_PAD[159:40] = 120'b0;

    // Drive unused IOs low
    assign wbs_dat_o = 32'b0;

    /* verilator lint_off PINCONNECTEMPTY */
    flexbex_soc_top flexbex_eFPGA (
        `ifdef USE_POWER_PINS
        .vccd1(vccd1),
        .vssd1(vssd1),
    `endif
        .A_config_C(),  // NOTE: Dirk said to leave this empty since its not needed
        .B_config_C(),  // NOTE: Dirk said to leave this empty since its not needed
        .Config_accessC(),  // NOTE: Dirk said to leave this empty since its not needed

        .clk(CLK),
        .resetn(resetn),
        .SelfWriteStrobe(SelfWriteStrobe),
        .SelfWriteData(SelfWriteData),
        .Rx(efpga_uart_rx),
        .ComActive(),  // NOTE: Dirk said to not connect it
        .ReceiveLED(ReceiveLED),
        .s_clk(s_clk),
        .s_data(s_data),

        .I_top(I_top),
        .O_top(O_top),
        .T_top(T_top),

        .UIO_TOP_UOUT_PAD(UIO_TOP_UOUT_PAD),
        .UIO_TOP_UIN_PAD(),  // Unused
        .UIO_BOT_UOUT_PAD(UIO_BOT_UOUT_PAD),
        .UIO_BOT_UIN_PAD(UIO_BOT_UIN_PAD)

    );
    /* verilator lint_on PINCONNECTEMPTY */

    //posit co-processor (eFPGA and LA)
    // Define intermediate signals
    reg issue_valid;  // Signal for issue validity
    reg [31:0] issue_req_instr;  // Signal for issue request instruction (assuming 32-bit width)
    reg register_valid;  // Signal for register validity
    // These are truncated to 16 bit since PAU uses only 16 bits internally
    reg [15:0] register_rs[1:0];  // Signal for register sources (2 bits)
    reg [1:0] register_rs_valid;  // Signal for register sources validity
    reg result_ready;  // Signal for result readiness

    wire issue_ready;  // Signal for issue readiness
    wire issue_resp_accept;  // Signal for issue response accept
    wire issue_resp_writeback;  // Signal for issue response writeback
    wire [1:0] issue_resp_register_read;  // Signal for issue response register read (2 bits)
    wire register_ready;  // Signal for register readiness
    wire result_valid;  // Signal for result validity
    wire [31:0] result_data;  // Signal for result data (assuming 32-bit width)

    // POSIT coprocessor
    cvxif_pau cvxif_pau_inst (
        .clk(CLK),
        .rst(!resetn),
        .issue_valid(issue_valid),
        .issue_ready(issue_ready),
        .issue_req_instr(issue_req_instr),
        .issue_resp_accept(issue_resp_accept),
        .issue_resp_writeback(issue_resp_writeback),
        .issue_resp_register_read(issue_resp_register_read),
        .register_valid(register_valid),
        .register_ready(register_ready),
        .register_rs0({16'b0, register_rs[0]}),
        .register_rs1({16'b0, register_rs[1]}),
        .register_rs_valid(register_rs_valid),
        .result_valid(result_valid),
        .result_ready(result_ready),
        .result_data(result_data)
    );

    // THE RING
    reg en;
    wire [7:0] d_out;
    ro_top ring_inst (
        .clk(CLK),
        .en(en),
        .d_out(d_out)
    );

    // VGA_Ignite
    wire [7:0] data_o;
    wire [1:0] vga_r;
    wire [1:0] vga_g;
    wire [1:0] vga_b;

    wire hsync;
    wire vsync;

    // https://github.com/jhspuk/FPGAIgnite-VGA
    // Pixel Processing Unit
    /* verilator lint_off PINCONNECTEMPTY */
    ppu ppu_inst (
        .clk(CLK),
        .rst(resetn),
        .sync(UIO_BOT_UOUT_PAD[0]),
        .mode(UIO_BOT_UOUT_PAD[3:1]),
        .data_i(UIO_BOT_UOUT_PAD[11:4]),
        .stb_i(UIO_BOT_UOUT_PAD[12]),
        .ack_i(UIO_BOT_UIN_PAD[0]),
        .data_o(data_o),
        .stb_o(),  //indicates data of current pixel and is not currenly used
        .ack_o(UIO_BOT_UOUT_PAD[13])
    );
    /* verilator lint_on PINCONNECTEMPTY */

    // Instantiate VGA Driver module
    assign io_oeb[VGA_IO_HIGHEST:VGA_IO_LOWEST] = {8{OUTPUT_ENABLE}};
    assign io_out[VGA_IO_HIGHEST:VGA_IO_LOWEST] = {vga_r, vga_g, vga_b, hsync, vsync};

    /* verilator lint_off PINCONNECTEMPTY */
    vga_driver vga_driver_inst (
        .clk_pix(CLK),
        .rst_pix(resetn),
        .wb_data(data_o),  // PPU's data output is written to VGA
        .vga_r  (vga_r),
        .vga_g  (vga_g),
        .vga_b  (vga_b),
        .sx     (),        //simulation signals
        .sy     (),        //simulation signals
        .hsync  (hsync),
        .vsync  (vsync),
        .de     ()         //simulation signals
    );
    /* verilator lint_on PINCONNECTEMPTY */

    // Module Select
    always @(*) begin
        la_data_out[125:0] = 126'b0;
        en = 1'b0;
        UIO_BOT_UIN_PAD[39:1] = 'b0;
        issue_req_instr = 32'b0;
        issue_valid = 1'b0;
        register_valid = 1'b0;
        register_rs[1] = 16'b0;
        register_rs[0] = 16'b0;
        register_rs_valid = 2'b0;
        result_ready = 1'b0;


        case (select_module)

            // THE RING
            1'b0: begin
                case (sel)

                    // Logic Analyzer
                    1'b1: begin
                        en = la_data_in[8];
                        la_data_out[7:0] = d_out;

                    end

                    //eFPGA
                    default: begin
                        //inputs
                        en = UIO_BOT_UOUT_PAD[14];
                        //outputs
                        UIO_BOT_UIN_PAD[8:1] = d_out;
                    end
                endcase
            end

            default: //posit coprocessor
                begin
                case (sel)

                    // LA
                    1'b1: begin
                        // inputs
                        issue_req_instr = la_data_in[108:77];
                        issue_valid = la_data_in[76];
                        register_valid = la_data_in[75];
                        register_rs[1] = la_data_in[74:59];
                        register_rs[0] = la_data_in[58:43];
                        register_rs_valid = la_data_in[42:41];
                        result_ready = la_data_in[40];

                        // outputs
                        la_data_out[39] = issue_ready;
                        la_data_out[38] = issue_resp_accept;
                        la_data_out[37] = issue_resp_writeback;
                        la_data_out[36:35] = issue_resp_register_read;
                        la_data_out[34] = register_ready;
                        la_data_out[33] = result_valid;
                        la_data_out[32:1] = result_data;
                    end

                    // eFPGA
                    default: begin
                        // inputs

                        issue_req_instr = UIO_BOT_UOUT_PAD[82:51];
                        issue_valid = UIO_BOT_UOUT_PAD[50];
                        register_valid = UIO_BOT_UOUT_PAD[49];
                        register_rs[1] = UIO_BOT_UOUT_PAD[48:33];
                        register_rs[0] = UIO_BOT_UOUT_PAD[32:17];
                        register_rs_valid = UIO_BOT_UOUT_PAD[16:15];
                        result_ready = UIO_BOT_UOUT_PAD[14];

                        //outputs
                        UIO_BOT_UIN_PAD[39] = issue_ready;
                        UIO_BOT_UIN_PAD[38] = issue_resp_accept;
                        UIO_BOT_UIN_PAD[37] = issue_resp_writeback;
                        UIO_BOT_UIN_PAD[36:35] = issue_resp_register_read;
                        UIO_BOT_UIN_PAD[34] = register_ready;
                        UIO_BOT_UIN_PAD[33] = result_valid;
                        UIO_BOT_UIN_PAD[32:1] = result_data;
                    end
                endcase
            end
        endcase
    end

    assign wbs_sta_o = 0;
    //TODO test behaviour of this clock domain crossing (assume condition is
    //true
    always @(posedge wb_clk_i or negedge resetn) begin
        if (!resetn) begin
            wb_to_fpga <= 1'b0;
        end else begin
            if (feedback1 && !(wbs_stb_i && wbs_cyc_i && wbs_we_i && !wbs_sta_o && (wbs_adr_i == CONFIG_DATA_WB_ADDRESS))) begin
                wb_to_fpga <= 1'b0;
            end else if (wbs_stb_i && wbs_cyc_i && wbs_we_i && !wbs_sta_o && (wbs_adr_i == CONFIG_DATA_WB_ADDRESS)) begin
                wb_to_fpga <= 1'b1;
            end else begin
                wb_to_fpga <= wb_to_fpga;
            end
        end
    end

    always @(posedge wb_clk_i or negedge resetn) begin
        if (!resetn) begin
            feedback0 <= 1'b0;
            feedback1 <= 1'b0;
        end else begin
            feedback0 <= config_strobe_reg2;
            feedback1 <= feedback0;
        end
    end


    always @(posedge CLK or negedge resetn) begin
        if (!resetn) begin
            config_strobe_reg1 <= 1'b0;
            config_strobe_reg2 <= 1'b0;
            config_strobe_reg3 <= 1'b0;
        end else begin
            config_strobe_reg1 <= wb_to_fpga;
            config_strobe_reg2 <= config_strobe_reg1;
            config_strobe_reg3 <= config_strobe_reg2;
        end
    end

    assign config_strobe = (!config_strobe_reg3 && (config_strobe_reg2)); //posedge pulse for config strobe

    // Write the config data register from the wishbone bus
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            config_data <= 32'b0;
        end else begin
            if (wbs_stb_i && wbs_cyc_i && wbs_we_i && !wbs_sta_o && (wbs_adr_i == CONFIG_DATA_WB_ADDRESS)) begin
                config_data <= wbs_dat_i;
            end
        end
    end

    // NOTE: Taken from Matt Venns wishbone demo:
    // https://github.com/mattvenn/wishbone_buttons_leds/blob/master/wb_buttons_leds.v

    // acks
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) wbs_ack_o <= 1'b0;
        else
            // return ack immediately
            wbs_ack_o <= (wbs_stb_i && !wbs_sta_o && (wbs_adr_i == CONFIG_DATA_WB_ADDRESS));
    end

    assign external_clock = io_in[EXTERNAL_CLK_IO];
    assign clk_sel = {io_in[CLK_SEL_1_IO], io_in[CLK_SEL_0_IO]};
    assign s_clk = io_in[S_CLK_IO];
    assign s_data = io_in[S_DATA_IO];
    assign efpga_uart_rx = io_in[EFPGA_UART_RX_IO];
    assign io_out[RECEIVE_LED_IO] = ReceiveLED;

    assign select_module = io_in[SELECT_MODULE_IO];
    assign sel = io_in[SEL_IO];

    assign resetn = io_in[RESETN_IO];

    assign io_oeb[EXTERNAL_CLK_IO] = OUTPUT_DISABLE;
    assign io_oeb[CLK_SEL_0_IO] = OUTPUT_DISABLE;
    assign io_oeb[CLK_SEL_1_IO] = OUTPUT_DISABLE;
    assign io_oeb[S_CLK_IO] = OUTPUT_DISABLE;
    assign io_oeb[S_DATA_IO] = OUTPUT_DISABLE;
    assign io_oeb[EFPGA_UART_RX_IO] = OUTPUT_DISABLE;
    assign io_oeb[RECEIVE_LED_IO] = OUTPUT_ENABLE;  // The only fabric IO output

    assign io_oeb[SELECT_MODULE_IO] = OUTPUT_DISABLE;
    assign io_oeb[SEL_IO] = OUTPUT_DISABLE;

    assign io_oeb[RESETN_IO] = OUTPUT_DISABLE;
    assign io_oeb[EXTERNAL_CLK_SHIFTED_IO] = OUTPUT_DISABLE;

    // Drive all unused IOs low
    assign io_out[EXTERNAL_CLK_IO] = 1'b0;
    assign io_out[CLK_SEL_0_IO] = 1'b0;
    assign io_out[CLK_SEL_1_IO] = 1'b0;
    assign io_out[S_CLK_IO] = 1'b0;
    assign io_out[S_DATA_IO] = 1'b0;
    assign io_out[EFPGA_UART_RX_IO] = 1'b0;
    assign io_out[SELECT_MODULE_IO] = 1'b0;
    assign io_out[SEL_IO] = 1'b0;
    assign io_out[RESETN_IO] = 1'b0;
    assign io_out[EXTERNAL_CLK_SHIFTED_IO] = 1'b0;

    // Config signals
    assign SelfWriteStrobe = config_strobe;
    assign SelfWriteData = config_data;

    // Debug signals
    assign la_data_out[127:126] = {ReceiveLED, efpga_uart_rx};

    // eFPGA external IOs
    assign O_top[EFPGA_USED_NUM_IOS-1:0] = io_in[EFPGA_IO_HIGHEST:EFPGA_IO_LOWEST];
    assign io_out[EFPGA_IO_HIGHEST:EFPGA_IO_LOWEST] = I_top[EFPGA_USED_NUM_IOS-1:0];
    assign io_oeb[EFPGA_IO_HIGHEST:EFPGA_IO_LOWEST] = T_top[EFPGA_USED_NUM_IOS-1:0];

    assign CLK = clk_sel[CLK_SEL_0] ? (clk_sel[CLK_SEL_1] ? user_clock2 : wb_clk_i) : external_clock;
endmodule

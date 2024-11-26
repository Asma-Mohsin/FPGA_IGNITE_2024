///  sta-blackbox
/* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNUSEDPARAM */

`timescale 1ns / 1ps
module N_term_single #(
`ifdef EMULATION
    parameter [639:0] Emulate_Bitstream = 640'b0,
`endif
    parameter MaxFramesPerCol = 20,
    parameter FrameBitsPerRow = 32,
    parameter NoConfigBits = 0
) (
    //Side.SOUTH
`ifdef USE_POWER_PINS
    input wire vccd1,
    input wire vssd1,
`endif
    input [3:0] N1END,  //Port(Name=N1END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=4, Side=SOUTH)
    input [7:0] N2MID,  //Port(Name=N2MID, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
    input [7:0] N2END,  //Port(Name=N2END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
    input [15:0] N4END,        //Port(Name=N4END, IO=INPUT, XOffset=0, YOffset=-4, WireCount=4, Side=SOUTH)
    input [15:0] NN4END,        //Port(Name=NN4END, IO=INPUT, XOffset=0, YOffset=-4, WireCount=4, Side=SOUTH)
    input [0:0] Ci,  //Port(Name=Ci, IO=INPUT, XOffset=0, YOffset=-1, WireCount=1, Side=SOUTH)
    output [3:0] S1BEG,        //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    output [7:0] S2BEG,        //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    output [7:0] S2BEGb,        //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    output [15:0] S4BEG,        //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    output [15:0] SS4BEG,        //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    input UIO_TOP_UIN0,
    input UIO_TOP_UIN1,
    input UIO_TOP_UIN10,
    input UIO_TOP_UIN11,
    input UIO_TOP_UIN12,
    input UIO_TOP_UIN13,
    input UIO_TOP_UIN14,
    input UIO_TOP_UIN15,
    input UIO_TOP_UIN16,
    input UIO_TOP_UIN17,
    input UIO_TOP_UIN18,
    input UIO_TOP_UIN19,
    input UIO_TOP_UIN2,
    input UIO_TOP_UIN3,
    input UIO_TOP_UIN4,
    input UIO_TOP_UIN5,
    input UIO_TOP_UIN6,
    input UIO_TOP_UIN7,
    input UIO_TOP_UIN8,
    input UIO_TOP_UIN9,
    output UIO_TOP_UOUT0,
    output UIO_TOP_UOUT1,
    output UIO_TOP_UOUT10,
    output UIO_TOP_UOUT11,
    output UIO_TOP_UOUT12,
    output UIO_TOP_UOUT13,
    output UIO_TOP_UOUT14,
    output UIO_TOP_UOUT15,
    output UIO_TOP_UOUT16,
    output UIO_TOP_UOUT17,
    output UIO_TOP_UOUT18,
    output UIO_TOP_UOUT19,
    output UIO_TOP_UOUT2,
    output UIO_TOP_UOUT3,
    output UIO_TOP_UOUT4,
    output UIO_TOP_UOUT5,
    output UIO_TOP_UOUT6,
    output UIO_TOP_UOUT7,
    output UIO_TOP_UOUT8,
    output UIO_TOP_UOUT9,
    //Tile IO ports from BELs
    input UserCLK,
    output UserCLKo,
    input [MaxFramesPerCol -1:0] FrameStrobe,
    output [MaxFramesPerCol -1:0] FrameStrobe_O
    //global
);
    //signal declarations
    //BEL ports (e.g., slices)
    wire UIO_TOP_FIN0;
    wire UIO_TOP_FIN1;
    wire UIO_TOP_FIN10;
    wire UIO_TOP_FIN11;
    wire UIO_TOP_FIN12;
    wire UIO_TOP_FIN13;
    wire UIO_TOP_FIN14;
    wire UIO_TOP_FIN15;
    wire UIO_TOP_FIN16;
    wire UIO_TOP_FIN17;
    wire UIO_TOP_FIN18;
    wire UIO_TOP_FIN19;
    wire UIO_TOP_FIN2;
    wire UIO_TOP_FIN3;
    wire UIO_TOP_FIN4;
    wire UIO_TOP_FIN5;
    wire UIO_TOP_FIN6;
    wire UIO_TOP_FIN7;
    wire UIO_TOP_FIN8;
    wire UIO_TOP_FIN9;
    wire UIO_TOP_FOUT0;
    wire UIO_TOP_FOUT1;
    wire UIO_TOP_FOUT10;
    wire UIO_TOP_FOUT11;
    wire UIO_TOP_FOUT12;
    wire UIO_TOP_FOUT13;
    wire UIO_TOP_FOUT14;
    wire UIO_TOP_FOUT15;
    wire UIO_TOP_FOUT16;
    wire UIO_TOP_FOUT17;
    wire UIO_TOP_FOUT18;
    wire UIO_TOP_FOUT19;
    wire UIO_TOP_FOUT2;
    wire UIO_TOP_FOUT3;
    wire UIO_TOP_FOUT4;
    wire UIO_TOP_FOUT5;
    wire UIO_TOP_FOUT6;
    wire UIO_TOP_FOUT7;
    wire UIO_TOP_FOUT8;
    wire UIO_TOP_FOUT9;
    //Jump wires
    //internal configuration data signal to daisy-chain all BELs (if any and in the order they are listed in the fabric.csv)
    /* verilator lint_off ASCRANGE */
    wire [NoConfigBits-1:0] ConfigBits;
    wire [NoConfigBits-1:0] ConfigBits_N;
    /* verilator lint_on ASCRANGE */

    //Connection for outgoing wires
    wire [FrameBitsPerRow-1:0] FrameData_i;
    wire [FrameBitsPerRow-1:0] FrameData_O_i;
    wire [MaxFramesPerCol-1:0] FrameStrobe_i;
    wire [MaxFramesPerCol-1:0] FrameStrobe_O_i;

    assign FrameStrobe_O_i = FrameStrobe_i;

    my_buf strobe_inbuf_0 (
        .A(FrameStrobe[0]),
        .X(FrameStrobe_i[0])
    );

    my_buf strobe_inbuf_1 (
        .A(FrameStrobe[1]),
        .X(FrameStrobe_i[1])
    );

    my_buf strobe_inbuf_2 (
        .A(FrameStrobe[2]),
        .X(FrameStrobe_i[2])
    );

    my_buf strobe_inbuf_3 (
        .A(FrameStrobe[3]),
        .X(FrameStrobe_i[3])
    );

    my_buf strobe_inbuf_4 (
        .A(FrameStrobe[4]),
        .X(FrameStrobe_i[4])
    );

    my_buf strobe_inbuf_5 (
        .A(FrameStrobe[5]),
        .X(FrameStrobe_i[5])
    );

    my_buf strobe_inbuf_6 (
        .A(FrameStrobe[6]),
        .X(FrameStrobe_i[6])
    );

    my_buf strobe_inbuf_7 (
        .A(FrameStrobe[7]),
        .X(FrameStrobe_i[7])
    );

    my_buf strobe_inbuf_8 (
        .A(FrameStrobe[8]),
        .X(FrameStrobe_i[8])
    );

    my_buf strobe_inbuf_9 (
        .A(FrameStrobe[9]),
        .X(FrameStrobe_i[9])
    );

    my_buf strobe_inbuf_10 (
        .A(FrameStrobe[10]),
        .X(FrameStrobe_i[10])
    );

    my_buf strobe_inbuf_11 (
        .A(FrameStrobe[11]),
        .X(FrameStrobe_i[11])
    );

    my_buf strobe_inbuf_12 (
        .A(FrameStrobe[12]),
        .X(FrameStrobe_i[12])
    );

    my_buf strobe_inbuf_13 (
        .A(FrameStrobe[13]),
        .X(FrameStrobe_i[13])
    );

    my_buf strobe_inbuf_14 (
        .A(FrameStrobe[14]),
        .X(FrameStrobe_i[14])
    );

    my_buf strobe_inbuf_15 (
        .A(FrameStrobe[15]),
        .X(FrameStrobe_i[15])
    );

    my_buf strobe_inbuf_16 (
        .A(FrameStrobe[16]),
        .X(FrameStrobe_i[16])
    );

    my_buf strobe_inbuf_17 (
        .A(FrameStrobe[17]),
        .X(FrameStrobe_i[17])
    );

    my_buf strobe_inbuf_18 (
        .A(FrameStrobe[18]),
        .X(FrameStrobe_i[18])
    );

    my_buf strobe_inbuf_19 (
        .A(FrameStrobe[19]),
        .X(FrameStrobe_i[19])
    );

    my_buf strobe_outbuf_0 (
        .A(FrameStrobe_O_i[0]),
        .X(FrameStrobe_O[0])
    );

    my_buf strobe_outbuf_1 (
        .A(FrameStrobe_O_i[1]),
        .X(FrameStrobe_O[1])
    );

    my_buf strobe_outbuf_2 (
        .A(FrameStrobe_O_i[2]),
        .X(FrameStrobe_O[2])
    );

    my_buf strobe_outbuf_3 (
        .A(FrameStrobe_O_i[3]),
        .X(FrameStrobe_O[3])
    );

    my_buf strobe_outbuf_4 (
        .A(FrameStrobe_O_i[4]),
        .X(FrameStrobe_O[4])
    );

    my_buf strobe_outbuf_5 (
        .A(FrameStrobe_O_i[5]),
        .X(FrameStrobe_O[5])
    );

    my_buf strobe_outbuf_6 (
        .A(FrameStrobe_O_i[6]),
        .X(FrameStrobe_O[6])
    );

    my_buf strobe_outbuf_7 (
        .A(FrameStrobe_O_i[7]),
        .X(FrameStrobe_O[7])
    );

    my_buf strobe_outbuf_8 (
        .A(FrameStrobe_O_i[8]),
        .X(FrameStrobe_O[8])
    );

    my_buf strobe_outbuf_9 (
        .A(FrameStrobe_O_i[9]),
        .X(FrameStrobe_O[9])
    );

    my_buf strobe_outbuf_10 (
        .A(FrameStrobe_O_i[10]),
        .X(FrameStrobe_O[10])
    );

    my_buf strobe_outbuf_11 (
        .A(FrameStrobe_O_i[11]),
        .X(FrameStrobe_O[11])
    );

    my_buf strobe_outbuf_12 (
        .A(FrameStrobe_O_i[12]),
        .X(FrameStrobe_O[12])
    );

    my_buf strobe_outbuf_13 (
        .A(FrameStrobe_O_i[13]),
        .X(FrameStrobe_O[13])
    );

    my_buf strobe_outbuf_14 (
        .A(FrameStrobe_O_i[14]),
        .X(FrameStrobe_O[14])
    );

    my_buf strobe_outbuf_15 (
        .A(FrameStrobe_O_i[15]),
        .X(FrameStrobe_O[15])
    );

    my_buf strobe_outbuf_16 (
        .A(FrameStrobe_O_i[16]),
        .X(FrameStrobe_O[16])
    );

    my_buf strobe_outbuf_17 (
        .A(FrameStrobe_O_i[17]),
        .X(FrameStrobe_O[17])
    );

    my_buf strobe_outbuf_18 (
        .A(FrameStrobe_O_i[18]),
        .X(FrameStrobe_O[18])
    );

    my_buf strobe_outbuf_19 (
        .A(FrameStrobe_O_i[19]),
        .X(FrameStrobe_O[19])
    );

    clk_buf inst_clk_buf (
        .A(UserCLK),
        .X(UserCLKo)
    );


    //BEL component instantiations
    User_project_IO Inst_UIO_TOP_User_project_IO (
        .FIN0  (UIO_TOP_FIN0),
        .FIN1  (UIO_TOP_FIN1),
        .FIN10 (UIO_TOP_FIN10),
        .FIN11 (UIO_TOP_FIN11),
        .FIN12 (UIO_TOP_FIN12),
        .FIN13 (UIO_TOP_FIN13),
        .FIN14 (UIO_TOP_FIN14),
        .FIN15 (UIO_TOP_FIN15),
        .FIN16 (UIO_TOP_FIN16),
        .FIN17 (UIO_TOP_FIN17),
        .FIN18 (UIO_TOP_FIN18),
        .FIN19 (UIO_TOP_FIN19),
        .FIN2  (UIO_TOP_FIN2),
        .FIN3  (UIO_TOP_FIN3),
        .FIN4  (UIO_TOP_FIN4),
        .FIN5  (UIO_TOP_FIN5),
        .FIN6  (UIO_TOP_FIN6),
        .FIN7  (UIO_TOP_FIN7),
        .FIN8  (UIO_TOP_FIN8),
        .FIN9  (UIO_TOP_FIN9),
        .FOUT0 (UIO_TOP_FOUT0),
        .FOUT1 (UIO_TOP_FOUT1),
        .FOUT10(UIO_TOP_FOUT10),
        .FOUT11(UIO_TOP_FOUT11),
        .FOUT12(UIO_TOP_FOUT12),
        .FOUT13(UIO_TOP_FOUT13),
        .FOUT14(UIO_TOP_FOUT14),
        .FOUT15(UIO_TOP_FOUT15),
        .FOUT16(UIO_TOP_FOUT16),
        .FOUT17(UIO_TOP_FOUT17),
        .FOUT18(UIO_TOP_FOUT18),
        .FOUT19(UIO_TOP_FOUT19),
        .FOUT2 (UIO_TOP_FOUT2),
        .FOUT3 (UIO_TOP_FOUT3),
        .FOUT4 (UIO_TOP_FOUT4),
        .FOUT5 (UIO_TOP_FOUT5),
        .FOUT6 (UIO_TOP_FOUT6),
        .FOUT7 (UIO_TOP_FOUT7),
        .FOUT8 (UIO_TOP_FOUT8),
        .FOUT9 (UIO_TOP_FOUT9),
        .UIN0  (UIO_TOP_UIN0),
        .UIN1  (UIO_TOP_UIN1),
        .UIN10 (UIO_TOP_UIN10),
        .UIN11 (UIO_TOP_UIN11),
        .UIN12 (UIO_TOP_UIN12),
        .UIN13 (UIO_TOP_UIN13),
        .UIN14 (UIO_TOP_UIN14),
        .UIN15 (UIO_TOP_UIN15),
        .UIN16 (UIO_TOP_UIN16),
        .UIN17 (UIO_TOP_UIN17),
        .UIN18 (UIO_TOP_UIN18),
        .UIN19 (UIO_TOP_UIN19),
        .UIN2  (UIO_TOP_UIN2),
        .UIN3  (UIO_TOP_UIN3),
        .UIN4  (UIO_TOP_UIN4),
        .UIN5  (UIO_TOP_UIN5),
        .UIN6  (UIO_TOP_UIN6),
        .UIN7  (UIO_TOP_UIN7),
        .UIN8  (UIO_TOP_UIN8),
        .UIN9  (UIO_TOP_UIN9),
        .UOUT0 (UIO_TOP_UOUT0),
        .UOUT1 (UIO_TOP_UOUT1),
        .UOUT10(UIO_TOP_UOUT10),
        .UOUT11(UIO_TOP_UOUT11),
        .UOUT12(UIO_TOP_UOUT12),
        .UOUT13(UIO_TOP_UOUT13),
        .UOUT14(UIO_TOP_UOUT14),
        .UOUT15(UIO_TOP_UOUT15),
        .UOUT16(UIO_TOP_UOUT16),
        .UOUT17(UIO_TOP_UOUT17),
        .UOUT18(UIO_TOP_UOUT18),
        .UOUT19(UIO_TOP_UOUT19),
        .UOUT2 (UIO_TOP_UOUT2),
        .UOUT3 (UIO_TOP_UOUT3),
        .UOUT4 (UIO_TOP_UOUT4),
        .UOUT5 (UIO_TOP_UOUT5),
        .UOUT6 (UIO_TOP_UOUT6),
        .UOUT7 (UIO_TOP_UOUT7),
        .UOUT8 (UIO_TOP_UOUT8),
        .UOUT9 (UIO_TOP_UOUT9)
    );

    N_term_single_switch_matrix Inst_N_term_single_switch_matrix (
        .N1END0(N1END[0]),
        .N1END1(N1END[1]),
        .N1END2(N1END[2]),
        .N1END3(N1END[3]),
        .N2MID0(N2MID[0]),
        .N2MID1(N2MID[1]),
        .N2MID2(N2MID[2]),
        .N2MID3(N2MID[3]),
        .N2MID4(N2MID[4]),
        .N2MID5(N2MID[5]),
        .N2MID6(N2MID[6]),
        .N2MID7(N2MID[7]),
        .N2END0(N2END[0]),
        .N2END1(N2END[1]),
        .N2END2(N2END[2]),
        .N2END3(N2END[3]),
        .N2END4(N2END[4]),
        .N2END5(N2END[5]),
        .N2END6(N2END[6]),
        .N2END7(N2END[7]),
        .N4END0(N4END[0]),
        .N4END1(N4END[1]),
        .N4END2(N4END[2]),
        .N4END3(N4END[3]),
        .N4END4(N4END[4]),
        .N4END5(N4END[5]),
        .N4END6(N4END[6]),
        .N4END7(N4END[7]),
        .N4END8(N4END[8]),
        .N4END9(N4END[9]),
        .N4END10(N4END[10]),
        .N4END11(N4END[11]),
        .N4END12(N4END[12]),
        .N4END13(N4END[13]),
        .N4END14(N4END[14]),
        .N4END15(N4END[15]),
        .NN4END0(NN4END[0]),
        .NN4END1(NN4END[1]),
        .NN4END2(NN4END[2]),
        .NN4END3(NN4END[3]),
        .NN4END4(NN4END[4]),
        .NN4END5(NN4END[5]),
        .NN4END6(NN4END[6]),
        .NN4END7(NN4END[7]),
        .NN4END8(NN4END[8]),
        .NN4END9(NN4END[9]),
        .NN4END10(NN4END[10]),
        .NN4END11(NN4END[11]),
        .NN4END12(NN4END[12]),
        .NN4END13(NN4END[13]),
        .NN4END14(NN4END[14]),
        .NN4END15(NN4END[15]),
        .Ci0(Ci[0]),
        .UIO_TOP_FOUT0(UIO_TOP_FOUT0),
        .UIO_TOP_FOUT1(UIO_TOP_FOUT1),
        .UIO_TOP_FOUT10(UIO_TOP_FOUT10),
        .UIO_TOP_FOUT11(UIO_TOP_FOUT11),
        .UIO_TOP_FOUT12(UIO_TOP_FOUT12),
        .UIO_TOP_FOUT13(UIO_TOP_FOUT13),
        .UIO_TOP_FOUT14(UIO_TOP_FOUT14),
        .UIO_TOP_FOUT15(UIO_TOP_FOUT15),
        .UIO_TOP_FOUT16(UIO_TOP_FOUT16),
        .UIO_TOP_FOUT17(UIO_TOP_FOUT17),
        .UIO_TOP_FOUT18(UIO_TOP_FOUT18),
        .UIO_TOP_FOUT19(UIO_TOP_FOUT19),
        .UIO_TOP_FOUT2(UIO_TOP_FOUT2),
        .UIO_TOP_FOUT3(UIO_TOP_FOUT3),
        .UIO_TOP_FOUT4(UIO_TOP_FOUT4),
        .UIO_TOP_FOUT5(UIO_TOP_FOUT5),
        .UIO_TOP_FOUT6(UIO_TOP_FOUT6),
        .UIO_TOP_FOUT7(UIO_TOP_FOUT7),
        .UIO_TOP_FOUT8(UIO_TOP_FOUT8),
        .UIO_TOP_FOUT9(UIO_TOP_FOUT9),
        .S1BEG0(S1BEG[0]),
        .S1BEG1(S1BEG[1]),
        .S1BEG2(S1BEG[2]),
        .S1BEG3(S1BEG[3]),
        .S2BEG0(S2BEG[0]),
        .S2BEG1(S2BEG[1]),
        .S2BEG2(S2BEG[2]),
        .S2BEG3(S2BEG[3]),
        .S2BEG4(S2BEG[4]),
        .S2BEG5(S2BEG[5]),
        .S2BEG6(S2BEG[6]),
        .S2BEG7(S2BEG[7]),
        .S2BEGb0(S2BEGb[0]),
        .S2BEGb1(S2BEGb[1]),
        .S2BEGb2(S2BEGb[2]),
        .S2BEGb3(S2BEGb[3]),
        .S2BEGb4(S2BEGb[4]),
        .S2BEGb5(S2BEGb[5]),
        .S2BEGb6(S2BEGb[6]),
        .S2BEGb7(S2BEGb[7]),
        .S4BEG0(S4BEG[0]),
        .S4BEG1(S4BEG[1]),
        .S4BEG2(S4BEG[2]),
        .S4BEG3(S4BEG[3]),
        .S4BEG4(S4BEG[4]),
        .S4BEG5(S4BEG[5]),
        .S4BEG6(S4BEG[6]),
        .S4BEG7(S4BEG[7]),
        .S4BEG8(S4BEG[8]),
        .S4BEG9(S4BEG[9]),
        .S4BEG10(S4BEG[10]),
        .S4BEG11(S4BEG[11]),
        .S4BEG12(S4BEG[12]),
        .S4BEG13(S4BEG[13]),
        .S4BEG14(S4BEG[14]),
        .S4BEG15(S4BEG[15]),
        .SS4BEG0(SS4BEG[0]),
        .SS4BEG1(SS4BEG[1]),
        .SS4BEG2(SS4BEG[2]),
        .SS4BEG3(SS4BEG[3]),
        .SS4BEG4(SS4BEG[4]),
        .SS4BEG5(SS4BEG[5]),
        .SS4BEG6(SS4BEG[6]),
        .SS4BEG7(SS4BEG[7]),
        .SS4BEG8(SS4BEG[8]),
        .SS4BEG9(SS4BEG[9]),
        .SS4BEG10(SS4BEG[10]),
        .SS4BEG11(SS4BEG[11]),
        .SS4BEG12(SS4BEG[12]),
        .SS4BEG13(SS4BEG[13]),
        .SS4BEG14(SS4BEG[14]),
        .SS4BEG15(SS4BEG[15]),
        .UIO_TOP_FIN0(UIO_TOP_FIN0),
        .UIO_TOP_FIN1(UIO_TOP_FIN1),
        .UIO_TOP_FIN10(UIO_TOP_FIN10),
        .UIO_TOP_FIN11(UIO_TOP_FIN11),
        .UIO_TOP_FIN12(UIO_TOP_FIN12),
        .UIO_TOP_FIN13(UIO_TOP_FIN13),
        .UIO_TOP_FIN14(UIO_TOP_FIN14),
        .UIO_TOP_FIN15(UIO_TOP_FIN15),
        .UIO_TOP_FIN16(UIO_TOP_FIN16),
        .UIO_TOP_FIN17(UIO_TOP_FIN17),
        .UIO_TOP_FIN18(UIO_TOP_FIN18),
        .UIO_TOP_FIN19(UIO_TOP_FIN19),
        .UIO_TOP_FIN2(UIO_TOP_FIN2),
        .UIO_TOP_FIN3(UIO_TOP_FIN3),
        .UIO_TOP_FIN4(UIO_TOP_FIN4),
        .UIO_TOP_FIN5(UIO_TOP_FIN5),
        .UIO_TOP_FIN6(UIO_TOP_FIN6),
        .UIO_TOP_FIN7(UIO_TOP_FIN7),
        .UIO_TOP_FIN8(UIO_TOP_FIN8),
        .UIO_TOP_FIN9(UIO_TOP_FIN9)
    );

endmodule
/* verilator lint_on UNOPTFLAT */  /* verilator lint_on UNUSEDSIGNAL */
/* verilator lint_on UNUSEDPARAM */


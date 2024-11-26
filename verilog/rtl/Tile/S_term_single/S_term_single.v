/// sta-blackbox
/* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNUSEDPARAM */

`timescale 1ns / 1ps
module S_term_single #(
`ifdef EMULATION
    parameter [639:0] Emulate_Bitstream = 640'b0,
`endif
    parameter MaxFramesPerCol = 20,
    parameter FrameBitsPerRow = 32,
    parameter NoConfigBits = 0
) (
    //Side.NORTH
`ifdef USE_POWER_PINS
    input wire vccd1,
    input wire vssd1,
`endif
    output [3:0] N1BEG,        //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    output [7:0] N2BEG,        //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    output [7:0] N2BEGb,        //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    output [15:0] N4BEG,        //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    output [15:0] NN4BEG,        //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    output [0:0] Co,  //Port(Name=Co, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=1, Side=NORTH)
    input [3:0] S1END,  //Port(Name=S1END, IO=INPUT, XOffset=0, YOffset=1, WireCount=4, Side=NORTH)
    input [7:0] S2MID,  //Port(Name=S2MID, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
    input [7:0] S2END,  //Port(Name=S2END, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
    input [15:0] S4END,  //Port(Name=S4END, IO=INPUT, XOffset=0, YOffset=4, WireCount=4, Side=NORTH)
    input [15:0] SS4END,        //Port(Name=SS4END, IO=INPUT, XOffset=0, YOffset=4, WireCount=4, Side=NORTH)
    input UIO_BOT_UIN0,
    input UIO_BOT_UIN1,
    input UIO_BOT_UIN10,
    input UIO_BOT_UIN11,
    input UIO_BOT_UIN12,
    input UIO_BOT_UIN13,
    input UIO_BOT_UIN14,
    input UIO_BOT_UIN15,
    input UIO_BOT_UIN16,
    input UIO_BOT_UIN17,
    input UIO_BOT_UIN18,
    input UIO_BOT_UIN19,
    input UIO_BOT_UIN2,
    input UIO_BOT_UIN3,
    input UIO_BOT_UIN4,
    input UIO_BOT_UIN5,
    input UIO_BOT_UIN6,
    input UIO_BOT_UIN7,
    input UIO_BOT_UIN8,
    input UIO_BOT_UIN9,
    output UIO_BOT_UOUT0,
    output UIO_BOT_UOUT1,
    output UIO_BOT_UOUT10,
    output UIO_BOT_UOUT11,
    output UIO_BOT_UOUT12,
    output UIO_BOT_UOUT13,
    output UIO_BOT_UOUT14,
    output UIO_BOT_UOUT15,
    output UIO_BOT_UOUT16,
    output UIO_BOT_UOUT17,
    output UIO_BOT_UOUT18,
    output UIO_BOT_UOUT19,
    output UIO_BOT_UOUT2,
    output UIO_BOT_UOUT3,
    output UIO_BOT_UOUT4,
    output UIO_BOT_UOUT5,
    output UIO_BOT_UOUT6,
    output UIO_BOT_UOUT7,
    output UIO_BOT_UOUT8,
    output UIO_BOT_UOUT9,
    //Tile IO ports from BELs
    input UserCLK,
    output UserCLKo,
    input [MaxFramesPerCol -1:0] FrameStrobe,
    output [MaxFramesPerCol -1:0] FrameStrobe_O
    //global
);
    //signal declarations
    //BEL ports (e.g., slices)
    wire UIO_BOT_FIN0;
    wire UIO_BOT_FIN1;
    wire UIO_BOT_FIN10;
    wire UIO_BOT_FIN11;
    wire UIO_BOT_FIN12;
    wire UIO_BOT_FIN13;
    wire UIO_BOT_FIN14;
    wire UIO_BOT_FIN15;
    wire UIO_BOT_FIN16;
    wire UIO_BOT_FIN17;
    wire UIO_BOT_FIN18;
    wire UIO_BOT_FIN19;
    wire UIO_BOT_FIN2;
    wire UIO_BOT_FIN3;
    wire UIO_BOT_FIN4;
    wire UIO_BOT_FIN5;
    wire UIO_BOT_FIN6;
    wire UIO_BOT_FIN7;
    wire UIO_BOT_FIN8;
    wire UIO_BOT_FIN9;
    wire UIO_BOT_FOUT0;
    wire UIO_BOT_FOUT1;
    wire UIO_BOT_FOUT10;
    wire UIO_BOT_FOUT11;
    wire UIO_BOT_FOUT12;
    wire UIO_BOT_FOUT13;
    wire UIO_BOT_FOUT14;
    wire UIO_BOT_FOUT15;
    wire UIO_BOT_FOUT16;
    wire UIO_BOT_FOUT17;
    wire UIO_BOT_FOUT18;
    wire UIO_BOT_FOUT19;
    wire UIO_BOT_FOUT2;
    wire UIO_BOT_FOUT3;
    wire UIO_BOT_FOUT4;
    wire UIO_BOT_FOUT5;
    wire UIO_BOT_FOUT6;
    wire UIO_BOT_FOUT7;
    wire UIO_BOT_FOUT8;
    wire UIO_BOT_FOUT9;
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
    User_project_IO Inst_UIO_BOT_User_project_IO (
        .FIN0  (UIO_BOT_FIN0),
        .FIN1  (UIO_BOT_FIN1),
        .FIN10 (UIO_BOT_FIN10),
        .FIN11 (UIO_BOT_FIN11),
        .FIN12 (UIO_BOT_FIN12),
        .FIN13 (UIO_BOT_FIN13),
        .FIN14 (UIO_BOT_FIN14),
        .FIN15 (UIO_BOT_FIN15),
        .FIN16 (UIO_BOT_FIN16),
        .FIN17 (UIO_BOT_FIN17),
        .FIN18 (UIO_BOT_FIN18),
        .FIN19 (UIO_BOT_FIN19),
        .FIN2  (UIO_BOT_FIN2),
        .FIN3  (UIO_BOT_FIN3),
        .FIN4  (UIO_BOT_FIN4),
        .FIN5  (UIO_BOT_FIN5),
        .FIN6  (UIO_BOT_FIN6),
        .FIN7  (UIO_BOT_FIN7),
        .FIN8  (UIO_BOT_FIN8),
        .FIN9  (UIO_BOT_FIN9),
        .FOUT0 (UIO_BOT_FOUT0),
        .FOUT1 (UIO_BOT_FOUT1),
        .FOUT10(UIO_BOT_FOUT10),
        .FOUT11(UIO_BOT_FOUT11),
        .FOUT12(UIO_BOT_FOUT12),
        .FOUT13(UIO_BOT_FOUT13),
        .FOUT14(UIO_BOT_FOUT14),
        .FOUT15(UIO_BOT_FOUT15),
        .FOUT16(UIO_BOT_FOUT16),
        .FOUT17(UIO_BOT_FOUT17),
        .FOUT18(UIO_BOT_FOUT18),
        .FOUT19(UIO_BOT_FOUT19),
        .FOUT2 (UIO_BOT_FOUT2),
        .FOUT3 (UIO_BOT_FOUT3),
        .FOUT4 (UIO_BOT_FOUT4),
        .FOUT5 (UIO_BOT_FOUT5),
        .FOUT6 (UIO_BOT_FOUT6),
        .FOUT7 (UIO_BOT_FOUT7),
        .FOUT8 (UIO_BOT_FOUT8),
        .FOUT9 (UIO_BOT_FOUT9),
        .UIN0  (UIO_BOT_UIN0),
        .UIN1  (UIO_BOT_UIN1),
        .UIN10 (UIO_BOT_UIN10),
        .UIN11 (UIO_BOT_UIN11),
        .UIN12 (UIO_BOT_UIN12),
        .UIN13 (UIO_BOT_UIN13),
        .UIN14 (UIO_BOT_UIN14),
        .UIN15 (UIO_BOT_UIN15),
        .UIN16 (UIO_BOT_UIN16),
        .UIN17 (UIO_BOT_UIN17),
        .UIN18 (UIO_BOT_UIN18),
        .UIN19 (UIO_BOT_UIN19),
        .UIN2  (UIO_BOT_UIN2),
        .UIN3  (UIO_BOT_UIN3),
        .UIN4  (UIO_BOT_UIN4),
        .UIN5  (UIO_BOT_UIN5),
        .UIN6  (UIO_BOT_UIN6),
        .UIN7  (UIO_BOT_UIN7),
        .UIN8  (UIO_BOT_UIN8),
        .UIN9  (UIO_BOT_UIN9),
        .UOUT0 (UIO_BOT_UOUT0),
        .UOUT1 (UIO_BOT_UOUT1),
        .UOUT10(UIO_BOT_UOUT10),
        .UOUT11(UIO_BOT_UOUT11),
        .UOUT12(UIO_BOT_UOUT12),
        .UOUT13(UIO_BOT_UOUT13),
        .UOUT14(UIO_BOT_UOUT14),
        .UOUT15(UIO_BOT_UOUT15),
        .UOUT16(UIO_BOT_UOUT16),
        .UOUT17(UIO_BOT_UOUT17),
        .UOUT18(UIO_BOT_UOUT18),
        .UOUT19(UIO_BOT_UOUT19),
        .UOUT2 (UIO_BOT_UOUT2),
        .UOUT3 (UIO_BOT_UOUT3),
        .UOUT4 (UIO_BOT_UOUT4),
        .UOUT5 (UIO_BOT_UOUT5),
        .UOUT6 (UIO_BOT_UOUT6),
        .UOUT7 (UIO_BOT_UOUT7),
        .UOUT8 (UIO_BOT_UOUT8),
        .UOUT9 (UIO_BOT_UOUT9)
    );

    S_term_single_switch_matrix Inst_S_term_single_switch_matrix (
        .S1END0(S1END[0]),
        .S1END1(S1END[1]),
        .S1END2(S1END[2]),
        .S1END3(S1END[3]),
        .S2MID0(S2MID[0]),
        .S2MID1(S2MID[1]),
        .S2MID2(S2MID[2]),
        .S2MID3(S2MID[3]),
        .S2MID4(S2MID[4]),
        .S2MID5(S2MID[5]),
        .S2MID6(S2MID[6]),
        .S2MID7(S2MID[7]),
        .S2END0(S2END[0]),
        .S2END1(S2END[1]),
        .S2END2(S2END[2]),
        .S2END3(S2END[3]),
        .S2END4(S2END[4]),
        .S2END5(S2END[5]),
        .S2END6(S2END[6]),
        .S2END7(S2END[7]),
        .S4END0(S4END[0]),
        .S4END1(S4END[1]),
        .S4END2(S4END[2]),
        .S4END3(S4END[3]),
        .S4END4(S4END[4]),
        .S4END5(S4END[5]),
        .S4END6(S4END[6]),
        .S4END7(S4END[7]),
        .S4END8(S4END[8]),
        .S4END9(S4END[9]),
        .S4END10(S4END[10]),
        .S4END11(S4END[11]),
        .S4END12(S4END[12]),
        .S4END13(S4END[13]),
        .S4END14(S4END[14]),
        .S4END15(S4END[15]),
        .SS4END0(SS4END[0]),
        .SS4END1(SS4END[1]),
        .SS4END2(SS4END[2]),
        .SS4END3(SS4END[3]),
        .SS4END4(SS4END[4]),
        .SS4END5(SS4END[5]),
        .SS4END6(SS4END[6]),
        .SS4END7(SS4END[7]),
        .SS4END8(SS4END[8]),
        .SS4END9(SS4END[9]),
        .SS4END10(SS4END[10]),
        .SS4END11(SS4END[11]),
        .SS4END12(SS4END[12]),
        .SS4END13(SS4END[13]),
        .SS4END14(SS4END[14]),
        .SS4END15(SS4END[15]),
        .UIO_BOT_FOUT0(UIO_BOT_FOUT0),
        .UIO_BOT_FOUT1(UIO_BOT_FOUT1),
        .UIO_BOT_FOUT10(UIO_BOT_FOUT10),
        .UIO_BOT_FOUT11(UIO_BOT_FOUT11),
        .UIO_BOT_FOUT12(UIO_BOT_FOUT12),
        .UIO_BOT_FOUT13(UIO_BOT_FOUT13),
        .UIO_BOT_FOUT14(UIO_BOT_FOUT14),
        .UIO_BOT_FOUT15(UIO_BOT_FOUT15),
        .UIO_BOT_FOUT16(UIO_BOT_FOUT16),
        .UIO_BOT_FOUT17(UIO_BOT_FOUT17),
        .UIO_BOT_FOUT18(UIO_BOT_FOUT18),
        .UIO_BOT_FOUT19(UIO_BOT_FOUT19),
        .UIO_BOT_FOUT2(UIO_BOT_FOUT2),
        .UIO_BOT_FOUT3(UIO_BOT_FOUT3),
        .UIO_BOT_FOUT4(UIO_BOT_FOUT4),
        .UIO_BOT_FOUT5(UIO_BOT_FOUT5),
        .UIO_BOT_FOUT6(UIO_BOT_FOUT6),
        .UIO_BOT_FOUT7(UIO_BOT_FOUT7),
        .UIO_BOT_FOUT8(UIO_BOT_FOUT8),
        .UIO_BOT_FOUT9(UIO_BOT_FOUT9),
        .N1BEG0(N1BEG[0]),
        .N1BEG1(N1BEG[1]),
        .N1BEG2(N1BEG[2]),
        .N1BEG3(N1BEG[3]),
        .N2BEG0(N2BEG[0]),
        .N2BEG1(N2BEG[1]),
        .N2BEG2(N2BEG[2]),
        .N2BEG3(N2BEG[3]),
        .N2BEG4(N2BEG[4]),
        .N2BEG5(N2BEG[5]),
        .N2BEG6(N2BEG[6]),
        .N2BEG7(N2BEG[7]),
        .N2BEGb0(N2BEGb[0]),
        .N2BEGb1(N2BEGb[1]),
        .N2BEGb2(N2BEGb[2]),
        .N2BEGb3(N2BEGb[3]),
        .N2BEGb4(N2BEGb[4]),
        .N2BEGb5(N2BEGb[5]),
        .N2BEGb6(N2BEGb[6]),
        .N2BEGb7(N2BEGb[7]),
        .N4BEG0(N4BEG[0]),
        .N4BEG1(N4BEG[1]),
        .N4BEG2(N4BEG[2]),
        .N4BEG3(N4BEG[3]),
        .N4BEG4(N4BEG[4]),
        .N4BEG5(N4BEG[5]),
        .N4BEG6(N4BEG[6]),
        .N4BEG7(N4BEG[7]),
        .N4BEG8(N4BEG[8]),
        .N4BEG9(N4BEG[9]),
        .N4BEG10(N4BEG[10]),
        .N4BEG11(N4BEG[11]),
        .N4BEG12(N4BEG[12]),
        .N4BEG13(N4BEG[13]),
        .N4BEG14(N4BEG[14]),
        .N4BEG15(N4BEG[15]),
        .NN4BEG0(NN4BEG[0]),
        .NN4BEG1(NN4BEG[1]),
        .NN4BEG2(NN4BEG[2]),
        .NN4BEG3(NN4BEG[3]),
        .NN4BEG4(NN4BEG[4]),
        .NN4BEG5(NN4BEG[5]),
        .NN4BEG6(NN4BEG[6]),
        .NN4BEG7(NN4BEG[7]),
        .NN4BEG8(NN4BEG[8]),
        .NN4BEG9(NN4BEG[9]),
        .NN4BEG10(NN4BEG[10]),
        .NN4BEG11(NN4BEG[11]),
        .NN4BEG12(NN4BEG[12]),
        .NN4BEG13(NN4BEG[13]),
        .NN4BEG14(NN4BEG[14]),
        .NN4BEG15(NN4BEG[15]),
        .Co0(Co[0]),
        .UIO_BOT_FIN0(UIO_BOT_FIN0),
        .UIO_BOT_FIN1(UIO_BOT_FIN1),
        .UIO_BOT_FIN10(UIO_BOT_FIN10),
        .UIO_BOT_FIN11(UIO_BOT_FIN11),
        .UIO_BOT_FIN12(UIO_BOT_FIN12),
        .UIO_BOT_FIN13(UIO_BOT_FIN13),
        .UIO_BOT_FIN14(UIO_BOT_FIN14),
        .UIO_BOT_FIN15(UIO_BOT_FIN15),
        .UIO_BOT_FIN16(UIO_BOT_FIN16),
        .UIO_BOT_FIN17(UIO_BOT_FIN17),
        .UIO_BOT_FIN18(UIO_BOT_FIN18),
        .UIO_BOT_FIN19(UIO_BOT_FIN19),
        .UIO_BOT_FIN2(UIO_BOT_FIN2),
        .UIO_BOT_FIN3(UIO_BOT_FIN3),
        .UIO_BOT_FIN4(UIO_BOT_FIN4),
        .UIO_BOT_FIN5(UIO_BOT_FIN5),
        .UIO_BOT_FIN6(UIO_BOT_FIN6),
        .UIO_BOT_FIN7(UIO_BOT_FIN7),
        .UIO_BOT_FIN8(UIO_BOT_FIN8),
        .UIO_BOT_FIN9(UIO_BOT_FIN9)
    );

endmodule
/* verilator lint_on UNOPTFLAT */  /* verilator lint_on UNUSEDSIGNAL */
/* verilator lint_on UNUSEDPARAM */


module SCC6
    #(
`ifdef EMULATION
        parameter [639:0] Emulate_Bitstream=640'b0,
`endif
        parameter MaxFramesPerCol=20,
        parameter FrameBitsPerRow=32,
        parameter NoConfigBits=376
    )
    (
 //Side.NORTH
        output [47:0] o_6to0,        //Port(Name=o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
        output [39:0] o_6to1,        //Port(Name=o_6to1, IO=OUTPUT, XOffset=0, YOffset=-5, WireCount=8, Side=NORTH)
        output [31:0] o_6to2,        //Port(Name=o_6to2, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=8, Side=NORTH)
        output [23:0] o_6to3,        //Port(Name=o_6to3, IO=OUTPUT, XOffset=0, YOffset=-3, WireCount=8, Side=NORTH)
        output [15:0] o_6to4,        //Port(Name=o_6to4, IO=OUTPUT, XOffset=0, YOffset=-2, WireCount=8, Side=NORTH)
        output [7:0] o_6to5,        //Port(Name=o_6to5, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
        input [47:0] i_0to6,        //Port(Name=i_0to6, IO=INPUT, XOffset=0, YOffset=6, WireCount=8, Side=NORTH)
        input [39:0] i_1to6,        //Port(Name=i_1to6, IO=INPUT, XOffset=0, YOffset=5, WireCount=8, Side=NORTH)
        input [31:0] i_2to6,        //Port(Name=i_2to6, IO=INPUT, XOffset=0, YOffset=4, WireCount=8, Side=NORTH)
        input [23:0] i_3to6,        //Port(Name=i_3to6, IO=INPUT, XOffset=0, YOffset=3, WireCount=8, Side=NORTH)
        input [15:0] i_4to6,        //Port(Name=i_4to6, IO=INPUT, XOffset=0, YOffset=2, WireCount=8, Side=NORTH)
        input [7:0] i_5to6,        //Port(Name=i_5to6, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
        output [3:0] N1BEG,        //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
        output [7:0] N2BEG,        //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
        output [7:0] N2BEGb,        //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
        output [15:0] N4BEG,        //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
        output [15:0] NN4BEG,        //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
        input [3:0] S1END,        //Port(Name=S1END, IO=INPUT, XOffset=0, YOffset=1, WireCount=4, Side=NORTH)
        input [7:0] S2MID,        //Port(Name=S2MID, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
        input [7:0] S2END,        //Port(Name=S2END, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
        input [15:0] S4END,        //Port(Name=S4END, IO=INPUT, XOffset=0, YOffset=4, WireCount=4, Side=NORTH)
        input [15:0] SS4END,        //Port(Name=SS4END, IO=INPUT, XOffset=0, YOffset=4, WireCount=4, Side=NORTH)
 //Side.EAST
        output [55:0] o_e2w,        //Port(Name=o_e2w, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=56, Side=EAST)
        input [55:0] i_w2e,        //Port(Name=i_w2e, IO=INPUT, XOffset=0, YOffset=-1, WireCount=56, Side=EAST)
        output [3:0] E1BEG,        //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
        output [7:0] E2BEG,        //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [7:0] E2BEGb,        //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [15:0] EE4BEG,        //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
        output [11:0] E6BEG,        //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
        input [3:0] W1END,        //Port(Name=W1END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=4, Side=EAST)
        input [7:0] W2MID,        //Port(Name=W2MID, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [7:0] W2END,        //Port(Name=W2END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [15:0] WW4END,        //Port(Name=WW4END, IO=INPUT, XOffset=-4, YOffset=0, WireCount=4, Side=EAST)
        input [11:0] W6END,        //Port(Name=W6END, IO=INPUT, XOffset=-6, YOffset=0, WireCount=2, Side=EAST)
 //Side.WEST
        input [3:0] E1END,        //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input [7:0] E2MID,        //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [7:0] E2END,        //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [15:0] EE4END,        //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input [11:0] E6END,        //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output [3:0] W1BEG,        //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output [7:0] W2BEG,        //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [7:0] W2BEGb,        //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [15:0] WW4BEG,        //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output [11:0] W6BEG,        //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
 //Side.SOUTH
        input [3:0] N1END,        //Port(Name=N1END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=4, Side=SOUTH)
        input [7:0] N2MID,        //Port(Name=N2MID, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
        input [7:0] N2END,        //Port(Name=N2END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
        input [15:0] N4END,        //Port(Name=N4END, IO=INPUT, XOffset=0, YOffset=-4, WireCount=4, Side=SOUTH)
        input [15:0] NN4END,        //Port(Name=NN4END, IO=INPUT, XOffset=0, YOffset=-4, WireCount=4, Side=SOUTH)
        output [3:0] S1BEG,        //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
        output [7:0] S2BEG,        //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
        output [7:0] S2BEGb,        //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
        output [15:0] S4BEG,        //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
        output [15:0] SS4BEG,        //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    //Tile IO ports from BELs
        input UserCLK,
        output UserCLKo,
        input [FrameBitsPerRow -1:0] FrameData, //CONFIG_PORT
        output [FrameBitsPerRow -1:0] FrameData_O,
        input [MaxFramesPerCol -1:0] FrameStrobe, //CONFIG_PORT
        output [MaxFramesPerCol -1:0] FrameStrobe_O
    //global
);
 //signal declarations
 //BEL ports (e.g., slices)
wire clk;
wire clk_en;
wire req_cxu0;
wire req_cxu1;
wire req_data00;
wire req_data01;
wire req_data02;
wire req_data03;
wire req_data04;
wire req_data05;
wire req_data06;
wire req_data07;
wire req_data08;
wire req_data09;
wire req_data010;
wire req_data011;
wire req_data012;
wire req_data013;
wire req_data014;
wire req_data015;
wire req_data016;
wire req_data017;
wire req_data018;
wire req_data019;
wire req_data020;
wire req_data021;
wire req_data022;
wire req_data023;
wire req_data024;
wire req_data025;
wire req_data026;
wire req_data027;
wire req_data028;
wire req_data029;
wire req_data030;
wire req_data031;
wire req_data10;
wire req_data11;
wire req_data12;
wire req_data13;
wire req_data14;
wire req_data15;
wire req_data16;
wire req_data17;
wire req_data18;
wire req_data19;
wire req_data110;
wire req_data111;
wire req_data112;
wire req_data113;
wire req_data114;
wire req_data115;
wire req_data116;
wire req_data117;
wire req_data118;
wire req_data119;
wire req_data120;
wire req_data121;
wire req_data122;
wire req_data123;
wire req_data124;
wire req_data125;
wire req_data126;
wire req_data127;
wire req_data128;
wire req_data129;
wire req_data130;
wire req_data131;
wire req_func0;
wire req_func1;
wire req_func2;
wire req_insn;
wire req_state;
wire req_valid;
wire resp_ready;
wire rst;
wire t_req_ready;
wire t_resp_data0;
wire t_resp_data1;
wire t_resp_data2;
wire t_resp_data3;
wire t_resp_data4;
wire t_resp_data5;
wire t_resp_data6;
wire t_resp_data7;
wire t_resp_data8;
wire t_resp_data9;
wire t_resp_data10;
wire t_resp_data11;
wire t_resp_data12;
wire t_resp_data13;
wire t_resp_data14;
wire t_resp_data15;
wire t_resp_data16;
wire t_resp_data17;
wire t_resp_data18;
wire t_resp_data19;
wire t_resp_data20;
wire t_resp_data21;
wire t_resp_data22;
wire t_resp_data23;
wire t_resp_data24;
wire t_resp_data25;
wire t_resp_data26;
wire t_resp_data27;
wire t_resp_data28;
wire t_resp_data29;
wire t_resp_data30;
wire t_resp_data31;
wire t_resp_status0;
wire t_resp_status1;
wire t_resp_status2;
wire t_resp_valid;
wire req_ready;
wire resp_data0;
wire resp_data1;
wire resp_data2;
wire resp_data3;
wire resp_data4;
wire resp_data5;
wire resp_data6;
wire resp_data7;
wire resp_data8;
wire resp_data9;
wire resp_data10;
wire resp_data11;
wire resp_data12;
wire resp_data13;
wire resp_data14;
wire resp_data15;
wire resp_data16;
wire resp_data17;
wire resp_data18;
wire resp_data19;
wire resp_data20;
wire resp_data21;
wire resp_data22;
wire resp_data23;
wire resp_data24;
wire resp_data25;
wire resp_data26;
wire resp_data27;
wire resp_data28;
wire resp_data29;
wire resp_data30;
wire resp_data31;
wire resp_status0;
wire resp_status1;
wire resp_status2;
wire resp_valid;
wire t_req_cxu0;
wire t_req_cxu1;
wire t_req_data00;
wire t_req_data01;
wire t_req_data02;
wire t_req_data03;
wire t_req_data04;
wire t_req_data05;
wire t_req_data06;
wire t_req_data07;
wire t_req_data08;
wire t_req_data09;
wire t_req_data010;
wire t_req_data011;
wire t_req_data012;
wire t_req_data013;
wire t_req_data014;
wire t_req_data015;
wire t_req_data016;
wire t_req_data017;
wire t_req_data018;
wire t_req_data019;
wire t_req_data020;
wire t_req_data021;
wire t_req_data022;
wire t_req_data023;
wire t_req_data024;
wire t_req_data025;
wire t_req_data026;
wire t_req_data027;
wire t_req_data028;
wire t_req_data029;
wire t_req_data030;
wire t_req_data031;
wire t_req_data10;
wire t_req_data11;
wire t_req_data12;
wire t_req_data13;
wire t_req_data14;
wire t_req_data15;
wire t_req_data16;
wire t_req_data17;
wire t_req_data18;
wire t_req_data19;
wire t_req_data110;
wire t_req_data111;
wire t_req_data112;
wire t_req_data113;
wire t_req_data114;
wire t_req_data115;
wire t_req_data116;
wire t_req_data117;
wire t_req_data118;
wire t_req_data119;
wire t_req_data120;
wire t_req_data121;
wire t_req_data122;
wire t_req_data123;
wire t_req_data124;
wire t_req_data125;
wire t_req_data126;
wire t_req_data127;
wire t_req_data128;
wire t_req_data129;
wire t_req_data130;
wire t_req_data131;
wire t_req_func0;
wire t_req_func1;
wire t_req_func2;
wire t_req_insn;
wire t_req_state;
wire t_req_valid;
wire t_resp_ready;
 //Jump wires
wire[4-1:0] J2MID_ABa_BEG;
wire[4-1:0] J2MID_CDa_BEG;
wire[4-1:0] J2MID_EFa_BEG;
wire[4-1:0] J2MID_GHa_BEG;
wire[4-1:0] J2MID_ABb_BEG;
wire[4-1:0] J2MID_CDb_BEG;
wire[4-1:0] J2MID_EFb_BEG;
wire[4-1:0] J2MID_GHb_BEG;
wire[4-1:0] J2END_AB_BEG;
wire[4-1:0] J2END_CD_BEG;
wire[4-1:0] J2END_EF_BEG;
wire[4-1:0] J2END_GH_BEG;
wire[8-1:0] JN2BEG;
wire[8-1:0] JE2BEG;
wire[8-1:0] JS2BEG;
wire[8-1:0] JW2BEG;
wire[4-1:0] J_l_AB_BEG;
wire[4-1:0] J_l_CD_BEG;
wire[4-1:0] J_l_EF_BEG;
wire[4-1:0] J_l_GH_BEG;
 //internal configuration data signal to daisy-chain all BELs (if any and in the order they are listed in the fabric.csv)
wire[NoConfigBits-1:0] ConfigBits;
wire[NoConfigBits-1:0] ConfigBits_N;

 //Connection for outgoing wires
wire[FrameBitsPerRow-1:0] FrameData_i;
wire[FrameBitsPerRow-1:0] FrameData_O_i;
wire[MaxFramesPerCol-1:0] FrameStrobe_i;
wire[MaxFramesPerCol-1:0] FrameStrobe_O_i;
wire[15:0] N4END_i;
wire[11:0] N4BEG_i;
wire[15:0] NN4END_i;
wire[11:0] NN4BEG_i;
wire[15:0] EE4END_i;
wire[11:0] EE4BEG_i;
wire[11:0] E6END_i;
wire[9:0] E6BEG_i;
wire[15:0] S4END_i;
wire[11:0] S4BEG_i;
wire[15:0] SS4END_i;
wire[11:0] SS4BEG_i;
wire[15:0] WW4END_i;
wire[11:0] WW4BEG_i;
wire[11:0] W6END_i;
wire[9:0] W6BEG_i;

assign FrameData_O_i = FrameData_i;

my_buf data_inbuf_0 (
    .A(FrameData[0]),
    .X(FrameData_i[0])
);

my_buf data_inbuf_1 (
    .A(FrameData[1]),
    .X(FrameData_i[1])
);

my_buf data_inbuf_2 (
    .A(FrameData[2]),
    .X(FrameData_i[2])
);

my_buf data_inbuf_3 (
    .A(FrameData[3]),
    .X(FrameData_i[3])
);

my_buf data_inbuf_4 (
    .A(FrameData[4]),
    .X(FrameData_i[4])
);

my_buf data_inbuf_5 (
    .A(FrameData[5]),
    .X(FrameData_i[5])
);

my_buf data_inbuf_6 (
    .A(FrameData[6]),
    .X(FrameData_i[6])
);

my_buf data_inbuf_7 (
    .A(FrameData[7]),
    .X(FrameData_i[7])
);

my_buf data_inbuf_8 (
    .A(FrameData[8]),
    .X(FrameData_i[8])
);

my_buf data_inbuf_9 (
    .A(FrameData[9]),
    .X(FrameData_i[9])
);

my_buf data_inbuf_10 (
    .A(FrameData[10]),
    .X(FrameData_i[10])
);

my_buf data_inbuf_11 (
    .A(FrameData[11]),
    .X(FrameData_i[11])
);

my_buf data_inbuf_12 (
    .A(FrameData[12]),
    .X(FrameData_i[12])
);

my_buf data_inbuf_13 (
    .A(FrameData[13]),
    .X(FrameData_i[13])
);

my_buf data_inbuf_14 (
    .A(FrameData[14]),
    .X(FrameData_i[14])
);

my_buf data_inbuf_15 (
    .A(FrameData[15]),
    .X(FrameData_i[15])
);

my_buf data_inbuf_16 (
    .A(FrameData[16]),
    .X(FrameData_i[16])
);

my_buf data_inbuf_17 (
    .A(FrameData[17]),
    .X(FrameData_i[17])
);

my_buf data_inbuf_18 (
    .A(FrameData[18]),
    .X(FrameData_i[18])
);

my_buf data_inbuf_19 (
    .A(FrameData[19]),
    .X(FrameData_i[19])
);

my_buf data_inbuf_20 (
    .A(FrameData[20]),
    .X(FrameData_i[20])
);

my_buf data_inbuf_21 (
    .A(FrameData[21]),
    .X(FrameData_i[21])
);

my_buf data_inbuf_22 (
    .A(FrameData[22]),
    .X(FrameData_i[22])
);

my_buf data_inbuf_23 (
    .A(FrameData[23]),
    .X(FrameData_i[23])
);

my_buf data_inbuf_24 (
    .A(FrameData[24]),
    .X(FrameData_i[24])
);

my_buf data_inbuf_25 (
    .A(FrameData[25]),
    .X(FrameData_i[25])
);

my_buf data_inbuf_26 (
    .A(FrameData[26]),
    .X(FrameData_i[26])
);

my_buf data_inbuf_27 (
    .A(FrameData[27]),
    .X(FrameData_i[27])
);

my_buf data_inbuf_28 (
    .A(FrameData[28]),
    .X(FrameData_i[28])
);

my_buf data_inbuf_29 (
    .A(FrameData[29]),
    .X(FrameData_i[29])
);

my_buf data_inbuf_30 (
    .A(FrameData[30]),
    .X(FrameData_i[30])
);

my_buf data_inbuf_31 (
    .A(FrameData[31]),
    .X(FrameData_i[31])
);

my_buf data_outbuf_0 (
    .A(FrameData_O_i[0]),
    .X(FrameData_O[0])
);

my_buf data_outbuf_1 (
    .A(FrameData_O_i[1]),
    .X(FrameData_O[1])
);

my_buf data_outbuf_2 (
    .A(FrameData_O_i[2]),
    .X(FrameData_O[2])
);

my_buf data_outbuf_3 (
    .A(FrameData_O_i[3]),
    .X(FrameData_O[3])
);

my_buf data_outbuf_4 (
    .A(FrameData_O_i[4]),
    .X(FrameData_O[4])
);

my_buf data_outbuf_5 (
    .A(FrameData_O_i[5]),
    .X(FrameData_O[5])
);

my_buf data_outbuf_6 (
    .A(FrameData_O_i[6]),
    .X(FrameData_O[6])
);

my_buf data_outbuf_7 (
    .A(FrameData_O_i[7]),
    .X(FrameData_O[7])
);

my_buf data_outbuf_8 (
    .A(FrameData_O_i[8]),
    .X(FrameData_O[8])
);

my_buf data_outbuf_9 (
    .A(FrameData_O_i[9]),
    .X(FrameData_O[9])
);

my_buf data_outbuf_10 (
    .A(FrameData_O_i[10]),
    .X(FrameData_O[10])
);

my_buf data_outbuf_11 (
    .A(FrameData_O_i[11]),
    .X(FrameData_O[11])
);

my_buf data_outbuf_12 (
    .A(FrameData_O_i[12]),
    .X(FrameData_O[12])
);

my_buf data_outbuf_13 (
    .A(FrameData_O_i[13]),
    .X(FrameData_O[13])
);

my_buf data_outbuf_14 (
    .A(FrameData_O_i[14]),
    .X(FrameData_O[14])
);

my_buf data_outbuf_15 (
    .A(FrameData_O_i[15]),
    .X(FrameData_O[15])
);

my_buf data_outbuf_16 (
    .A(FrameData_O_i[16]),
    .X(FrameData_O[16])
);

my_buf data_outbuf_17 (
    .A(FrameData_O_i[17]),
    .X(FrameData_O[17])
);

my_buf data_outbuf_18 (
    .A(FrameData_O_i[18]),
    .X(FrameData_O[18])
);

my_buf data_outbuf_19 (
    .A(FrameData_O_i[19]),
    .X(FrameData_O[19])
);

my_buf data_outbuf_20 (
    .A(FrameData_O_i[20]),
    .X(FrameData_O[20])
);

my_buf data_outbuf_21 (
    .A(FrameData_O_i[21]),
    .X(FrameData_O[21])
);

my_buf data_outbuf_22 (
    .A(FrameData_O_i[22]),
    .X(FrameData_O[22])
);

my_buf data_outbuf_23 (
    .A(FrameData_O_i[23]),
    .X(FrameData_O[23])
);

my_buf data_outbuf_24 (
    .A(FrameData_O_i[24]),
    .X(FrameData_O[24])
);

my_buf data_outbuf_25 (
    .A(FrameData_O_i[25]),
    .X(FrameData_O[25])
);

my_buf data_outbuf_26 (
    .A(FrameData_O_i[26]),
    .X(FrameData_O[26])
);

my_buf data_outbuf_27 (
    .A(FrameData_O_i[27]),
    .X(FrameData_O[27])
);

my_buf data_outbuf_28 (
    .A(FrameData_O_i[28]),
    .X(FrameData_O[28])
);

my_buf data_outbuf_29 (
    .A(FrameData_O_i[29]),
    .X(FrameData_O[29])
);

my_buf data_outbuf_30 (
    .A(FrameData_O_i[30]),
    .X(FrameData_O[30])
);

my_buf data_outbuf_31 (
    .A(FrameData_O_i[31]),
    .X(FrameData_O[31])
);

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

assign N4BEG_i[15-4:0] = N4END_i[15:4];

my_buf N4END_inbuf_0 (
    .A(N4END[4]),
    .X(N4END_i[4])
);

my_buf N4END_inbuf_1 (
    .A(N4END[5]),
    .X(N4END_i[5])
);

my_buf N4END_inbuf_2 (
    .A(N4END[6]),
    .X(N4END_i[6])
);

my_buf N4END_inbuf_3 (
    .A(N4END[7]),
    .X(N4END_i[7])
);

my_buf N4END_inbuf_4 (
    .A(N4END[8]),
    .X(N4END_i[8])
);

my_buf N4END_inbuf_5 (
    .A(N4END[9]),
    .X(N4END_i[9])
);

my_buf N4END_inbuf_6 (
    .A(N4END[10]),
    .X(N4END_i[10])
);

my_buf N4END_inbuf_7 (
    .A(N4END[11]),
    .X(N4END_i[11])
);

my_buf N4END_inbuf_8 (
    .A(N4END[12]),
    .X(N4END_i[12])
);

my_buf N4END_inbuf_9 (
    .A(N4END[13]),
    .X(N4END_i[13])
);

my_buf N4END_inbuf_10 (
    .A(N4END[14]),
    .X(N4END_i[14])
);

my_buf N4END_inbuf_11 (
    .A(N4END[15]),
    .X(N4END_i[15])
);

my_buf N4BEG_outbuf_0 (
    .A(N4BEG_i[0]),
    .X(N4BEG[0])
);

my_buf N4BEG_outbuf_1 (
    .A(N4BEG_i[1]),
    .X(N4BEG[1])
);

my_buf N4BEG_outbuf_2 (
    .A(N4BEG_i[2]),
    .X(N4BEG[2])
);

my_buf N4BEG_outbuf_3 (
    .A(N4BEG_i[3]),
    .X(N4BEG[3])
);

my_buf N4BEG_outbuf_4 (
    .A(N4BEG_i[4]),
    .X(N4BEG[4])
);

my_buf N4BEG_outbuf_5 (
    .A(N4BEG_i[5]),
    .X(N4BEG[5])
);

my_buf N4BEG_outbuf_6 (
    .A(N4BEG_i[6]),
    .X(N4BEG[6])
);

my_buf N4BEG_outbuf_7 (
    .A(N4BEG_i[7]),
    .X(N4BEG[7])
);

my_buf N4BEG_outbuf_8 (
    .A(N4BEG_i[8]),
    .X(N4BEG[8])
);

my_buf N4BEG_outbuf_9 (
    .A(N4BEG_i[9]),
    .X(N4BEG[9])
);

my_buf N4BEG_outbuf_10 (
    .A(N4BEG_i[10]),
    .X(N4BEG[10])
);

my_buf N4BEG_outbuf_11 (
    .A(N4BEG_i[11]),
    .X(N4BEG[11])
);

assign NN4BEG_i[15-4:0] = NN4END_i[15:4];

my_buf NN4END_inbuf_0 (
    .A(NN4END[4]),
    .X(NN4END_i[4])
);

my_buf NN4END_inbuf_1 (
    .A(NN4END[5]),
    .X(NN4END_i[5])
);

my_buf NN4END_inbuf_2 (
    .A(NN4END[6]),
    .X(NN4END_i[6])
);

my_buf NN4END_inbuf_3 (
    .A(NN4END[7]),
    .X(NN4END_i[7])
);

my_buf NN4END_inbuf_4 (
    .A(NN4END[8]),
    .X(NN4END_i[8])
);

my_buf NN4END_inbuf_5 (
    .A(NN4END[9]),
    .X(NN4END_i[9])
);

my_buf NN4END_inbuf_6 (
    .A(NN4END[10]),
    .X(NN4END_i[10])
);

my_buf NN4END_inbuf_7 (
    .A(NN4END[11]),
    .X(NN4END_i[11])
);

my_buf NN4END_inbuf_8 (
    .A(NN4END[12]),
    .X(NN4END_i[12])
);

my_buf NN4END_inbuf_9 (
    .A(NN4END[13]),
    .X(NN4END_i[13])
);

my_buf NN4END_inbuf_10 (
    .A(NN4END[14]),
    .X(NN4END_i[14])
);

my_buf NN4END_inbuf_11 (
    .A(NN4END[15]),
    .X(NN4END_i[15])
);

my_buf NN4BEG_outbuf_0 (
    .A(NN4BEG_i[0]),
    .X(NN4BEG[0])
);

my_buf NN4BEG_outbuf_1 (
    .A(NN4BEG_i[1]),
    .X(NN4BEG[1])
);

my_buf NN4BEG_outbuf_2 (
    .A(NN4BEG_i[2]),
    .X(NN4BEG[2])
);

my_buf NN4BEG_outbuf_3 (
    .A(NN4BEG_i[3]),
    .X(NN4BEG[3])
);

my_buf NN4BEG_outbuf_4 (
    .A(NN4BEG_i[4]),
    .X(NN4BEG[4])
);

my_buf NN4BEG_outbuf_5 (
    .A(NN4BEG_i[5]),
    .X(NN4BEG[5])
);

my_buf NN4BEG_outbuf_6 (
    .A(NN4BEG_i[6]),
    .X(NN4BEG[6])
);

my_buf NN4BEG_outbuf_7 (
    .A(NN4BEG_i[7]),
    .X(NN4BEG[7])
);

my_buf NN4BEG_outbuf_8 (
    .A(NN4BEG_i[8]),
    .X(NN4BEG[8])
);

my_buf NN4BEG_outbuf_9 (
    .A(NN4BEG_i[9]),
    .X(NN4BEG[9])
);

my_buf NN4BEG_outbuf_10 (
    .A(NN4BEG_i[10]),
    .X(NN4BEG[10])
);

my_buf NN4BEG_outbuf_11 (
    .A(NN4BEG_i[11]),
    .X(NN4BEG[11])
);

assign EE4BEG_i[15-4:0] = EE4END_i[15:4];

my_buf EE4END_inbuf_0 (
    .A(EE4END[4]),
    .X(EE4END_i[4])
);

my_buf EE4END_inbuf_1 (
    .A(EE4END[5]),
    .X(EE4END_i[5])
);

my_buf EE4END_inbuf_2 (
    .A(EE4END[6]),
    .X(EE4END_i[6])
);

my_buf EE4END_inbuf_3 (
    .A(EE4END[7]),
    .X(EE4END_i[7])
);

my_buf EE4END_inbuf_4 (
    .A(EE4END[8]),
    .X(EE4END_i[8])
);

my_buf EE4END_inbuf_5 (
    .A(EE4END[9]),
    .X(EE4END_i[9])
);

my_buf EE4END_inbuf_6 (
    .A(EE4END[10]),
    .X(EE4END_i[10])
);

my_buf EE4END_inbuf_7 (
    .A(EE4END[11]),
    .X(EE4END_i[11])
);

my_buf EE4END_inbuf_8 (
    .A(EE4END[12]),
    .X(EE4END_i[12])
);

my_buf EE4END_inbuf_9 (
    .A(EE4END[13]),
    .X(EE4END_i[13])
);

my_buf EE4END_inbuf_10 (
    .A(EE4END[14]),
    .X(EE4END_i[14])
);

my_buf EE4END_inbuf_11 (
    .A(EE4END[15]),
    .X(EE4END_i[15])
);

my_buf EE4BEG_outbuf_0 (
    .A(EE4BEG_i[0]),
    .X(EE4BEG[0])
);

my_buf EE4BEG_outbuf_1 (
    .A(EE4BEG_i[1]),
    .X(EE4BEG[1])
);

my_buf EE4BEG_outbuf_2 (
    .A(EE4BEG_i[2]),
    .X(EE4BEG[2])
);

my_buf EE4BEG_outbuf_3 (
    .A(EE4BEG_i[3]),
    .X(EE4BEG[3])
);

my_buf EE4BEG_outbuf_4 (
    .A(EE4BEG_i[4]),
    .X(EE4BEG[4])
);

my_buf EE4BEG_outbuf_5 (
    .A(EE4BEG_i[5]),
    .X(EE4BEG[5])
);

my_buf EE4BEG_outbuf_6 (
    .A(EE4BEG_i[6]),
    .X(EE4BEG[6])
);

my_buf EE4BEG_outbuf_7 (
    .A(EE4BEG_i[7]),
    .X(EE4BEG[7])
);

my_buf EE4BEG_outbuf_8 (
    .A(EE4BEG_i[8]),
    .X(EE4BEG[8])
);

my_buf EE4BEG_outbuf_9 (
    .A(EE4BEG_i[9]),
    .X(EE4BEG[9])
);

my_buf EE4BEG_outbuf_10 (
    .A(EE4BEG_i[10]),
    .X(EE4BEG[10])
);

my_buf EE4BEG_outbuf_11 (
    .A(EE4BEG_i[11]),
    .X(EE4BEG[11])
);

assign E6BEG_i[11-2:0] = E6END_i[11:2];

my_buf E6END_inbuf_0 (
    .A(E6END[2]),
    .X(E6END_i[2])
);

my_buf E6END_inbuf_1 (
    .A(E6END[3]),
    .X(E6END_i[3])
);

my_buf E6END_inbuf_2 (
    .A(E6END[4]),
    .X(E6END_i[4])
);

my_buf E6END_inbuf_3 (
    .A(E6END[5]),
    .X(E6END_i[5])
);

my_buf E6END_inbuf_4 (
    .A(E6END[6]),
    .X(E6END_i[6])
);

my_buf E6END_inbuf_5 (
    .A(E6END[7]),
    .X(E6END_i[7])
);

my_buf E6END_inbuf_6 (
    .A(E6END[8]),
    .X(E6END_i[8])
);

my_buf E6END_inbuf_7 (
    .A(E6END[9]),
    .X(E6END_i[9])
);

my_buf E6END_inbuf_8 (
    .A(E6END[10]),
    .X(E6END_i[10])
);

my_buf E6END_inbuf_9 (
    .A(E6END[11]),
    .X(E6END_i[11])
);

my_buf E6BEG_outbuf_0 (
    .A(E6BEG_i[0]),
    .X(E6BEG[0])
);

my_buf E6BEG_outbuf_1 (
    .A(E6BEG_i[1]),
    .X(E6BEG[1])
);

my_buf E6BEG_outbuf_2 (
    .A(E6BEG_i[2]),
    .X(E6BEG[2])
);

my_buf E6BEG_outbuf_3 (
    .A(E6BEG_i[3]),
    .X(E6BEG[3])
);

my_buf E6BEG_outbuf_4 (
    .A(E6BEG_i[4]),
    .X(E6BEG[4])
);

my_buf E6BEG_outbuf_5 (
    .A(E6BEG_i[5]),
    .X(E6BEG[5])
);

my_buf E6BEG_outbuf_6 (
    .A(E6BEG_i[6]),
    .X(E6BEG[6])
);

my_buf E6BEG_outbuf_7 (
    .A(E6BEG_i[7]),
    .X(E6BEG[7])
);

my_buf E6BEG_outbuf_8 (
    .A(E6BEG_i[8]),
    .X(E6BEG[8])
);

my_buf E6BEG_outbuf_9 (
    .A(E6BEG_i[9]),
    .X(E6BEG[9])
);

assign S4BEG_i[15-4:0] = S4END_i[15:4];

my_buf S4END_inbuf_0 (
    .A(S4END[4]),
    .X(S4END_i[4])
);

my_buf S4END_inbuf_1 (
    .A(S4END[5]),
    .X(S4END_i[5])
);

my_buf S4END_inbuf_2 (
    .A(S4END[6]),
    .X(S4END_i[6])
);

my_buf S4END_inbuf_3 (
    .A(S4END[7]),
    .X(S4END_i[7])
);

my_buf S4END_inbuf_4 (
    .A(S4END[8]),
    .X(S4END_i[8])
);

my_buf S4END_inbuf_5 (
    .A(S4END[9]),
    .X(S4END_i[9])
);

my_buf S4END_inbuf_6 (
    .A(S4END[10]),
    .X(S4END_i[10])
);

my_buf S4END_inbuf_7 (
    .A(S4END[11]),
    .X(S4END_i[11])
);

my_buf S4END_inbuf_8 (
    .A(S4END[12]),
    .X(S4END_i[12])
);

my_buf S4END_inbuf_9 (
    .A(S4END[13]),
    .X(S4END_i[13])
);

my_buf S4END_inbuf_10 (
    .A(S4END[14]),
    .X(S4END_i[14])
);

my_buf S4END_inbuf_11 (
    .A(S4END[15]),
    .X(S4END_i[15])
);

my_buf S4BEG_outbuf_0 (
    .A(S4BEG_i[0]),
    .X(S4BEG[0])
);

my_buf S4BEG_outbuf_1 (
    .A(S4BEG_i[1]),
    .X(S4BEG[1])
);

my_buf S4BEG_outbuf_2 (
    .A(S4BEG_i[2]),
    .X(S4BEG[2])
);

my_buf S4BEG_outbuf_3 (
    .A(S4BEG_i[3]),
    .X(S4BEG[3])
);

my_buf S4BEG_outbuf_4 (
    .A(S4BEG_i[4]),
    .X(S4BEG[4])
);

my_buf S4BEG_outbuf_5 (
    .A(S4BEG_i[5]),
    .X(S4BEG[5])
);

my_buf S4BEG_outbuf_6 (
    .A(S4BEG_i[6]),
    .X(S4BEG[6])
);

my_buf S4BEG_outbuf_7 (
    .A(S4BEG_i[7]),
    .X(S4BEG[7])
);

my_buf S4BEG_outbuf_8 (
    .A(S4BEG_i[8]),
    .X(S4BEG[8])
);

my_buf S4BEG_outbuf_9 (
    .A(S4BEG_i[9]),
    .X(S4BEG[9])
);

my_buf S4BEG_outbuf_10 (
    .A(S4BEG_i[10]),
    .X(S4BEG[10])
);

my_buf S4BEG_outbuf_11 (
    .A(S4BEG_i[11]),
    .X(S4BEG[11])
);

assign SS4BEG_i[15-4:0] = SS4END_i[15:4];

my_buf SS4END_inbuf_0 (
    .A(SS4END[4]),
    .X(SS4END_i[4])
);

my_buf SS4END_inbuf_1 (
    .A(SS4END[5]),
    .X(SS4END_i[5])
);

my_buf SS4END_inbuf_2 (
    .A(SS4END[6]),
    .X(SS4END_i[6])
);

my_buf SS4END_inbuf_3 (
    .A(SS4END[7]),
    .X(SS4END_i[7])
);

my_buf SS4END_inbuf_4 (
    .A(SS4END[8]),
    .X(SS4END_i[8])
);

my_buf SS4END_inbuf_5 (
    .A(SS4END[9]),
    .X(SS4END_i[9])
);

my_buf SS4END_inbuf_6 (
    .A(SS4END[10]),
    .X(SS4END_i[10])
);

my_buf SS4END_inbuf_7 (
    .A(SS4END[11]),
    .X(SS4END_i[11])
);

my_buf SS4END_inbuf_8 (
    .A(SS4END[12]),
    .X(SS4END_i[12])
);

my_buf SS4END_inbuf_9 (
    .A(SS4END[13]),
    .X(SS4END_i[13])
);

my_buf SS4END_inbuf_10 (
    .A(SS4END[14]),
    .X(SS4END_i[14])
);

my_buf SS4END_inbuf_11 (
    .A(SS4END[15]),
    .X(SS4END_i[15])
);

my_buf SS4BEG_outbuf_0 (
    .A(SS4BEG_i[0]),
    .X(SS4BEG[0])
);

my_buf SS4BEG_outbuf_1 (
    .A(SS4BEG_i[1]),
    .X(SS4BEG[1])
);

my_buf SS4BEG_outbuf_2 (
    .A(SS4BEG_i[2]),
    .X(SS4BEG[2])
);

my_buf SS4BEG_outbuf_3 (
    .A(SS4BEG_i[3]),
    .X(SS4BEG[3])
);

my_buf SS4BEG_outbuf_4 (
    .A(SS4BEG_i[4]),
    .X(SS4BEG[4])
);

my_buf SS4BEG_outbuf_5 (
    .A(SS4BEG_i[5]),
    .X(SS4BEG[5])
);

my_buf SS4BEG_outbuf_6 (
    .A(SS4BEG_i[6]),
    .X(SS4BEG[6])
);

my_buf SS4BEG_outbuf_7 (
    .A(SS4BEG_i[7]),
    .X(SS4BEG[7])
);

my_buf SS4BEG_outbuf_8 (
    .A(SS4BEG_i[8]),
    .X(SS4BEG[8])
);

my_buf SS4BEG_outbuf_9 (
    .A(SS4BEG_i[9]),
    .X(SS4BEG[9])
);

my_buf SS4BEG_outbuf_10 (
    .A(SS4BEG_i[10]),
    .X(SS4BEG[10])
);

my_buf SS4BEG_outbuf_11 (
    .A(SS4BEG_i[11]),
    .X(SS4BEG[11])
);

assign WW4BEG_i[15-4:0] = WW4END_i[15:4];

my_buf WW4END_inbuf_0 (
    .A(WW4END[4]),
    .X(WW4END_i[4])
);

my_buf WW4END_inbuf_1 (
    .A(WW4END[5]),
    .X(WW4END_i[5])
);

my_buf WW4END_inbuf_2 (
    .A(WW4END[6]),
    .X(WW4END_i[6])
);

my_buf WW4END_inbuf_3 (
    .A(WW4END[7]),
    .X(WW4END_i[7])
);

my_buf WW4END_inbuf_4 (
    .A(WW4END[8]),
    .X(WW4END_i[8])
);

my_buf WW4END_inbuf_5 (
    .A(WW4END[9]),
    .X(WW4END_i[9])
);

my_buf WW4END_inbuf_6 (
    .A(WW4END[10]),
    .X(WW4END_i[10])
);

my_buf WW4END_inbuf_7 (
    .A(WW4END[11]),
    .X(WW4END_i[11])
);

my_buf WW4END_inbuf_8 (
    .A(WW4END[12]),
    .X(WW4END_i[12])
);

my_buf WW4END_inbuf_9 (
    .A(WW4END[13]),
    .X(WW4END_i[13])
);

my_buf WW4END_inbuf_10 (
    .A(WW4END[14]),
    .X(WW4END_i[14])
);

my_buf WW4END_inbuf_11 (
    .A(WW4END[15]),
    .X(WW4END_i[15])
);

my_buf WW4BEG_outbuf_0 (
    .A(WW4BEG_i[0]),
    .X(WW4BEG[0])
);

my_buf WW4BEG_outbuf_1 (
    .A(WW4BEG_i[1]),
    .X(WW4BEG[1])
);

my_buf WW4BEG_outbuf_2 (
    .A(WW4BEG_i[2]),
    .X(WW4BEG[2])
);

my_buf WW4BEG_outbuf_3 (
    .A(WW4BEG_i[3]),
    .X(WW4BEG[3])
);

my_buf WW4BEG_outbuf_4 (
    .A(WW4BEG_i[4]),
    .X(WW4BEG[4])
);

my_buf WW4BEG_outbuf_5 (
    .A(WW4BEG_i[5]),
    .X(WW4BEG[5])
);

my_buf WW4BEG_outbuf_6 (
    .A(WW4BEG_i[6]),
    .X(WW4BEG[6])
);

my_buf WW4BEG_outbuf_7 (
    .A(WW4BEG_i[7]),
    .X(WW4BEG[7])
);

my_buf WW4BEG_outbuf_8 (
    .A(WW4BEG_i[8]),
    .X(WW4BEG[8])
);

my_buf WW4BEG_outbuf_9 (
    .A(WW4BEG_i[9]),
    .X(WW4BEG[9])
);

my_buf WW4BEG_outbuf_10 (
    .A(WW4BEG_i[10]),
    .X(WW4BEG[10])
);

my_buf WW4BEG_outbuf_11 (
    .A(WW4BEG_i[11]),
    .X(WW4BEG[11])
);

assign W6BEG_i[11-2:0] = W6END_i[11:2];

my_buf W6END_inbuf_0 (
    .A(W6END[2]),
    .X(W6END_i[2])
);

my_buf W6END_inbuf_1 (
    .A(W6END[3]),
    .X(W6END_i[3])
);

my_buf W6END_inbuf_2 (
    .A(W6END[4]),
    .X(W6END_i[4])
);

my_buf W6END_inbuf_3 (
    .A(W6END[5]),
    .X(W6END_i[5])
);

my_buf W6END_inbuf_4 (
    .A(W6END[6]),
    .X(W6END_i[6])
);

my_buf W6END_inbuf_5 (
    .A(W6END[7]),
    .X(W6END_i[7])
);

my_buf W6END_inbuf_6 (
    .A(W6END[8]),
    .X(W6END_i[8])
);

my_buf W6END_inbuf_7 (
    .A(W6END[9]),
    .X(W6END_i[9])
);

my_buf W6END_inbuf_8 (
    .A(W6END[10]),
    .X(W6END_i[10])
);

my_buf W6END_inbuf_9 (
    .A(W6END[11]),
    .X(W6END_i[11])
);

my_buf W6BEG_outbuf_0 (
    .A(W6BEG_i[0]),
    .X(W6BEG[0])
);

my_buf W6BEG_outbuf_1 (
    .A(W6BEG_i[1]),
    .X(W6BEG[1])
);

my_buf W6BEG_outbuf_2 (
    .A(W6BEG_i[2]),
    .X(W6BEG[2])
);

my_buf W6BEG_outbuf_3 (
    .A(W6BEG_i[3]),
    .X(W6BEG[3])
);

my_buf W6BEG_outbuf_4 (
    .A(W6BEG_i[4]),
    .X(W6BEG[4])
);

my_buf W6BEG_outbuf_5 (
    .A(W6BEG_i[5]),
    .X(W6BEG[5])
);

my_buf W6BEG_outbuf_6 (
    .A(W6BEG_i[6]),
    .X(W6BEG[6])
);

my_buf W6BEG_outbuf_7 (
    .A(W6BEG_i[7]),
    .X(W6BEG[7])
);

my_buf W6BEG_outbuf_8 (
    .A(W6BEG_i[8]),
    .X(W6BEG[8])
);

my_buf W6BEG_outbuf_9 (
    .A(W6BEG_i[9]),
    .X(W6BEG[9])
);

clk_buf inst_clk_buf (
    .A(UserCLK),
    .X(UserCLKo)
);


 //configuration storage latches
SCC6_ConfigMem
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Emulate_Bitstream)
    )
`endif
    Inst_SCC6_ConfigMem
    (
    .FrameData(FrameData),
    .FrameStrobe(FrameStrobe),
    .ConfigBits(ConfigBits),
    .ConfigBits_N(ConfigBits_N)
);

 //BEL component instantiations
mux4_cxu Inst_mux4_cxu (
    .clk(clk),
    .clk_en(clk_en),
    .req_cxu0(req_cxu0),
    .req_cxu1(req_cxu1),
    .req_data00(req_data00),
    .req_data01(req_data01),
    .req_data02(req_data02),
    .req_data03(req_data03),
    .req_data04(req_data04),
    .req_data05(req_data05),
    .req_data06(req_data06),
    .req_data07(req_data07),
    .req_data08(req_data08),
    .req_data09(req_data09),
    .req_data010(req_data010),
    .req_data011(req_data011),
    .req_data012(req_data012),
    .req_data013(req_data013),
    .req_data014(req_data014),
    .req_data015(req_data015),
    .req_data016(req_data016),
    .req_data017(req_data017),
    .req_data018(req_data018),
    .req_data019(req_data019),
    .req_data020(req_data020),
    .req_data021(req_data021),
    .req_data022(req_data022),
    .req_data023(req_data023),
    .req_data024(req_data024),
    .req_data025(req_data025),
    .req_data026(req_data026),
    .req_data027(req_data027),
    .req_data028(req_data028),
    .req_data029(req_data029),
    .req_data030(req_data030),
    .req_data031(req_data031),
    .req_data10(req_data10),
    .req_data11(req_data11),
    .req_data12(req_data12),
    .req_data13(req_data13),
    .req_data14(req_data14),
    .req_data15(req_data15),
    .req_data16(req_data16),
    .req_data17(req_data17),
    .req_data18(req_data18),
    .req_data19(req_data19),
    .req_data110(req_data110),
    .req_data111(req_data111),
    .req_data112(req_data112),
    .req_data113(req_data113),
    .req_data114(req_data114),
    .req_data115(req_data115),
    .req_data116(req_data116),
    .req_data117(req_data117),
    .req_data118(req_data118),
    .req_data119(req_data119),
    .req_data120(req_data120),
    .req_data121(req_data121),
    .req_data122(req_data122),
    .req_data123(req_data123),
    .req_data124(req_data124),
    .req_data125(req_data125),
    .req_data126(req_data126),
    .req_data127(req_data127),
    .req_data128(req_data128),
    .req_data129(req_data129),
    .req_data130(req_data130),
    .req_data131(req_data131),
    .req_func0(req_func0),
    .req_func1(req_func1),
    .req_func2(req_func2),
    .req_insn(req_insn),
    .req_state(req_state),
    .req_valid(req_valid),
    .resp_ready(resp_ready),
    .rst(rst),
    .t_req_ready(t_req_ready),
    .t_resp_data0(t_resp_data0),
    .t_resp_data1(t_resp_data1),
    .t_resp_data2(t_resp_data2),
    .t_resp_data3(t_resp_data3),
    .t_resp_data4(t_resp_data4),
    .t_resp_data5(t_resp_data5),
    .t_resp_data6(t_resp_data6),
    .t_resp_data7(t_resp_data7),
    .t_resp_data8(t_resp_data8),
    .t_resp_data9(t_resp_data9),
    .t_resp_data10(t_resp_data10),
    .t_resp_data11(t_resp_data11),
    .t_resp_data12(t_resp_data12),
    .t_resp_data13(t_resp_data13),
    .t_resp_data14(t_resp_data14),
    .t_resp_data15(t_resp_data15),
    .t_resp_data16(t_resp_data16),
    .t_resp_data17(t_resp_data17),
    .t_resp_data18(t_resp_data18),
    .t_resp_data19(t_resp_data19),
    .t_resp_data20(t_resp_data20),
    .t_resp_data21(t_resp_data21),
    .t_resp_data22(t_resp_data22),
    .t_resp_data23(t_resp_data23),
    .t_resp_data24(t_resp_data24),
    .t_resp_data25(t_resp_data25),
    .t_resp_data26(t_resp_data26),
    .t_resp_data27(t_resp_data27),
    .t_resp_data28(t_resp_data28),
    .t_resp_data29(t_resp_data29),
    .t_resp_data30(t_resp_data30),
    .t_resp_data31(t_resp_data31),
    .t_resp_status0(t_resp_status0),
    .t_resp_status1(t_resp_status1),
    .t_resp_status2(t_resp_status2),
    .t_resp_valid(t_resp_valid),
    .req_ready(req_ready),
    .resp_data0(resp_data0),
    .resp_data1(resp_data1),
    .resp_data2(resp_data2),
    .resp_data3(resp_data3),
    .resp_data4(resp_data4),
    .resp_data5(resp_data5),
    .resp_data6(resp_data6),
    .resp_data7(resp_data7),
    .resp_data8(resp_data8),
    .resp_data9(resp_data9),
    .resp_data10(resp_data10),
    .resp_data11(resp_data11),
    .resp_data12(resp_data12),
    .resp_data13(resp_data13),
    .resp_data14(resp_data14),
    .resp_data15(resp_data15),
    .resp_data16(resp_data16),
    .resp_data17(resp_data17),
    .resp_data18(resp_data18),
    .resp_data19(resp_data19),
    .resp_data20(resp_data20),
    .resp_data21(resp_data21),
    .resp_data22(resp_data22),
    .resp_data23(resp_data23),
    .resp_data24(resp_data24),
    .resp_data25(resp_data25),
    .resp_data26(resp_data26),
    .resp_data27(resp_data27),
    .resp_data28(resp_data28),
    .resp_data29(resp_data29),
    .resp_data30(resp_data30),
    .resp_data31(resp_data31),
    .resp_status0(resp_status0),
    .resp_status1(resp_status1),
    .resp_status2(resp_status2),
    .resp_valid(resp_valid),
    .t_req_cxu0(t_req_cxu0),
    .t_req_cxu1(t_req_cxu1),
    .t_req_data00(t_req_data00),
    .t_req_data01(t_req_data01),
    .t_req_data02(t_req_data02),
    .t_req_data03(t_req_data03),
    .t_req_data04(t_req_data04),
    .t_req_data05(t_req_data05),
    .t_req_data06(t_req_data06),
    .t_req_data07(t_req_data07),
    .t_req_data08(t_req_data08),
    .t_req_data09(t_req_data09),
    .t_req_data010(t_req_data010),
    .t_req_data011(t_req_data011),
    .t_req_data012(t_req_data012),
    .t_req_data013(t_req_data013),
    .t_req_data014(t_req_data014),
    .t_req_data015(t_req_data015),
    .t_req_data016(t_req_data016),
    .t_req_data017(t_req_data017),
    .t_req_data018(t_req_data018),
    .t_req_data019(t_req_data019),
    .t_req_data020(t_req_data020),
    .t_req_data021(t_req_data021),
    .t_req_data022(t_req_data022),
    .t_req_data023(t_req_data023),
    .t_req_data024(t_req_data024),
    .t_req_data025(t_req_data025),
    .t_req_data026(t_req_data026),
    .t_req_data027(t_req_data027),
    .t_req_data028(t_req_data028),
    .t_req_data029(t_req_data029),
    .t_req_data030(t_req_data030),
    .t_req_data031(t_req_data031),
    .t_req_data10(t_req_data10),
    .t_req_data11(t_req_data11),
    .t_req_data12(t_req_data12),
    .t_req_data13(t_req_data13),
    .t_req_data14(t_req_data14),
    .t_req_data15(t_req_data15),
    .t_req_data16(t_req_data16),
    .t_req_data17(t_req_data17),
    .t_req_data18(t_req_data18),
    .t_req_data19(t_req_data19),
    .t_req_data110(t_req_data110),
    .t_req_data111(t_req_data111),
    .t_req_data112(t_req_data112),
    .t_req_data113(t_req_data113),
    .t_req_data114(t_req_data114),
    .t_req_data115(t_req_data115),
    .t_req_data116(t_req_data116),
    .t_req_data117(t_req_data117),
    .t_req_data118(t_req_data118),
    .t_req_data119(t_req_data119),
    .t_req_data120(t_req_data120),
    .t_req_data121(t_req_data121),
    .t_req_data122(t_req_data122),
    .t_req_data123(t_req_data123),
    .t_req_data124(t_req_data124),
    .t_req_data125(t_req_data125),
    .t_req_data126(t_req_data126),
    .t_req_data127(t_req_data127),
    .t_req_data128(t_req_data128),
    .t_req_data129(t_req_data129),
    .t_req_data130(t_req_data130),
    .t_req_data131(t_req_data131),
    .t_req_func0(t_req_func0),
    .t_req_func1(t_req_func1),
    .t_req_func2(t_req_func2),
    .t_req_insn(t_req_insn),
    .t_req_state(t_req_state),
    .t_req_valid(t_req_valid),
    .t_resp_ready(t_resp_ready)
);

SCC6_switch_matrix Inst_SCC6_switch_matrix (
    .i_0to60(i_0to6[0]),
    .i_0to61(i_0to6[1]),
    .i_0to62(i_0to6[2]),
    .i_0to63(i_0to6[3]),
    .i_0to64(i_0to6[4]),
    .i_0to65(i_0to6[5]),
    .i_0to66(i_0to6[6]),
    .i_0to67(i_0to6[7]),
    .i_0to68(i_0to6[8]),
    .i_0to69(i_0to6[9]),
    .i_0to610(i_0to6[10]),
    .i_0to611(i_0to6[11]),
    .i_0to612(i_0to6[12]),
    .i_0to613(i_0to6[13]),
    .i_0to614(i_0to6[14]),
    .i_0to615(i_0to6[15]),
    .i_0to616(i_0to6[16]),
    .i_0to617(i_0to6[17]),
    .i_0to618(i_0to6[18]),
    .i_0to619(i_0to6[19]),
    .i_0to620(i_0to6[20]),
    .i_0to621(i_0to6[21]),
    .i_0to622(i_0to6[22]),
    .i_0to623(i_0to6[23]),
    .i_0to624(i_0to6[24]),
    .i_0to625(i_0to6[25]),
    .i_0to626(i_0to6[26]),
    .i_0to627(i_0to6[27]),
    .i_0to628(i_0to6[28]),
    .i_0to629(i_0to6[29]),
    .i_0to630(i_0to6[30]),
    .i_0to631(i_0to6[31]),
    .i_0to632(i_0to6[32]),
    .i_0to633(i_0to6[33]),
    .i_0to634(i_0to6[34]),
    .i_0to635(i_0to6[35]),
    .i_0to636(i_0to6[36]),
    .i_0to637(i_0to6[37]),
    .i_0to638(i_0to6[38]),
    .i_0to639(i_0to6[39]),
    .i_0to640(i_0to6[40]),
    .i_0to641(i_0to6[41]),
    .i_0to642(i_0to6[42]),
    .i_0to643(i_0to6[43]),
    .i_0to644(i_0to6[44]),
    .i_0to645(i_0to6[45]),
    .i_0to646(i_0to6[46]),
    .i_0to647(i_0to6[47]),
    .i_1to60(i_1to6[0]),
    .i_1to61(i_1to6[1]),
    .i_1to62(i_1to6[2]),
    .i_1to63(i_1to6[3]),
    .i_1to64(i_1to6[4]),
    .i_1to65(i_1to6[5]),
    .i_1to66(i_1to6[6]),
    .i_1to67(i_1to6[7]),
    .i_1to68(i_1to6[8]),
    .i_1to69(i_1to6[9]),
    .i_1to610(i_1to6[10]),
    .i_1to611(i_1to6[11]),
    .i_1to612(i_1to6[12]),
    .i_1to613(i_1to6[13]),
    .i_1to614(i_1to6[14]),
    .i_1to615(i_1to6[15]),
    .i_1to616(i_1to6[16]),
    .i_1to617(i_1to6[17]),
    .i_1to618(i_1to6[18]),
    .i_1to619(i_1to6[19]),
    .i_1to620(i_1to6[20]),
    .i_1to621(i_1to6[21]),
    .i_1to622(i_1to6[22]),
    .i_1to623(i_1to6[23]),
    .i_1to624(i_1to6[24]),
    .i_1to625(i_1to6[25]),
    .i_1to626(i_1to6[26]),
    .i_1to627(i_1to6[27]),
    .i_1to628(i_1to6[28]),
    .i_1to629(i_1to6[29]),
    .i_1to630(i_1to6[30]),
    .i_1to631(i_1to6[31]),
    .i_1to632(i_1to6[32]),
    .i_1to633(i_1to6[33]),
    .i_1to634(i_1to6[34]),
    .i_1to635(i_1to6[35]),
    .i_1to636(i_1to6[36]),
    .i_1to637(i_1to6[37]),
    .i_1to638(i_1to6[38]),
    .i_1to639(i_1to6[39]),
    .i_2to60(i_2to6[0]),
    .i_2to61(i_2to6[1]),
    .i_2to62(i_2to6[2]),
    .i_2to63(i_2to6[3]),
    .i_2to64(i_2to6[4]),
    .i_2to65(i_2to6[5]),
    .i_2to66(i_2to6[6]),
    .i_2to67(i_2to6[7]),
    .i_2to68(i_2to6[8]),
    .i_2to69(i_2to6[9]),
    .i_2to610(i_2to6[10]),
    .i_2to611(i_2to6[11]),
    .i_2to612(i_2to6[12]),
    .i_2to613(i_2to6[13]),
    .i_2to614(i_2to6[14]),
    .i_2to615(i_2to6[15]),
    .i_2to616(i_2to6[16]),
    .i_2to617(i_2to6[17]),
    .i_2to618(i_2to6[18]),
    .i_2to619(i_2to6[19]),
    .i_2to620(i_2to6[20]),
    .i_2to621(i_2to6[21]),
    .i_2to622(i_2to6[22]),
    .i_2to623(i_2to6[23]),
    .i_2to624(i_2to6[24]),
    .i_2to625(i_2to6[25]),
    .i_2to626(i_2to6[26]),
    .i_2to627(i_2to6[27]),
    .i_2to628(i_2to6[28]),
    .i_2to629(i_2to6[29]),
    .i_2to630(i_2to6[30]),
    .i_2to631(i_2to6[31]),
    .i_3to60(i_3to6[0]),
    .i_3to61(i_3to6[1]),
    .i_3to62(i_3to6[2]),
    .i_3to63(i_3to6[3]),
    .i_3to64(i_3to6[4]),
    .i_3to65(i_3to6[5]),
    .i_3to66(i_3to6[6]),
    .i_3to67(i_3to6[7]),
    .i_3to68(i_3to6[8]),
    .i_3to69(i_3to6[9]),
    .i_3to610(i_3to6[10]),
    .i_3to611(i_3to6[11]),
    .i_3to612(i_3to6[12]),
    .i_3to613(i_3to6[13]),
    .i_3to614(i_3to6[14]),
    .i_3to615(i_3to6[15]),
    .i_3to616(i_3to6[16]),
    .i_3to617(i_3to6[17]),
    .i_3to618(i_3to6[18]),
    .i_3to619(i_3to6[19]),
    .i_3to620(i_3to6[20]),
    .i_3to621(i_3to6[21]),
    .i_3to622(i_3to6[22]),
    .i_3to623(i_3to6[23]),
    .i_4to60(i_4to6[0]),
    .i_4to61(i_4to6[1]),
    .i_4to62(i_4to6[2]),
    .i_4to63(i_4to6[3]),
    .i_4to64(i_4to6[4]),
    .i_4to65(i_4to6[5]),
    .i_4to66(i_4to6[6]),
    .i_4to67(i_4to6[7]),
    .i_4to68(i_4to6[8]),
    .i_4to69(i_4to6[9]),
    .i_4to610(i_4to6[10]),
    .i_4to611(i_4to6[11]),
    .i_4to612(i_4to6[12]),
    .i_4to613(i_4to6[13]),
    .i_4to614(i_4to6[14]),
    .i_4to615(i_4to6[15]),
    .i_5to60(i_5to6[0]),
    .i_5to61(i_5to6[1]),
    .i_5to62(i_5to6[2]),
    .i_5to63(i_5to6[3]),
    .i_5to64(i_5to6[4]),
    .i_5to65(i_5to6[5]),
    .i_5to66(i_5to6[6]),
    .i_5to67(i_5to6[7]),
    .i_w2e0(i_w2e[0]),
    .i_w2e1(i_w2e[1]),
    .i_w2e2(i_w2e[2]),
    .i_w2e3(i_w2e[3]),
    .i_w2e4(i_w2e[4]),
    .i_w2e5(i_w2e[5]),
    .i_w2e6(i_w2e[6]),
    .i_w2e7(i_w2e[7]),
    .i_w2e8(i_w2e[8]),
    .i_w2e9(i_w2e[9]),
    .i_w2e10(i_w2e[10]),
    .i_w2e11(i_w2e[11]),
    .i_w2e12(i_w2e[12]),
    .i_w2e13(i_w2e[13]),
    .i_w2e14(i_w2e[14]),
    .i_w2e15(i_w2e[15]),
    .i_w2e16(i_w2e[16]),
    .i_w2e17(i_w2e[17]),
    .i_w2e18(i_w2e[18]),
    .i_w2e19(i_w2e[19]),
    .i_w2e20(i_w2e[20]),
    .i_w2e21(i_w2e[21]),
    .i_w2e22(i_w2e[22]),
    .i_w2e23(i_w2e[23]),
    .i_w2e24(i_w2e[24]),
    .i_w2e25(i_w2e[25]),
    .i_w2e26(i_w2e[26]),
    .i_w2e27(i_w2e[27]),
    .i_w2e28(i_w2e[28]),
    .i_w2e29(i_w2e[29]),
    .i_w2e30(i_w2e[30]),
    .i_w2e31(i_w2e[31]),
    .i_w2e32(i_w2e[32]),
    .i_w2e33(i_w2e[33]),
    .i_w2e34(i_w2e[34]),
    .i_w2e35(i_w2e[35]),
    .i_w2e36(i_w2e[36]),
    .i_w2e37(i_w2e[37]),
    .i_w2e38(i_w2e[38]),
    .i_w2e39(i_w2e[39]),
    .i_w2e40(i_w2e[40]),
    .i_w2e41(i_w2e[41]),
    .i_w2e42(i_w2e[42]),
    .i_w2e43(i_w2e[43]),
    .i_w2e44(i_w2e[44]),
    .i_w2e45(i_w2e[45]),
    .i_w2e46(i_w2e[46]),
    .i_w2e47(i_w2e[47]),
    .i_w2e48(i_w2e[48]),
    .i_w2e49(i_w2e[49]),
    .i_w2e50(i_w2e[50]),
    .i_w2e51(i_w2e[51]),
    .i_w2e52(i_w2e[52]),
    .i_w2e53(i_w2e[53]),
    .i_w2e54(i_w2e[54]),
    .i_w2e55(i_w2e[55]),
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
    .NN4END0(NN4END[0]),
    .NN4END1(NN4END[1]),
    .NN4END2(NN4END[2]),
    .NN4END3(NN4END[3]),
    .E1END0(E1END[0]),
    .E1END1(E1END[1]),
    .E1END2(E1END[2]),
    .E1END3(E1END[3]),
    .E2MID0(E2MID[0]),
    .E2MID1(E2MID[1]),
    .E2MID2(E2MID[2]),
    .E2MID3(E2MID[3]),
    .E2MID4(E2MID[4]),
    .E2MID5(E2MID[5]),
    .E2MID6(E2MID[6]),
    .E2MID7(E2MID[7]),
    .E2END0(E2END[0]),
    .E2END1(E2END[1]),
    .E2END2(E2END[2]),
    .E2END3(E2END[3]),
    .E2END4(E2END[4]),
    .E2END5(E2END[5]),
    .E2END6(E2END[6]),
    .E2END7(E2END[7]),
    .EE4END0(EE4END[0]),
    .EE4END1(EE4END[1]),
    .EE4END2(EE4END[2]),
    .EE4END3(EE4END[3]),
    .E6END0(E6END[0]),
    .E6END1(E6END[1]),
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
    .SS4END0(SS4END[0]),
    .SS4END1(SS4END[1]),
    .SS4END2(SS4END[2]),
    .SS4END3(SS4END[3]),
    .W1END0(W1END[0]),
    .W1END1(W1END[1]),
    .W1END2(W1END[2]),
    .W1END3(W1END[3]),
    .W2MID0(W2MID[0]),
    .W2MID1(W2MID[1]),
    .W2MID2(W2MID[2]),
    .W2MID3(W2MID[3]),
    .W2MID4(W2MID[4]),
    .W2MID5(W2MID[5]),
    .W2MID6(W2MID[6]),
    .W2MID7(W2MID[7]),
    .W2END0(W2END[0]),
    .W2END1(W2END[1]),
    .W2END2(W2END[2]),
    .W2END3(W2END[3]),
    .W2END4(W2END[4]),
    .W2END5(W2END[5]),
    .W2END6(W2END[6]),
    .W2END7(W2END[7]),
    .WW4END0(WW4END[0]),
    .WW4END1(WW4END[1]),
    .WW4END2(WW4END[2]),
    .WW4END3(WW4END[3]),
    .W6END0(W6END[0]),
    .W6END1(W6END[1]),
    .req_ready(req_ready),
    .resp_data0(resp_data0),
    .resp_data1(resp_data1),
    .resp_data2(resp_data2),
    .resp_data3(resp_data3),
    .resp_data4(resp_data4),
    .resp_data5(resp_data5),
    .resp_data6(resp_data6),
    .resp_data7(resp_data7),
    .resp_data8(resp_data8),
    .resp_data9(resp_data9),
    .resp_data10(resp_data10),
    .resp_data11(resp_data11),
    .resp_data12(resp_data12),
    .resp_data13(resp_data13),
    .resp_data14(resp_data14),
    .resp_data15(resp_data15),
    .resp_data16(resp_data16),
    .resp_data17(resp_data17),
    .resp_data18(resp_data18),
    .resp_data19(resp_data19),
    .resp_data20(resp_data20),
    .resp_data21(resp_data21),
    .resp_data22(resp_data22),
    .resp_data23(resp_data23),
    .resp_data24(resp_data24),
    .resp_data25(resp_data25),
    .resp_data26(resp_data26),
    .resp_data27(resp_data27),
    .resp_data28(resp_data28),
    .resp_data29(resp_data29),
    .resp_data30(resp_data30),
    .resp_data31(resp_data31),
    .resp_status0(resp_status0),
    .resp_status1(resp_status1),
    .resp_status2(resp_status2),
    .resp_valid(resp_valid),
    .t_req_cxu0(t_req_cxu0),
    .t_req_cxu1(t_req_cxu1),
    .t_req_data00(t_req_data00),
    .t_req_data01(t_req_data01),
    .t_req_data02(t_req_data02),
    .t_req_data03(t_req_data03),
    .t_req_data04(t_req_data04),
    .t_req_data05(t_req_data05),
    .t_req_data06(t_req_data06),
    .t_req_data07(t_req_data07),
    .t_req_data08(t_req_data08),
    .t_req_data09(t_req_data09),
    .t_req_data010(t_req_data010),
    .t_req_data011(t_req_data011),
    .t_req_data012(t_req_data012),
    .t_req_data013(t_req_data013),
    .t_req_data014(t_req_data014),
    .t_req_data015(t_req_data015),
    .t_req_data016(t_req_data016),
    .t_req_data017(t_req_data017),
    .t_req_data018(t_req_data018),
    .t_req_data019(t_req_data019),
    .t_req_data020(t_req_data020),
    .t_req_data021(t_req_data021),
    .t_req_data022(t_req_data022),
    .t_req_data023(t_req_data023),
    .t_req_data024(t_req_data024),
    .t_req_data025(t_req_data025),
    .t_req_data026(t_req_data026),
    .t_req_data027(t_req_data027),
    .t_req_data028(t_req_data028),
    .t_req_data029(t_req_data029),
    .t_req_data030(t_req_data030),
    .t_req_data031(t_req_data031),
    .t_req_data10(t_req_data10),
    .t_req_data11(t_req_data11),
    .t_req_data12(t_req_data12),
    .t_req_data13(t_req_data13),
    .t_req_data14(t_req_data14),
    .t_req_data15(t_req_data15),
    .t_req_data16(t_req_data16),
    .t_req_data17(t_req_data17),
    .t_req_data18(t_req_data18),
    .t_req_data19(t_req_data19),
    .t_req_data110(t_req_data110),
    .t_req_data111(t_req_data111),
    .t_req_data112(t_req_data112),
    .t_req_data113(t_req_data113),
    .t_req_data114(t_req_data114),
    .t_req_data115(t_req_data115),
    .t_req_data116(t_req_data116),
    .t_req_data117(t_req_data117),
    .t_req_data118(t_req_data118),
    .t_req_data119(t_req_data119),
    .t_req_data120(t_req_data120),
    .t_req_data121(t_req_data121),
    .t_req_data122(t_req_data122),
    .t_req_data123(t_req_data123),
    .t_req_data124(t_req_data124),
    .t_req_data125(t_req_data125),
    .t_req_data126(t_req_data126),
    .t_req_data127(t_req_data127),
    .t_req_data128(t_req_data128),
    .t_req_data129(t_req_data129),
    .t_req_data130(t_req_data130),
    .t_req_data131(t_req_data131),
    .t_req_func0(t_req_func0),
    .t_req_func1(t_req_func1),
    .t_req_func2(t_req_func2),
    .t_req_insn(t_req_insn),
    .t_req_state(t_req_state),
    .t_req_valid(t_req_valid),
    .t_resp_ready(t_resp_ready),
    .J2MID_ABa_END0(J2MID_ABa_BEG[0]),
    .J2MID_ABa_END1(J2MID_ABa_BEG[1]),
    .J2MID_ABa_END2(J2MID_ABa_BEG[2]),
    .J2MID_ABa_END3(J2MID_ABa_BEG[3]),
    .J2MID_CDa_END0(J2MID_CDa_BEG[0]),
    .J2MID_CDa_END1(J2MID_CDa_BEG[1]),
    .J2MID_CDa_END2(J2MID_CDa_BEG[2]),
    .J2MID_CDa_END3(J2MID_CDa_BEG[3]),
    .J2MID_EFa_END0(J2MID_EFa_BEG[0]),
    .J2MID_EFa_END1(J2MID_EFa_BEG[1]),
    .J2MID_EFa_END2(J2MID_EFa_BEG[2]),
    .J2MID_EFa_END3(J2MID_EFa_BEG[3]),
    .J2MID_GHa_END0(J2MID_GHa_BEG[0]),
    .J2MID_GHa_END1(J2MID_GHa_BEG[1]),
    .J2MID_GHa_END2(J2MID_GHa_BEG[2]),
    .J2MID_GHa_END3(J2MID_GHa_BEG[3]),
    .J2MID_ABb_END0(J2MID_ABb_BEG[0]),
    .J2MID_ABb_END1(J2MID_ABb_BEG[1]),
    .J2MID_ABb_END2(J2MID_ABb_BEG[2]),
    .J2MID_ABb_END3(J2MID_ABb_BEG[3]),
    .J2MID_CDb_END0(J2MID_CDb_BEG[0]),
    .J2MID_CDb_END1(J2MID_CDb_BEG[1]),
    .J2MID_CDb_END2(J2MID_CDb_BEG[2]),
    .J2MID_CDb_END3(J2MID_CDb_BEG[3]),
    .J2MID_EFb_END0(J2MID_EFb_BEG[0]),
    .J2MID_EFb_END1(J2MID_EFb_BEG[1]),
    .J2MID_EFb_END2(J2MID_EFb_BEG[2]),
    .J2MID_EFb_END3(J2MID_EFb_BEG[3]),
    .J2MID_GHb_END0(J2MID_GHb_BEG[0]),
    .J2MID_GHb_END1(J2MID_GHb_BEG[1]),
    .J2MID_GHb_END2(J2MID_GHb_BEG[2]),
    .J2MID_GHb_END3(J2MID_GHb_BEG[3]),
    .J2END_AB_END0(J2END_AB_BEG[0]),
    .J2END_AB_END1(J2END_AB_BEG[1]),
    .J2END_AB_END2(J2END_AB_BEG[2]),
    .J2END_AB_END3(J2END_AB_BEG[3]),
    .J2END_CD_END0(J2END_CD_BEG[0]),
    .J2END_CD_END1(J2END_CD_BEG[1]),
    .J2END_CD_END2(J2END_CD_BEG[2]),
    .J2END_CD_END3(J2END_CD_BEG[3]),
    .J2END_EF_END0(J2END_EF_BEG[0]),
    .J2END_EF_END1(J2END_EF_BEG[1]),
    .J2END_EF_END2(J2END_EF_BEG[2]),
    .J2END_EF_END3(J2END_EF_BEG[3]),
    .J2END_GH_END0(J2END_GH_BEG[0]),
    .J2END_GH_END1(J2END_GH_BEG[1]),
    .J2END_GH_END2(J2END_GH_BEG[2]),
    .J2END_GH_END3(J2END_GH_BEG[3]),
    .JN2END0(JN2BEG[0]),
    .JN2END1(JN2BEG[1]),
    .JN2END2(JN2BEG[2]),
    .JN2END3(JN2BEG[3]),
    .JN2END4(JN2BEG[4]),
    .JN2END5(JN2BEG[5]),
    .JN2END6(JN2BEG[6]),
    .JN2END7(JN2BEG[7]),
    .JE2END0(JE2BEG[0]),
    .JE2END1(JE2BEG[1]),
    .JE2END2(JE2BEG[2]),
    .JE2END3(JE2BEG[3]),
    .JE2END4(JE2BEG[4]),
    .JE2END5(JE2BEG[5]),
    .JE2END6(JE2BEG[6]),
    .JE2END7(JE2BEG[7]),
    .JS2END0(JS2BEG[0]),
    .JS2END1(JS2BEG[1]),
    .JS2END2(JS2BEG[2]),
    .JS2END3(JS2BEG[3]),
    .JS2END4(JS2BEG[4]),
    .JS2END5(JS2BEG[5]),
    .JS2END6(JS2BEG[6]),
    .JS2END7(JS2BEG[7]),
    .JW2END0(JW2BEG[0]),
    .JW2END1(JW2BEG[1]),
    .JW2END2(JW2BEG[2]),
    .JW2END3(JW2BEG[3]),
    .JW2END4(JW2BEG[4]),
    .JW2END5(JW2BEG[5]),
    .JW2END6(JW2BEG[6]),
    .JW2END7(JW2BEG[7]),
    .J_l_AB_END0(J_l_AB_BEG[0]),
    .J_l_AB_END1(J_l_AB_BEG[1]),
    .J_l_AB_END2(J_l_AB_BEG[2]),
    .J_l_AB_END3(J_l_AB_BEG[3]),
    .J_l_CD_END0(J_l_CD_BEG[0]),
    .J_l_CD_END1(J_l_CD_BEG[1]),
    .J_l_CD_END2(J_l_CD_BEG[2]),
    .J_l_CD_END3(J_l_CD_BEG[3]),
    .J_l_EF_END0(J_l_EF_BEG[0]),
    .J_l_EF_END1(J_l_EF_BEG[1]),
    .J_l_EF_END2(J_l_EF_BEG[2]),
    .J_l_EF_END3(J_l_EF_BEG[3]),
    .J_l_GH_END0(J_l_GH_BEG[0]),
    .J_l_GH_END1(J_l_GH_BEG[1]),
    .J_l_GH_END2(J_l_GH_BEG[2]),
    .J_l_GH_END3(J_l_GH_BEG[3]),
    .o_6to00(o_6to0[0]),
    .o_6to01(o_6to0[1]),
    .o_6to02(o_6to0[2]),
    .o_6to03(o_6to0[3]),
    .o_6to04(o_6to0[4]),
    .o_6to05(o_6to0[5]),
    .o_6to06(o_6to0[6]),
    .o_6to07(o_6to0[7]),
    .o_6to08(o_6to0[8]),
    .o_6to09(o_6to0[9]),
    .o_6to010(o_6to0[10]),
    .o_6to011(o_6to0[11]),
    .o_6to012(o_6to0[12]),
    .o_6to013(o_6to0[13]),
    .o_6to014(o_6to0[14]),
    .o_6to015(o_6to0[15]),
    .o_6to016(o_6to0[16]),
    .o_6to017(o_6to0[17]),
    .o_6to018(o_6to0[18]),
    .o_6to019(o_6to0[19]),
    .o_6to020(o_6to0[20]),
    .o_6to021(o_6to0[21]),
    .o_6to022(o_6to0[22]),
    .o_6to023(o_6to0[23]),
    .o_6to024(o_6to0[24]),
    .o_6to025(o_6to0[25]),
    .o_6to026(o_6to0[26]),
    .o_6to027(o_6to0[27]),
    .o_6to028(o_6to0[28]),
    .o_6to029(o_6to0[29]),
    .o_6to030(o_6to0[30]),
    .o_6to031(o_6to0[31]),
    .o_6to032(o_6to0[32]),
    .o_6to033(o_6to0[33]),
    .o_6to034(o_6to0[34]),
    .o_6to035(o_6to0[35]),
    .o_6to036(o_6to0[36]),
    .o_6to037(o_6to0[37]),
    .o_6to038(o_6to0[38]),
    .o_6to039(o_6to0[39]),
    .o_6to040(o_6to0[40]),
    .o_6to041(o_6to0[41]),
    .o_6to042(o_6to0[42]),
    .o_6to043(o_6to0[43]),
    .o_6to044(o_6to0[44]),
    .o_6to045(o_6to0[45]),
    .o_6to046(o_6to0[46]),
    .o_6to047(o_6to0[47]),
    .o_6to10(o_6to1[0]),
    .o_6to11(o_6to1[1]),
    .o_6to12(o_6to1[2]),
    .o_6to13(o_6to1[3]),
    .o_6to14(o_6to1[4]),
    .o_6to15(o_6to1[5]),
    .o_6to16(o_6to1[6]),
    .o_6to17(o_6to1[7]),
    .o_6to18(o_6to1[8]),
    .o_6to19(o_6to1[9]),
    .o_6to110(o_6to1[10]),
    .o_6to111(o_6to1[11]),
    .o_6to112(o_6to1[12]),
    .o_6to113(o_6to1[13]),
    .o_6to114(o_6to1[14]),
    .o_6to115(o_6to1[15]),
    .o_6to116(o_6to1[16]),
    .o_6to117(o_6to1[17]),
    .o_6to118(o_6to1[18]),
    .o_6to119(o_6to1[19]),
    .o_6to120(o_6to1[20]),
    .o_6to121(o_6to1[21]),
    .o_6to122(o_6to1[22]),
    .o_6to123(o_6to1[23]),
    .o_6to124(o_6to1[24]),
    .o_6to125(o_6to1[25]),
    .o_6to126(o_6to1[26]),
    .o_6to127(o_6to1[27]),
    .o_6to128(o_6to1[28]),
    .o_6to129(o_6to1[29]),
    .o_6to130(o_6to1[30]),
    .o_6to131(o_6to1[31]),
    .o_6to132(o_6to1[32]),
    .o_6to133(o_6to1[33]),
    .o_6to134(o_6to1[34]),
    .o_6to135(o_6to1[35]),
    .o_6to136(o_6to1[36]),
    .o_6to137(o_6to1[37]),
    .o_6to138(o_6to1[38]),
    .o_6to139(o_6to1[39]),
    .o_6to20(o_6to2[0]),
    .o_6to21(o_6to2[1]),
    .o_6to22(o_6to2[2]),
    .o_6to23(o_6to2[3]),
    .o_6to24(o_6to2[4]),
    .o_6to25(o_6to2[5]),
    .o_6to26(o_6to2[6]),
    .o_6to27(o_6to2[7]),
    .o_6to28(o_6to2[8]),
    .o_6to29(o_6to2[9]),
    .o_6to210(o_6to2[10]),
    .o_6to211(o_6to2[11]),
    .o_6to212(o_6to2[12]),
    .o_6to213(o_6to2[13]),
    .o_6to214(o_6to2[14]),
    .o_6to215(o_6to2[15]),
    .o_6to216(o_6to2[16]),
    .o_6to217(o_6to2[17]),
    .o_6to218(o_6to2[18]),
    .o_6to219(o_6to2[19]),
    .o_6to220(o_6to2[20]),
    .o_6to221(o_6to2[21]),
    .o_6to222(o_6to2[22]),
    .o_6to223(o_6to2[23]),
    .o_6to224(o_6to2[24]),
    .o_6to225(o_6to2[25]),
    .o_6to226(o_6to2[26]),
    .o_6to227(o_6to2[27]),
    .o_6to228(o_6to2[28]),
    .o_6to229(o_6to2[29]),
    .o_6to230(o_6to2[30]),
    .o_6to231(o_6to2[31]),
    .o_6to30(o_6to3[0]),
    .o_6to31(o_6to3[1]),
    .o_6to32(o_6to3[2]),
    .o_6to33(o_6to3[3]),
    .o_6to34(o_6to3[4]),
    .o_6to35(o_6to3[5]),
    .o_6to36(o_6to3[6]),
    .o_6to37(o_6to3[7]),
    .o_6to38(o_6to3[8]),
    .o_6to39(o_6to3[9]),
    .o_6to310(o_6to3[10]),
    .o_6to311(o_6to3[11]),
    .o_6to312(o_6to3[12]),
    .o_6to313(o_6to3[13]),
    .o_6to314(o_6to3[14]),
    .o_6to315(o_6to3[15]),
    .o_6to316(o_6to3[16]),
    .o_6to317(o_6to3[17]),
    .o_6to318(o_6to3[18]),
    .o_6to319(o_6to3[19]),
    .o_6to320(o_6to3[20]),
    .o_6to321(o_6to3[21]),
    .o_6to322(o_6to3[22]),
    .o_6to323(o_6to3[23]),
    .o_6to40(o_6to4[0]),
    .o_6to41(o_6to4[1]),
    .o_6to42(o_6to4[2]),
    .o_6to43(o_6to4[3]),
    .o_6to44(o_6to4[4]),
    .o_6to45(o_6to4[5]),
    .o_6to46(o_6to4[6]),
    .o_6to47(o_6to4[7]),
    .o_6to48(o_6to4[8]),
    .o_6to49(o_6to4[9]),
    .o_6to410(o_6to4[10]),
    .o_6to411(o_6to4[11]),
    .o_6to412(o_6to4[12]),
    .o_6to413(o_6to4[13]),
    .o_6to414(o_6to4[14]),
    .o_6to415(o_6to4[15]),
    .o_6to50(o_6to5[0]),
    .o_6to51(o_6to5[1]),
    .o_6to52(o_6to5[2]),
    .o_6to53(o_6to5[3]),
    .o_6to54(o_6to5[4]),
    .o_6to55(o_6to5[5]),
    .o_6to56(o_6to5[6]),
    .o_6to57(o_6to5[7]),
    .o_e2w0(o_e2w[0]),
    .o_e2w1(o_e2w[1]),
    .o_e2w2(o_e2w[2]),
    .o_e2w3(o_e2w[3]),
    .o_e2w4(o_e2w[4]),
    .o_e2w5(o_e2w[5]),
    .o_e2w6(o_e2w[6]),
    .o_e2w7(o_e2w[7]),
    .o_e2w8(o_e2w[8]),
    .o_e2w9(o_e2w[9]),
    .o_e2w10(o_e2w[10]),
    .o_e2w11(o_e2w[11]),
    .o_e2w12(o_e2w[12]),
    .o_e2w13(o_e2w[13]),
    .o_e2w14(o_e2w[14]),
    .o_e2w15(o_e2w[15]),
    .o_e2w16(o_e2w[16]),
    .o_e2w17(o_e2w[17]),
    .o_e2w18(o_e2w[18]),
    .o_e2w19(o_e2w[19]),
    .o_e2w20(o_e2w[20]),
    .o_e2w21(o_e2w[21]),
    .o_e2w22(o_e2w[22]),
    .o_e2w23(o_e2w[23]),
    .o_e2w24(o_e2w[24]),
    .o_e2w25(o_e2w[25]),
    .o_e2w26(o_e2w[26]),
    .o_e2w27(o_e2w[27]),
    .o_e2w28(o_e2w[28]),
    .o_e2w29(o_e2w[29]),
    .o_e2w30(o_e2w[30]),
    .o_e2w31(o_e2w[31]),
    .o_e2w32(o_e2w[32]),
    .o_e2w33(o_e2w[33]),
    .o_e2w34(o_e2w[34]),
    .o_e2w35(o_e2w[35]),
    .o_e2w36(o_e2w[36]),
    .o_e2w37(o_e2w[37]),
    .o_e2w38(o_e2w[38]),
    .o_e2w39(o_e2w[39]),
    .o_e2w40(o_e2w[40]),
    .o_e2w41(o_e2w[41]),
    .o_e2w42(o_e2w[42]),
    .o_e2w43(o_e2w[43]),
    .o_e2w44(o_e2w[44]),
    .o_e2w45(o_e2w[45]),
    .o_e2w46(o_e2w[46]),
    .o_e2w47(o_e2w[47]),
    .o_e2w48(o_e2w[48]),
    .o_e2w49(o_e2w[49]),
    .o_e2w50(o_e2w[50]),
    .o_e2w51(o_e2w[51]),
    .o_e2w52(o_e2w[52]),
    .o_e2w53(o_e2w[53]),
    .o_e2w54(o_e2w[54]),
    .o_e2w55(o_e2w[55]),
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
    .N4BEG0(N4BEG[12]),
    .N4BEG1(N4BEG[13]),
    .N4BEG2(N4BEG[14]),
    .N4BEG3(N4BEG[15]),
    .NN4BEG0(NN4BEG[12]),
    .NN4BEG1(NN4BEG[13]),
    .NN4BEG2(NN4BEG[14]),
    .NN4BEG3(NN4BEG[15]),
    .E1BEG0(E1BEG[0]),
    .E1BEG1(E1BEG[1]),
    .E1BEG2(E1BEG[2]),
    .E1BEG3(E1BEG[3]),
    .E2BEG0(E2BEG[0]),
    .E2BEG1(E2BEG[1]),
    .E2BEG2(E2BEG[2]),
    .E2BEG3(E2BEG[3]),
    .E2BEG4(E2BEG[4]),
    .E2BEG5(E2BEG[5]),
    .E2BEG6(E2BEG[6]),
    .E2BEG7(E2BEG[7]),
    .E2BEGb0(E2BEGb[0]),
    .E2BEGb1(E2BEGb[1]),
    .E2BEGb2(E2BEGb[2]),
    .E2BEGb3(E2BEGb[3]),
    .E2BEGb4(E2BEGb[4]),
    .E2BEGb5(E2BEGb[5]),
    .E2BEGb6(E2BEGb[6]),
    .E2BEGb7(E2BEGb[7]),
    .EE4BEG0(EE4BEG[12]),
    .EE4BEG1(EE4BEG[13]),
    .EE4BEG2(EE4BEG[14]),
    .EE4BEG3(EE4BEG[15]),
    .E6BEG0(E6BEG[10]),
    .E6BEG1(E6BEG[11]),
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
    .S4BEG0(S4BEG[12]),
    .S4BEG1(S4BEG[13]),
    .S4BEG2(S4BEG[14]),
    .S4BEG3(S4BEG[15]),
    .SS4BEG0(SS4BEG[12]),
    .SS4BEG1(SS4BEG[13]),
    .SS4BEG2(SS4BEG[14]),
    .SS4BEG3(SS4BEG[15]),
    .W1BEG0(W1BEG[0]),
    .W1BEG1(W1BEG[1]),
    .W1BEG2(W1BEG[2]),
    .W1BEG3(W1BEG[3]),
    .W2BEG0(W2BEG[0]),
    .W2BEG1(W2BEG[1]),
    .W2BEG2(W2BEG[2]),
    .W2BEG3(W2BEG[3]),
    .W2BEG4(W2BEG[4]),
    .W2BEG5(W2BEG[5]),
    .W2BEG6(W2BEG[6]),
    .W2BEG7(W2BEG[7]),
    .W2BEGb0(W2BEGb[0]),
    .W2BEGb1(W2BEGb[1]),
    .W2BEGb2(W2BEGb[2]),
    .W2BEGb3(W2BEGb[3]),
    .W2BEGb4(W2BEGb[4]),
    .W2BEGb5(W2BEGb[5]),
    .W2BEGb6(W2BEGb[6]),
    .W2BEGb7(W2BEGb[7]),
    .WW4BEG0(WW4BEG[12]),
    .WW4BEG1(WW4BEG[13]),
    .WW4BEG2(WW4BEG[14]),
    .WW4BEG3(WW4BEG[15]),
    .W6BEG0(W6BEG[10]),
    .W6BEG1(W6BEG[11]),
    .clk(clk),
    .clk_en(clk_en),
    .req_cxu0(req_cxu0),
    .req_cxu1(req_cxu1),
    .req_data00(req_data00),
    .req_data01(req_data01),
    .req_data02(req_data02),
    .req_data03(req_data03),
    .req_data04(req_data04),
    .req_data05(req_data05),
    .req_data06(req_data06),
    .req_data07(req_data07),
    .req_data08(req_data08),
    .req_data09(req_data09),
    .req_data010(req_data010),
    .req_data011(req_data011),
    .req_data012(req_data012),
    .req_data013(req_data013),
    .req_data014(req_data014),
    .req_data015(req_data015),
    .req_data016(req_data016),
    .req_data017(req_data017),
    .req_data018(req_data018),
    .req_data019(req_data019),
    .req_data020(req_data020),
    .req_data021(req_data021),
    .req_data022(req_data022),
    .req_data023(req_data023),
    .req_data024(req_data024),
    .req_data025(req_data025),
    .req_data026(req_data026),
    .req_data027(req_data027),
    .req_data028(req_data028),
    .req_data029(req_data029),
    .req_data030(req_data030),
    .req_data031(req_data031),
    .req_data10(req_data10),
    .req_data11(req_data11),
    .req_data12(req_data12),
    .req_data13(req_data13),
    .req_data14(req_data14),
    .req_data15(req_data15),
    .req_data16(req_data16),
    .req_data17(req_data17),
    .req_data18(req_data18),
    .req_data19(req_data19),
    .req_data110(req_data110),
    .req_data111(req_data111),
    .req_data112(req_data112),
    .req_data113(req_data113),
    .req_data114(req_data114),
    .req_data115(req_data115),
    .req_data116(req_data116),
    .req_data117(req_data117),
    .req_data118(req_data118),
    .req_data119(req_data119),
    .req_data120(req_data120),
    .req_data121(req_data121),
    .req_data122(req_data122),
    .req_data123(req_data123),
    .req_data124(req_data124),
    .req_data125(req_data125),
    .req_data126(req_data126),
    .req_data127(req_data127),
    .req_data128(req_data128),
    .req_data129(req_data129),
    .req_data130(req_data130),
    .req_data131(req_data131),
    .req_func0(req_func0),
    .req_func1(req_func1),
    .req_func2(req_func2),
    .req_insn(req_insn),
    .req_state(req_state),
    .req_valid(req_valid),
    .resp_ready(resp_ready),
    .rst(rst),
    .t_req_ready(t_req_ready),
    .t_resp_data0(t_resp_data0),
    .t_resp_data1(t_resp_data1),
    .t_resp_data2(t_resp_data2),
    .t_resp_data3(t_resp_data3),
    .t_resp_data4(t_resp_data4),
    .t_resp_data5(t_resp_data5),
    .t_resp_data6(t_resp_data6),
    .t_resp_data7(t_resp_data7),
    .t_resp_data8(t_resp_data8),
    .t_resp_data9(t_resp_data9),
    .t_resp_data10(t_resp_data10),
    .t_resp_data11(t_resp_data11),
    .t_resp_data12(t_resp_data12),
    .t_resp_data13(t_resp_data13),
    .t_resp_data14(t_resp_data14),
    .t_resp_data15(t_resp_data15),
    .t_resp_data16(t_resp_data16),
    .t_resp_data17(t_resp_data17),
    .t_resp_data18(t_resp_data18),
    .t_resp_data19(t_resp_data19),
    .t_resp_data20(t_resp_data20),
    .t_resp_data21(t_resp_data21),
    .t_resp_data22(t_resp_data22),
    .t_resp_data23(t_resp_data23),
    .t_resp_data24(t_resp_data24),
    .t_resp_data25(t_resp_data25),
    .t_resp_data26(t_resp_data26),
    .t_resp_data27(t_resp_data27),
    .t_resp_data28(t_resp_data28),
    .t_resp_data29(t_resp_data29),
    .t_resp_data30(t_resp_data30),
    .t_resp_data31(t_resp_data31),
    .t_resp_status0(t_resp_status0),
    .t_resp_status1(t_resp_status1),
    .t_resp_status2(t_resp_status2),
    .t_resp_valid(t_resp_valid),
    .J2MID_ABa_BEG0(J2MID_ABa_BEG[0]),
    .J2MID_ABa_BEG1(J2MID_ABa_BEG[1]),
    .J2MID_ABa_BEG2(J2MID_ABa_BEG[2]),
    .J2MID_ABa_BEG3(J2MID_ABa_BEG[3]),
    .J2MID_CDa_BEG0(J2MID_CDa_BEG[0]),
    .J2MID_CDa_BEG1(J2MID_CDa_BEG[1]),
    .J2MID_CDa_BEG2(J2MID_CDa_BEG[2]),
    .J2MID_CDa_BEG3(J2MID_CDa_BEG[3]),
    .J2MID_EFa_BEG0(J2MID_EFa_BEG[0]),
    .J2MID_EFa_BEG1(J2MID_EFa_BEG[1]),
    .J2MID_EFa_BEG2(J2MID_EFa_BEG[2]),
    .J2MID_EFa_BEG3(J2MID_EFa_BEG[3]),
    .J2MID_GHa_BEG0(J2MID_GHa_BEG[0]),
    .J2MID_GHa_BEG1(J2MID_GHa_BEG[1]),
    .J2MID_GHa_BEG2(J2MID_GHa_BEG[2]),
    .J2MID_GHa_BEG3(J2MID_GHa_BEG[3]),
    .J2MID_ABb_BEG0(J2MID_ABb_BEG[0]),
    .J2MID_ABb_BEG1(J2MID_ABb_BEG[1]),
    .J2MID_ABb_BEG2(J2MID_ABb_BEG[2]),
    .J2MID_ABb_BEG3(J2MID_ABb_BEG[3]),
    .J2MID_CDb_BEG0(J2MID_CDb_BEG[0]),
    .J2MID_CDb_BEG1(J2MID_CDb_BEG[1]),
    .J2MID_CDb_BEG2(J2MID_CDb_BEG[2]),
    .J2MID_CDb_BEG3(J2MID_CDb_BEG[3]),
    .J2MID_EFb_BEG0(J2MID_EFb_BEG[0]),
    .J2MID_EFb_BEG1(J2MID_EFb_BEG[1]),
    .J2MID_EFb_BEG2(J2MID_EFb_BEG[2]),
    .J2MID_EFb_BEG3(J2MID_EFb_BEG[3]),
    .J2MID_GHb_BEG0(J2MID_GHb_BEG[0]),
    .J2MID_GHb_BEG1(J2MID_GHb_BEG[1]),
    .J2MID_GHb_BEG2(J2MID_GHb_BEG[2]),
    .J2MID_GHb_BEG3(J2MID_GHb_BEG[3]),
    .J2END_AB_BEG0(J2END_AB_BEG[0]),
    .J2END_AB_BEG1(J2END_AB_BEG[1]),
    .J2END_AB_BEG2(J2END_AB_BEG[2]),
    .J2END_AB_BEG3(J2END_AB_BEG[3]),
    .J2END_CD_BEG0(J2END_CD_BEG[0]),
    .J2END_CD_BEG1(J2END_CD_BEG[1]),
    .J2END_CD_BEG2(J2END_CD_BEG[2]),
    .J2END_CD_BEG3(J2END_CD_BEG[3]),
    .J2END_EF_BEG0(J2END_EF_BEG[0]),
    .J2END_EF_BEG1(J2END_EF_BEG[1]),
    .J2END_EF_BEG2(J2END_EF_BEG[2]),
    .J2END_EF_BEG3(J2END_EF_BEG[3]),
    .J2END_GH_BEG0(J2END_GH_BEG[0]),
    .J2END_GH_BEG1(J2END_GH_BEG[1]),
    .J2END_GH_BEG2(J2END_GH_BEG[2]),
    .J2END_GH_BEG3(J2END_GH_BEG[3]),
    .JN2BEG0(JN2BEG[0]),
    .JN2BEG1(JN2BEG[1]),
    .JN2BEG2(JN2BEG[2]),
    .JN2BEG3(JN2BEG[3]),
    .JN2BEG4(JN2BEG[4]),
    .JN2BEG5(JN2BEG[5]),
    .JN2BEG6(JN2BEG[6]),
    .JN2BEG7(JN2BEG[7]),
    .JE2BEG0(JE2BEG[0]),
    .JE2BEG1(JE2BEG[1]),
    .JE2BEG2(JE2BEG[2]),
    .JE2BEG3(JE2BEG[3]),
    .JE2BEG4(JE2BEG[4]),
    .JE2BEG5(JE2BEG[5]),
    .JE2BEG6(JE2BEG[6]),
    .JE2BEG7(JE2BEG[7]),
    .JS2BEG0(JS2BEG[0]),
    .JS2BEG1(JS2BEG[1]),
    .JS2BEG2(JS2BEG[2]),
    .JS2BEG3(JS2BEG[3]),
    .JS2BEG4(JS2BEG[4]),
    .JS2BEG5(JS2BEG[5]),
    .JS2BEG6(JS2BEG[6]),
    .JS2BEG7(JS2BEG[7]),
    .JW2BEG0(JW2BEG[0]),
    .JW2BEG1(JW2BEG[1]),
    .JW2BEG2(JW2BEG[2]),
    .JW2BEG3(JW2BEG[3]),
    .JW2BEG4(JW2BEG[4]),
    .JW2BEG5(JW2BEG[5]),
    .JW2BEG6(JW2BEG[6]),
    .JW2BEG7(JW2BEG[7]),
    .J_l_AB_BEG0(J_l_AB_BEG[0]),
    .J_l_AB_BEG1(J_l_AB_BEG[1]),
    .J_l_AB_BEG2(J_l_AB_BEG[2]),
    .J_l_AB_BEG3(J_l_AB_BEG[3]),
    .J_l_CD_BEG0(J_l_CD_BEG[0]),
    .J_l_CD_BEG1(J_l_CD_BEG[1]),
    .J_l_CD_BEG2(J_l_CD_BEG[2]),
    .J_l_CD_BEG3(J_l_CD_BEG[3]),
    .J_l_EF_BEG0(J_l_EF_BEG[0]),
    .J_l_EF_BEG1(J_l_EF_BEG[1]),
    .J_l_EF_BEG2(J_l_EF_BEG[2]),
    .J_l_EF_BEG3(J_l_EF_BEG[3]),
    .J_l_GH_BEG0(J_l_GH_BEG[0]),
    .J_l_GH_BEG1(J_l_GH_BEG[1]),
    .J_l_GH_BEG2(J_l_GH_BEG[2]),
    .J_l_GH_BEG3(J_l_GH_BEG[3]),
    .ConfigBits(ConfigBits[376-1:0]),
    .ConfigBits_N(ConfigBits_N[376-1:0])
);

endmodule
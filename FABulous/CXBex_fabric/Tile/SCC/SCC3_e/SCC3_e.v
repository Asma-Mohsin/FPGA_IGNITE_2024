module SCC3_e
    #(
`ifdef EMULATION
        parameter [639:0] Emulate_Bitstream=640'b0,
`endif
        parameter MaxFramesPerCol=20,
        parameter FrameBitsPerRow=32,
        parameter NoConfigBits=384
    )
    (
 //Side.NORTH
        output [47:0] BEG_o_6to0,        //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
        input [47:0] END_i_0to6,        //Port(Name=END_i_0to6, IO=INPUT, XOffset=0, YOffset=6, WireCount=8, Side=NORTH)
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
        input [47:0] END_o_6to0,        //Port(Name=END_o_6to0, IO=INPUT, XOffset=0, YOffset=-6, WireCount=8, Side=SOUTH)
        output [47:0] BEG_i_0to6,        //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
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
wire[47:0] END_o_6to0_i;
wire[39:0] BEG_o_6to0_i;
wire[47:0] END_i_0to6_i;
wire[39:0] BEG_i_0to6_i;
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

assign BEG_o_6to0_i[47-8:0] = END_o_6to0_i[47:8];

my_buf END_o_6to0_inbuf_0 (
    .A(END_o_6to0[8]),
    .X(END_o_6to0_i[8])
);

my_buf END_o_6to0_inbuf_1 (
    .A(END_o_6to0[9]),
    .X(END_o_6to0_i[9])
);

my_buf END_o_6to0_inbuf_2 (
    .A(END_o_6to0[10]),
    .X(END_o_6to0_i[10])
);

my_buf END_o_6to0_inbuf_3 (
    .A(END_o_6to0[11]),
    .X(END_o_6to0_i[11])
);

my_buf END_o_6to0_inbuf_4 (
    .A(END_o_6to0[12]),
    .X(END_o_6to0_i[12])
);

my_buf END_o_6to0_inbuf_5 (
    .A(END_o_6to0[13]),
    .X(END_o_6to0_i[13])
);

my_buf END_o_6to0_inbuf_6 (
    .A(END_o_6to0[14]),
    .X(END_o_6to0_i[14])
);

my_buf END_o_6to0_inbuf_7 (
    .A(END_o_6to0[15]),
    .X(END_o_6to0_i[15])
);

my_buf END_o_6to0_inbuf_8 (
    .A(END_o_6to0[16]),
    .X(END_o_6to0_i[16])
);

my_buf END_o_6to0_inbuf_9 (
    .A(END_o_6to0[17]),
    .X(END_o_6to0_i[17])
);

my_buf END_o_6to0_inbuf_10 (
    .A(END_o_6to0[18]),
    .X(END_o_6to0_i[18])
);

my_buf END_o_6to0_inbuf_11 (
    .A(END_o_6to0[19]),
    .X(END_o_6to0_i[19])
);

my_buf END_o_6to0_inbuf_12 (
    .A(END_o_6to0[20]),
    .X(END_o_6to0_i[20])
);

my_buf END_o_6to0_inbuf_13 (
    .A(END_o_6to0[21]),
    .X(END_o_6to0_i[21])
);

my_buf END_o_6to0_inbuf_14 (
    .A(END_o_6to0[22]),
    .X(END_o_6to0_i[22])
);

my_buf END_o_6to0_inbuf_15 (
    .A(END_o_6to0[23]),
    .X(END_o_6to0_i[23])
);

my_buf END_o_6to0_inbuf_16 (
    .A(END_o_6to0[24]),
    .X(END_o_6to0_i[24])
);

my_buf END_o_6to0_inbuf_17 (
    .A(END_o_6to0[25]),
    .X(END_o_6to0_i[25])
);

my_buf END_o_6to0_inbuf_18 (
    .A(END_o_6to0[26]),
    .X(END_o_6to0_i[26])
);

my_buf END_o_6to0_inbuf_19 (
    .A(END_o_6to0[27]),
    .X(END_o_6to0_i[27])
);

my_buf END_o_6to0_inbuf_20 (
    .A(END_o_6to0[28]),
    .X(END_o_6to0_i[28])
);

my_buf END_o_6to0_inbuf_21 (
    .A(END_o_6to0[29]),
    .X(END_o_6to0_i[29])
);

my_buf END_o_6to0_inbuf_22 (
    .A(END_o_6to0[30]),
    .X(END_o_6to0_i[30])
);

my_buf END_o_6to0_inbuf_23 (
    .A(END_o_6to0[31]),
    .X(END_o_6to0_i[31])
);

my_buf END_o_6to0_inbuf_24 (
    .A(END_o_6to0[32]),
    .X(END_o_6to0_i[32])
);

my_buf END_o_6to0_inbuf_25 (
    .A(END_o_6to0[33]),
    .X(END_o_6to0_i[33])
);

my_buf END_o_6to0_inbuf_26 (
    .A(END_o_6to0[34]),
    .X(END_o_6to0_i[34])
);

my_buf END_o_6to0_inbuf_27 (
    .A(END_o_6to0[35]),
    .X(END_o_6to0_i[35])
);

my_buf END_o_6to0_inbuf_28 (
    .A(END_o_6to0[36]),
    .X(END_o_6to0_i[36])
);

my_buf END_o_6to0_inbuf_29 (
    .A(END_o_6to0[37]),
    .X(END_o_6to0_i[37])
);

my_buf END_o_6to0_inbuf_30 (
    .A(END_o_6to0[38]),
    .X(END_o_6to0_i[38])
);

my_buf END_o_6to0_inbuf_31 (
    .A(END_o_6to0[39]),
    .X(END_o_6to0_i[39])
);

my_buf END_o_6to0_inbuf_32 (
    .A(END_o_6to0[40]),
    .X(END_o_6to0_i[40])
);

my_buf END_o_6to0_inbuf_33 (
    .A(END_o_6to0[41]),
    .X(END_o_6to0_i[41])
);

my_buf END_o_6to0_inbuf_34 (
    .A(END_o_6to0[42]),
    .X(END_o_6to0_i[42])
);

my_buf END_o_6to0_inbuf_35 (
    .A(END_o_6to0[43]),
    .X(END_o_6to0_i[43])
);

my_buf END_o_6to0_inbuf_36 (
    .A(END_o_6to0[44]),
    .X(END_o_6to0_i[44])
);

my_buf END_o_6to0_inbuf_37 (
    .A(END_o_6to0[45]),
    .X(END_o_6to0_i[45])
);

my_buf END_o_6to0_inbuf_38 (
    .A(END_o_6to0[46]),
    .X(END_o_6to0_i[46])
);

my_buf END_o_6to0_inbuf_39 (
    .A(END_o_6to0[47]),
    .X(END_o_6to0_i[47])
);

my_buf BEG_o_6to0_outbuf_0 (
    .A(BEG_o_6to0_i[0]),
    .X(BEG_o_6to0[0])
);

my_buf BEG_o_6to0_outbuf_1 (
    .A(BEG_o_6to0_i[1]),
    .X(BEG_o_6to0[1])
);

my_buf BEG_o_6to0_outbuf_2 (
    .A(BEG_o_6to0_i[2]),
    .X(BEG_o_6to0[2])
);

my_buf BEG_o_6to0_outbuf_3 (
    .A(BEG_o_6to0_i[3]),
    .X(BEG_o_6to0[3])
);

my_buf BEG_o_6to0_outbuf_4 (
    .A(BEG_o_6to0_i[4]),
    .X(BEG_o_6to0[4])
);

my_buf BEG_o_6to0_outbuf_5 (
    .A(BEG_o_6to0_i[5]),
    .X(BEG_o_6to0[5])
);

my_buf BEG_o_6to0_outbuf_6 (
    .A(BEG_o_6to0_i[6]),
    .X(BEG_o_6to0[6])
);

my_buf BEG_o_6to0_outbuf_7 (
    .A(BEG_o_6to0_i[7]),
    .X(BEG_o_6to0[7])
);

my_buf BEG_o_6to0_outbuf_8 (
    .A(BEG_o_6to0_i[8]),
    .X(BEG_o_6to0[8])
);

my_buf BEG_o_6to0_outbuf_9 (
    .A(BEG_o_6to0_i[9]),
    .X(BEG_o_6to0[9])
);

my_buf BEG_o_6to0_outbuf_10 (
    .A(BEG_o_6to0_i[10]),
    .X(BEG_o_6to0[10])
);

my_buf BEG_o_6to0_outbuf_11 (
    .A(BEG_o_6to0_i[11]),
    .X(BEG_o_6to0[11])
);

my_buf BEG_o_6to0_outbuf_12 (
    .A(BEG_o_6to0_i[12]),
    .X(BEG_o_6to0[12])
);

my_buf BEG_o_6to0_outbuf_13 (
    .A(BEG_o_6to0_i[13]),
    .X(BEG_o_6to0[13])
);

my_buf BEG_o_6to0_outbuf_14 (
    .A(BEG_o_6to0_i[14]),
    .X(BEG_o_6to0[14])
);

my_buf BEG_o_6to0_outbuf_15 (
    .A(BEG_o_6to0_i[15]),
    .X(BEG_o_6to0[15])
);

my_buf BEG_o_6to0_outbuf_16 (
    .A(BEG_o_6to0_i[16]),
    .X(BEG_o_6to0[16])
);

my_buf BEG_o_6to0_outbuf_17 (
    .A(BEG_o_6to0_i[17]),
    .X(BEG_o_6to0[17])
);

my_buf BEG_o_6to0_outbuf_18 (
    .A(BEG_o_6to0_i[18]),
    .X(BEG_o_6to0[18])
);

my_buf BEG_o_6to0_outbuf_19 (
    .A(BEG_o_6to0_i[19]),
    .X(BEG_o_6to0[19])
);

my_buf BEG_o_6to0_outbuf_20 (
    .A(BEG_o_6to0_i[20]),
    .X(BEG_o_6to0[20])
);

my_buf BEG_o_6to0_outbuf_21 (
    .A(BEG_o_6to0_i[21]),
    .X(BEG_o_6to0[21])
);

my_buf BEG_o_6to0_outbuf_22 (
    .A(BEG_o_6to0_i[22]),
    .X(BEG_o_6to0[22])
);

my_buf BEG_o_6to0_outbuf_23 (
    .A(BEG_o_6to0_i[23]),
    .X(BEG_o_6to0[23])
);

my_buf BEG_o_6to0_outbuf_24 (
    .A(BEG_o_6to0_i[24]),
    .X(BEG_o_6to0[24])
);

my_buf BEG_o_6to0_outbuf_25 (
    .A(BEG_o_6to0_i[25]),
    .X(BEG_o_6to0[25])
);

my_buf BEG_o_6to0_outbuf_26 (
    .A(BEG_o_6to0_i[26]),
    .X(BEG_o_6to0[26])
);

my_buf BEG_o_6to0_outbuf_27 (
    .A(BEG_o_6to0_i[27]),
    .X(BEG_o_6to0[27])
);

my_buf BEG_o_6to0_outbuf_28 (
    .A(BEG_o_6to0_i[28]),
    .X(BEG_o_6to0[28])
);

my_buf BEG_o_6to0_outbuf_29 (
    .A(BEG_o_6to0_i[29]),
    .X(BEG_o_6to0[29])
);

my_buf BEG_o_6to0_outbuf_30 (
    .A(BEG_o_6to0_i[30]),
    .X(BEG_o_6to0[30])
);

my_buf BEG_o_6to0_outbuf_31 (
    .A(BEG_o_6to0_i[31]),
    .X(BEG_o_6to0[31])
);

my_buf BEG_o_6to0_outbuf_32 (
    .A(BEG_o_6to0_i[32]),
    .X(BEG_o_6to0[32])
);

my_buf BEG_o_6to0_outbuf_33 (
    .A(BEG_o_6to0_i[33]),
    .X(BEG_o_6to0[33])
);

my_buf BEG_o_6to0_outbuf_34 (
    .A(BEG_o_6to0_i[34]),
    .X(BEG_o_6to0[34])
);

my_buf BEG_o_6to0_outbuf_35 (
    .A(BEG_o_6to0_i[35]),
    .X(BEG_o_6to0[35])
);

my_buf BEG_o_6to0_outbuf_36 (
    .A(BEG_o_6to0_i[36]),
    .X(BEG_o_6to0[36])
);

my_buf BEG_o_6to0_outbuf_37 (
    .A(BEG_o_6to0_i[37]),
    .X(BEG_o_6to0[37])
);

my_buf BEG_o_6to0_outbuf_38 (
    .A(BEG_o_6to0_i[38]),
    .X(BEG_o_6to0[38])
);

my_buf BEG_o_6to0_outbuf_39 (
    .A(BEG_o_6to0_i[39]),
    .X(BEG_o_6to0[39])
);

assign BEG_i_0to6_i[47-8:0] = END_i_0to6_i[47:8];

my_buf END_i_0to6_inbuf_0 (
    .A(END_i_0to6[8]),
    .X(END_i_0to6_i[8])
);

my_buf END_i_0to6_inbuf_1 (
    .A(END_i_0to6[9]),
    .X(END_i_0to6_i[9])
);

my_buf END_i_0to6_inbuf_2 (
    .A(END_i_0to6[10]),
    .X(END_i_0to6_i[10])
);

my_buf END_i_0to6_inbuf_3 (
    .A(END_i_0to6[11]),
    .X(END_i_0to6_i[11])
);

my_buf END_i_0to6_inbuf_4 (
    .A(END_i_0to6[12]),
    .X(END_i_0to6_i[12])
);

my_buf END_i_0to6_inbuf_5 (
    .A(END_i_0to6[13]),
    .X(END_i_0to6_i[13])
);

my_buf END_i_0to6_inbuf_6 (
    .A(END_i_0to6[14]),
    .X(END_i_0to6_i[14])
);

my_buf END_i_0to6_inbuf_7 (
    .A(END_i_0to6[15]),
    .X(END_i_0to6_i[15])
);

my_buf END_i_0to6_inbuf_8 (
    .A(END_i_0to6[16]),
    .X(END_i_0to6_i[16])
);

my_buf END_i_0to6_inbuf_9 (
    .A(END_i_0to6[17]),
    .X(END_i_0to6_i[17])
);

my_buf END_i_0to6_inbuf_10 (
    .A(END_i_0to6[18]),
    .X(END_i_0to6_i[18])
);

my_buf END_i_0to6_inbuf_11 (
    .A(END_i_0to6[19]),
    .X(END_i_0to6_i[19])
);

my_buf END_i_0to6_inbuf_12 (
    .A(END_i_0to6[20]),
    .X(END_i_0to6_i[20])
);

my_buf END_i_0to6_inbuf_13 (
    .A(END_i_0to6[21]),
    .X(END_i_0to6_i[21])
);

my_buf END_i_0to6_inbuf_14 (
    .A(END_i_0to6[22]),
    .X(END_i_0to6_i[22])
);

my_buf END_i_0to6_inbuf_15 (
    .A(END_i_0to6[23]),
    .X(END_i_0to6_i[23])
);

my_buf END_i_0to6_inbuf_16 (
    .A(END_i_0to6[24]),
    .X(END_i_0to6_i[24])
);

my_buf END_i_0to6_inbuf_17 (
    .A(END_i_0to6[25]),
    .X(END_i_0to6_i[25])
);

my_buf END_i_0to6_inbuf_18 (
    .A(END_i_0to6[26]),
    .X(END_i_0to6_i[26])
);

my_buf END_i_0to6_inbuf_19 (
    .A(END_i_0to6[27]),
    .X(END_i_0to6_i[27])
);

my_buf END_i_0to6_inbuf_20 (
    .A(END_i_0to6[28]),
    .X(END_i_0to6_i[28])
);

my_buf END_i_0to6_inbuf_21 (
    .A(END_i_0to6[29]),
    .X(END_i_0to6_i[29])
);

my_buf END_i_0to6_inbuf_22 (
    .A(END_i_0to6[30]),
    .X(END_i_0to6_i[30])
);

my_buf END_i_0to6_inbuf_23 (
    .A(END_i_0to6[31]),
    .X(END_i_0to6_i[31])
);

my_buf END_i_0to6_inbuf_24 (
    .A(END_i_0to6[32]),
    .X(END_i_0to6_i[32])
);

my_buf END_i_0to6_inbuf_25 (
    .A(END_i_0to6[33]),
    .X(END_i_0to6_i[33])
);

my_buf END_i_0to6_inbuf_26 (
    .A(END_i_0to6[34]),
    .X(END_i_0to6_i[34])
);

my_buf END_i_0to6_inbuf_27 (
    .A(END_i_0to6[35]),
    .X(END_i_0to6_i[35])
);

my_buf END_i_0to6_inbuf_28 (
    .A(END_i_0to6[36]),
    .X(END_i_0to6_i[36])
);

my_buf END_i_0to6_inbuf_29 (
    .A(END_i_0to6[37]),
    .X(END_i_0to6_i[37])
);

my_buf END_i_0to6_inbuf_30 (
    .A(END_i_0to6[38]),
    .X(END_i_0to6_i[38])
);

my_buf END_i_0to6_inbuf_31 (
    .A(END_i_0to6[39]),
    .X(END_i_0to6_i[39])
);

my_buf END_i_0to6_inbuf_32 (
    .A(END_i_0to6[40]),
    .X(END_i_0to6_i[40])
);

my_buf END_i_0to6_inbuf_33 (
    .A(END_i_0to6[41]),
    .X(END_i_0to6_i[41])
);

my_buf END_i_0to6_inbuf_34 (
    .A(END_i_0to6[42]),
    .X(END_i_0to6_i[42])
);

my_buf END_i_0to6_inbuf_35 (
    .A(END_i_0to6[43]),
    .X(END_i_0to6_i[43])
);

my_buf END_i_0to6_inbuf_36 (
    .A(END_i_0to6[44]),
    .X(END_i_0to6_i[44])
);

my_buf END_i_0to6_inbuf_37 (
    .A(END_i_0to6[45]),
    .X(END_i_0to6_i[45])
);

my_buf END_i_0to6_inbuf_38 (
    .A(END_i_0to6[46]),
    .X(END_i_0to6_i[46])
);

my_buf END_i_0to6_inbuf_39 (
    .A(END_i_0to6[47]),
    .X(END_i_0to6_i[47])
);

my_buf BEG_i_0to6_outbuf_0 (
    .A(BEG_i_0to6_i[0]),
    .X(BEG_i_0to6[0])
);

my_buf BEG_i_0to6_outbuf_1 (
    .A(BEG_i_0to6_i[1]),
    .X(BEG_i_0to6[1])
);

my_buf BEG_i_0to6_outbuf_2 (
    .A(BEG_i_0to6_i[2]),
    .X(BEG_i_0to6[2])
);

my_buf BEG_i_0to6_outbuf_3 (
    .A(BEG_i_0to6_i[3]),
    .X(BEG_i_0to6[3])
);

my_buf BEG_i_0to6_outbuf_4 (
    .A(BEG_i_0to6_i[4]),
    .X(BEG_i_0to6[4])
);

my_buf BEG_i_0to6_outbuf_5 (
    .A(BEG_i_0to6_i[5]),
    .X(BEG_i_0to6[5])
);

my_buf BEG_i_0to6_outbuf_6 (
    .A(BEG_i_0to6_i[6]),
    .X(BEG_i_0to6[6])
);

my_buf BEG_i_0to6_outbuf_7 (
    .A(BEG_i_0to6_i[7]),
    .X(BEG_i_0to6[7])
);

my_buf BEG_i_0to6_outbuf_8 (
    .A(BEG_i_0to6_i[8]),
    .X(BEG_i_0to6[8])
);

my_buf BEG_i_0to6_outbuf_9 (
    .A(BEG_i_0to6_i[9]),
    .X(BEG_i_0to6[9])
);

my_buf BEG_i_0to6_outbuf_10 (
    .A(BEG_i_0to6_i[10]),
    .X(BEG_i_0to6[10])
);

my_buf BEG_i_0to6_outbuf_11 (
    .A(BEG_i_0to6_i[11]),
    .X(BEG_i_0to6[11])
);

my_buf BEG_i_0to6_outbuf_12 (
    .A(BEG_i_0to6_i[12]),
    .X(BEG_i_0to6[12])
);

my_buf BEG_i_0to6_outbuf_13 (
    .A(BEG_i_0to6_i[13]),
    .X(BEG_i_0to6[13])
);

my_buf BEG_i_0to6_outbuf_14 (
    .A(BEG_i_0to6_i[14]),
    .X(BEG_i_0to6[14])
);

my_buf BEG_i_0to6_outbuf_15 (
    .A(BEG_i_0to6_i[15]),
    .X(BEG_i_0to6[15])
);

my_buf BEG_i_0to6_outbuf_16 (
    .A(BEG_i_0to6_i[16]),
    .X(BEG_i_0to6[16])
);

my_buf BEG_i_0to6_outbuf_17 (
    .A(BEG_i_0to6_i[17]),
    .X(BEG_i_0to6[17])
);

my_buf BEG_i_0to6_outbuf_18 (
    .A(BEG_i_0to6_i[18]),
    .X(BEG_i_0to6[18])
);

my_buf BEG_i_0to6_outbuf_19 (
    .A(BEG_i_0to6_i[19]),
    .X(BEG_i_0to6[19])
);

my_buf BEG_i_0to6_outbuf_20 (
    .A(BEG_i_0to6_i[20]),
    .X(BEG_i_0to6[20])
);

my_buf BEG_i_0to6_outbuf_21 (
    .A(BEG_i_0to6_i[21]),
    .X(BEG_i_0to6[21])
);

my_buf BEG_i_0to6_outbuf_22 (
    .A(BEG_i_0to6_i[22]),
    .X(BEG_i_0to6[22])
);

my_buf BEG_i_0to6_outbuf_23 (
    .A(BEG_i_0to6_i[23]),
    .X(BEG_i_0to6[23])
);

my_buf BEG_i_0to6_outbuf_24 (
    .A(BEG_i_0to6_i[24]),
    .X(BEG_i_0to6[24])
);

my_buf BEG_i_0to6_outbuf_25 (
    .A(BEG_i_0to6_i[25]),
    .X(BEG_i_0to6[25])
);

my_buf BEG_i_0to6_outbuf_26 (
    .A(BEG_i_0to6_i[26]),
    .X(BEG_i_0to6[26])
);

my_buf BEG_i_0to6_outbuf_27 (
    .A(BEG_i_0to6_i[27]),
    .X(BEG_i_0to6[27])
);

my_buf BEG_i_0to6_outbuf_28 (
    .A(BEG_i_0to6_i[28]),
    .X(BEG_i_0to6[28])
);

my_buf BEG_i_0to6_outbuf_29 (
    .A(BEG_i_0to6_i[29]),
    .X(BEG_i_0to6[29])
);

my_buf BEG_i_0to6_outbuf_30 (
    .A(BEG_i_0to6_i[30]),
    .X(BEG_i_0to6[30])
);

my_buf BEG_i_0to6_outbuf_31 (
    .A(BEG_i_0to6_i[31]),
    .X(BEG_i_0to6[31])
);

my_buf BEG_i_0to6_outbuf_32 (
    .A(BEG_i_0to6_i[32]),
    .X(BEG_i_0to6[32])
);

my_buf BEG_i_0to6_outbuf_33 (
    .A(BEG_i_0to6_i[33]),
    .X(BEG_i_0to6[33])
);

my_buf BEG_i_0to6_outbuf_34 (
    .A(BEG_i_0to6_i[34]),
    .X(BEG_i_0to6[34])
);

my_buf BEG_i_0to6_outbuf_35 (
    .A(BEG_i_0to6_i[35]),
    .X(BEG_i_0to6[35])
);

my_buf BEG_i_0to6_outbuf_36 (
    .A(BEG_i_0to6_i[36]),
    .X(BEG_i_0to6[36])
);

my_buf BEG_i_0to6_outbuf_37 (
    .A(BEG_i_0to6_i[37]),
    .X(BEG_i_0to6[37])
);

my_buf BEG_i_0to6_outbuf_38 (
    .A(BEG_i_0to6_i[38]),
    .X(BEG_i_0to6[38])
);

my_buf BEG_i_0to6_outbuf_39 (
    .A(BEG_i_0to6_i[39]),
    .X(BEG_i_0to6[39])
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
SCC3_e_ConfigMem
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Emulate_Bitstream)
    )
`endif
    Inst_SCC3_e_ConfigMem
    (
    .FrameData(FrameData),
    .FrameStrobe(FrameStrobe),
    .ConfigBits(ConfigBits),
    .ConfigBits_N(ConfigBits_N)
);

 //BEL component instantiations
SCC3_e_switch_matrix Inst_SCC3_e_switch_matrix (
    .END_o_6to00(END_o_6to0[0]),
    .END_o_6to01(END_o_6to0[1]),
    .END_o_6to02(END_o_6to0[2]),
    .END_o_6to03(END_o_6to0[3]),
    .END_o_6to04(END_o_6to0[4]),
    .END_o_6to05(END_o_6to0[5]),
    .END_o_6to06(END_o_6to0[6]),
    .END_o_6to07(END_o_6to0[7]),
    .END_i_0to60(END_i_0to6[0]),
    .END_i_0to61(END_i_0to6[1]),
    .END_i_0to62(END_i_0to6[2]),
    .END_i_0to63(END_i_0to6[3]),
    .END_i_0to64(END_i_0to6[4]),
    .END_i_0to65(END_i_0to6[5]),
    .END_i_0to66(END_i_0to6[6]),
    .END_i_0to67(END_i_0to6[7]),
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
    .BEG_o_6to00(BEG_o_6to0[40]),
    .BEG_o_6to01(BEG_o_6to0[41]),
    .BEG_o_6to02(BEG_o_6to0[42]),
    .BEG_o_6to03(BEG_o_6to0[43]),
    .BEG_o_6to04(BEG_o_6to0[44]),
    .BEG_o_6to05(BEG_o_6to0[45]),
    .BEG_o_6to06(BEG_o_6to0[46]),
    .BEG_o_6to07(BEG_o_6to0[47]),
    .BEG_i_0to60(BEG_i_0to6[40]),
    .BEG_i_0to61(BEG_i_0to6[41]),
    .BEG_i_0to62(BEG_i_0to6[42]),
    .BEG_i_0to63(BEG_i_0to6[43]),
    .BEG_i_0to64(BEG_i_0to6[44]),
    .BEG_i_0to65(BEG_i_0to6[45]),
    .BEG_i_0to66(BEG_i_0to6[46]),
    .BEG_i_0to67(BEG_i_0to6[47]),
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
    .ConfigBits(ConfigBits[384-1:0]),
    .ConfigBits_N(ConfigBits_N[384-1:0])
);

endmodule
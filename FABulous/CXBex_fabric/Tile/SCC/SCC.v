module SCC
    #(
`ifdef EMULATION
        parameter [639:0] Tile_X0Y0_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X1Y0_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y1_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X1Y1_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y2_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X1Y2_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y3_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X1Y3_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y4_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X1Y4_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y5_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X1Y5_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y6_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X1Y6_Emulate_Bitstream=640'b0,
`endif
        parameter MaxFramesPerCol=20,
        parameter FrameBitsPerRow=32,
        parameter NoConfigBits=0
    )
    (
    //Tile_X0Y0_Direction.NORTH
        output [3:0] Tile_X0Y0_N1BEG, //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
        output [7:0] Tile_X0Y0_N2BEG, //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
        output [7:0] Tile_X0Y0_N2BEGb, //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
        output [15:0] Tile_X0Y0_N4BEG, //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
        output [15:0] Tile_X0Y0_NN4BEG, //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
        input [3:0] Tile_X0Y0_S1END, //Port(Name=S1END, IO=INPUT, XOffset=0, YOffset=1, WireCount=4, Side=NORTH)
        input [7:0] Tile_X0Y0_S2MID, //Port(Name=S2MID, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
        input [7:0] Tile_X0Y0_S2END, //Port(Name=S2END, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
        input [15:0] Tile_X0Y0_S4END, //Port(Name=S4END, IO=INPUT, XOffset=0, YOffset=4, WireCount=4, Side=NORTH)
        input [15:0] Tile_X0Y0_SS4END, //Port(Name=SS4END, IO=INPUT, XOffset=0, YOffset=4, WireCount=4, Side=NORTH)
    //Tile_X0Y0_Direction.EAST
        input [3:0] Tile_X0Y0_E1END, //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input [7:0] Tile_X0Y0_E2MID, //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [7:0] Tile_X0Y0_E2END, //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [15:0] Tile_X0Y0_EE4END, //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input [11:0] Tile_X0Y0_E6END, //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output [3:0] Tile_X0Y0_W1BEG, //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output [7:0] Tile_X0Y0_W2BEG, //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [7:0] Tile_X0Y0_W2BEGb, //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [15:0] Tile_X0Y0_WW4BEG, //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output [11:0] Tile_X0Y0_W6BEG, //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    //Tile_X1Y0_Direction.NORTH
        output [3:0] Tile_X1Y0_N1BEG, //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
        output [7:0] Tile_X1Y0_N2BEG, //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
        output [7:0] Tile_X1Y0_N2BEGb, //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
        output [15:0] Tile_X1Y0_N4BEG, //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
        output [15:0] Tile_X1Y0_NN4BEG, //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
        input [3:0] Tile_X1Y0_S1END, //Port(Name=S1END, IO=INPUT, XOffset=0, YOffset=1, WireCount=4, Side=NORTH)
        input [7:0] Tile_X1Y0_S2MID, //Port(Name=S2MID, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
        input [7:0] Tile_X1Y0_S2END, //Port(Name=S2END, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
        input [15:0] Tile_X1Y0_S4END, //Port(Name=S4END, IO=INPUT, XOffset=0, YOffset=4, WireCount=4, Side=NORTH)
        input [15:0] Tile_X1Y0_SS4END, //Port(Name=SS4END, IO=INPUT, XOffset=0, YOffset=4, WireCount=4, Side=NORTH)
    //Tile_X1Y0_Direction.EAST
        output [3:0] Tile_X1Y0_E1BEG, //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
        output [7:0] Tile_X1Y0_E2BEG, //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [7:0] Tile_X1Y0_E2BEGb, //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [15:0] Tile_X1Y0_EE4BEG, //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
        output [11:0] Tile_X1Y0_E6BEG, //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
        input [3:0] Tile_X1Y0_W1END, //Port(Name=W1END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=4, Side=EAST)
        input [7:0] Tile_X1Y0_W2MID, //Port(Name=W2MID, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [7:0] Tile_X1Y0_W2END, //Port(Name=W2END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [15:0] Tile_X1Y0_WW4END, //Port(Name=WW4END, IO=INPUT, XOffset=-4, YOffset=0, WireCount=4, Side=EAST)
        input [11:0] Tile_X1Y0_W6END, //Port(Name=W6END, IO=INPUT, XOffset=-6, YOffset=0, WireCount=2, Side=EAST)
    //Tile_X0Y1_Direction.EAST
        input [3:0] Tile_X0Y1_E1END, //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input [7:0] Tile_X0Y1_E2MID, //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [7:0] Tile_X0Y1_E2END, //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [15:0] Tile_X0Y1_EE4END, //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input [11:0] Tile_X0Y1_E6END, //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output [3:0] Tile_X0Y1_W1BEG, //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output [7:0] Tile_X0Y1_W2BEG, //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [7:0] Tile_X0Y1_W2BEGb, //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [15:0] Tile_X0Y1_WW4BEG, //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output [11:0] Tile_X0Y1_W6BEG, //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    //Tile_X1Y1_Direction.EAST
        output [3:0] Tile_X1Y1_E1BEG, //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
        output [7:0] Tile_X1Y1_E2BEG, //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [7:0] Tile_X1Y1_E2BEGb, //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [15:0] Tile_X1Y1_EE4BEG, //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
        output [11:0] Tile_X1Y1_E6BEG, //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
        input [3:0] Tile_X1Y1_W1END, //Port(Name=W1END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=4, Side=EAST)
        input [7:0] Tile_X1Y1_W2MID, //Port(Name=W2MID, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [7:0] Tile_X1Y1_W2END, //Port(Name=W2END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [15:0] Tile_X1Y1_WW4END, //Port(Name=WW4END, IO=INPUT, XOffset=-4, YOffset=0, WireCount=4, Side=EAST)
        input [11:0] Tile_X1Y1_W6END, //Port(Name=W6END, IO=INPUT, XOffset=-6, YOffset=0, WireCount=2, Side=EAST)
    //Tile_X0Y2_Direction.EAST
        input [3:0] Tile_X0Y2_E1END, //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input [7:0] Tile_X0Y2_E2MID, //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [7:0] Tile_X0Y2_E2END, //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [15:0] Tile_X0Y2_EE4END, //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input [11:0] Tile_X0Y2_E6END, //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output [3:0] Tile_X0Y2_W1BEG, //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output [7:0] Tile_X0Y2_W2BEG, //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [7:0] Tile_X0Y2_W2BEGb, //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [15:0] Tile_X0Y2_WW4BEG, //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output [11:0] Tile_X0Y2_W6BEG, //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    //Tile_X1Y2_Direction.EAST
        output [3:0] Tile_X1Y2_E1BEG, //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
        output [7:0] Tile_X1Y2_E2BEG, //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [7:0] Tile_X1Y2_E2BEGb, //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [15:0] Tile_X1Y2_EE4BEG, //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
        output [11:0] Tile_X1Y2_E6BEG, //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
        input [3:0] Tile_X1Y2_W1END, //Port(Name=W1END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=4, Side=EAST)
        input [7:0] Tile_X1Y2_W2MID, //Port(Name=W2MID, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [7:0] Tile_X1Y2_W2END, //Port(Name=W2END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [15:0] Tile_X1Y2_WW4END, //Port(Name=WW4END, IO=INPUT, XOffset=-4, YOffset=0, WireCount=4, Side=EAST)
        input [11:0] Tile_X1Y2_W6END, //Port(Name=W6END, IO=INPUT, XOffset=-6, YOffset=0, WireCount=2, Side=EAST)
    //Tile_X0Y3_Direction.EAST
        input [3:0] Tile_X0Y3_E1END, //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input [7:0] Tile_X0Y3_E2MID, //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [7:0] Tile_X0Y3_E2END, //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [15:0] Tile_X0Y3_EE4END, //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input [11:0] Tile_X0Y3_E6END, //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output [3:0] Tile_X0Y3_W1BEG, //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output [7:0] Tile_X0Y3_W2BEG, //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [7:0] Tile_X0Y3_W2BEGb, //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [15:0] Tile_X0Y3_WW4BEG, //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output [11:0] Tile_X0Y3_W6BEG, //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    //Tile_X1Y3_Direction.EAST
        output [3:0] Tile_X1Y3_E1BEG, //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
        output [7:0] Tile_X1Y3_E2BEG, //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [7:0] Tile_X1Y3_E2BEGb, //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [15:0] Tile_X1Y3_EE4BEG, //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
        output [11:0] Tile_X1Y3_E6BEG, //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
        input [3:0] Tile_X1Y3_W1END, //Port(Name=W1END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=4, Side=EAST)
        input [7:0] Tile_X1Y3_W2MID, //Port(Name=W2MID, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [7:0] Tile_X1Y3_W2END, //Port(Name=W2END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [15:0] Tile_X1Y3_WW4END, //Port(Name=WW4END, IO=INPUT, XOffset=-4, YOffset=0, WireCount=4, Side=EAST)
        input [11:0] Tile_X1Y3_W6END, //Port(Name=W6END, IO=INPUT, XOffset=-6, YOffset=0, WireCount=2, Side=EAST)
    //Tile_X0Y4_Direction.EAST
        input [3:0] Tile_X0Y4_E1END, //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input [7:0] Tile_X0Y4_E2MID, //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [7:0] Tile_X0Y4_E2END, //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [15:0] Tile_X0Y4_EE4END, //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input [11:0] Tile_X0Y4_E6END, //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output [3:0] Tile_X0Y4_W1BEG, //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output [7:0] Tile_X0Y4_W2BEG, //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [7:0] Tile_X0Y4_W2BEGb, //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [15:0] Tile_X0Y4_WW4BEG, //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output [11:0] Tile_X0Y4_W6BEG, //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    //Tile_X1Y4_Direction.EAST
        output [3:0] Tile_X1Y4_E1BEG, //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
        output [7:0] Tile_X1Y4_E2BEG, //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [7:0] Tile_X1Y4_E2BEGb, //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [15:0] Tile_X1Y4_EE4BEG, //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
        output [11:0] Tile_X1Y4_E6BEG, //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
        input [3:0] Tile_X1Y4_W1END, //Port(Name=W1END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=4, Side=EAST)
        input [7:0] Tile_X1Y4_W2MID, //Port(Name=W2MID, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [7:0] Tile_X1Y4_W2END, //Port(Name=W2END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [15:0] Tile_X1Y4_WW4END, //Port(Name=WW4END, IO=INPUT, XOffset=-4, YOffset=0, WireCount=4, Side=EAST)
        input [11:0] Tile_X1Y4_W6END, //Port(Name=W6END, IO=INPUT, XOffset=-6, YOffset=0, WireCount=2, Side=EAST)
    //Tile_X0Y5_Direction.EAST
        input [3:0] Tile_X0Y5_E1END, //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input [7:0] Tile_X0Y5_E2MID, //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [7:0] Tile_X0Y5_E2END, //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [15:0] Tile_X0Y5_EE4END, //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input [11:0] Tile_X0Y5_E6END, //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output [3:0] Tile_X0Y5_W1BEG, //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output [7:0] Tile_X0Y5_W2BEG, //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [7:0] Tile_X0Y5_W2BEGb, //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [15:0] Tile_X0Y5_WW4BEG, //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output [11:0] Tile_X0Y5_W6BEG, //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    //Tile_X1Y5_Direction.EAST
        output [3:0] Tile_X1Y5_E1BEG, //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
        output [7:0] Tile_X1Y5_E2BEG, //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [7:0] Tile_X1Y5_E2BEGb, //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [15:0] Tile_X1Y5_EE4BEG, //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
        output [11:0] Tile_X1Y5_E6BEG, //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
        input [3:0] Tile_X1Y5_W1END, //Port(Name=W1END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=4, Side=EAST)
        input [7:0] Tile_X1Y5_W2MID, //Port(Name=W2MID, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [7:0] Tile_X1Y5_W2END, //Port(Name=W2END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [15:0] Tile_X1Y5_WW4END, //Port(Name=WW4END, IO=INPUT, XOffset=-4, YOffset=0, WireCount=4, Side=EAST)
        input [11:0] Tile_X1Y5_W6END, //Port(Name=W6END, IO=INPUT, XOffset=-6, YOffset=0, WireCount=2, Side=EAST)
    //Tile_X0Y6_Direction.NORTH
        input [47:0] Tile_X0Y6_END_o_6to0, //Port(Name=END_o_6to0, IO=INPUT, XOffset=0, YOffset=-6, WireCount=8, Side=SOUTH)
        output [47:0] Tile_X0Y6_BEG_i_0to6, //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
        input [3:0] Tile_X0Y6_N1END, //Port(Name=N1END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=4, Side=SOUTH)
        input [7:0] Tile_X0Y6_N2MID, //Port(Name=N2MID, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
        input [7:0] Tile_X0Y6_N2END, //Port(Name=N2END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
        input [15:0] Tile_X0Y6_N4END, //Port(Name=N4END, IO=INPUT, XOffset=0, YOffset=-4, WireCount=4, Side=SOUTH)
        input [15:0] Tile_X0Y6_NN4END, //Port(Name=NN4END, IO=INPUT, XOffset=0, YOffset=-4, WireCount=4, Side=SOUTH)
        output [3:0] Tile_X0Y6_S1BEG, //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
        output [7:0] Tile_X0Y6_S2BEG, //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
        output [7:0] Tile_X0Y6_S2BEGb, //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
        output [15:0] Tile_X0Y6_S4BEG, //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
        output [15:0] Tile_X0Y6_SS4BEG, //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    //Tile_X0Y6_Direction.EAST
        input [3:0] Tile_X0Y6_E1END, //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input [7:0] Tile_X0Y6_E2MID, //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [7:0] Tile_X0Y6_E2END, //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input [15:0] Tile_X0Y6_EE4END, //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input [11:0] Tile_X0Y6_E6END, //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output [3:0] Tile_X0Y6_W1BEG, //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output [7:0] Tile_X0Y6_W2BEG, //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [7:0] Tile_X0Y6_W2BEGb, //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output [15:0] Tile_X0Y6_WW4BEG, //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output [11:0] Tile_X0Y6_W6BEG, //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    //Tile_X1Y6_Direction.EAST
        output [3:0] Tile_X1Y6_E1BEG, //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
        output [7:0] Tile_X1Y6_E2BEG, //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [7:0] Tile_X1Y6_E2BEGb, //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
        output [15:0] Tile_X1Y6_EE4BEG, //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
        output [11:0] Tile_X1Y6_E6BEG, //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
        input [3:0] Tile_X1Y6_W1END, //Port(Name=W1END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=4, Side=EAST)
        input [7:0] Tile_X1Y6_W2MID, //Port(Name=W2MID, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [7:0] Tile_X1Y6_W2END, //Port(Name=W2END, IO=INPUT, XOffset=-1, YOffset=0, WireCount=8, Side=EAST)
        input [15:0] Tile_X1Y6_WW4END, //Port(Name=WW4END, IO=INPUT, XOffset=-4, YOffset=0, WireCount=4, Side=EAST)
        input [11:0] Tile_X1Y6_W6END, //Port(Name=W6END, IO=INPUT, XOffset=-6, YOffset=0, WireCount=2, Side=EAST)
    //Tile_X1Y6_Direction.NORTH
        input [3:0] Tile_X1Y6_N1END, //Port(Name=N1END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=4, Side=SOUTH)
        input [7:0] Tile_X1Y6_N2MID, //Port(Name=N2MID, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
        input [7:0] Tile_X1Y6_N2END, //Port(Name=N2END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
        input [15:0] Tile_X1Y6_N4END, //Port(Name=N4END, IO=INPUT, XOffset=0, YOffset=-4, WireCount=4, Side=SOUTH)
        input [15:0] Tile_X1Y6_NN4END, //Port(Name=NN4END, IO=INPUT, XOffset=0, YOffset=-4, WireCount=4, Side=SOUTH)
        output [3:0] Tile_X1Y6_S1BEG, //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
        output [7:0] Tile_X1Y6_S2BEG, //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
        output [7:0] Tile_X1Y6_S2BEGb, //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
        output [15:0] Tile_X1Y6_S4BEG, //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
        output [15:0] Tile_X1Y6_SS4BEG, //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    //Tile IO ports from BELs
        output [MaxFramesPerCol-1:0] Tile_X0Y0_FrameStrobe_O, //CONFIG_PORT
        input [FrameBitsPerRow-1:0] Tile_X0Y0_FrameData, //CONFIG_PORT
        output [MaxFramesPerCol-1:0] Tile_X1Y0_FrameStrobe_O, //CONFIG_PORT
        output [FrameBitsPerRow-1:0] Tile_X1Y0_FrameData_O, //CONFIG_PORT
        input [FrameBitsPerRow-1:0] Tile_X0Y1_FrameData, //CONFIG_PORT
        output [FrameBitsPerRow-1:0] Tile_X1Y1_FrameData_O, //CONFIG_PORT
        input [FrameBitsPerRow-1:0] Tile_X0Y2_FrameData, //CONFIG_PORT
        output [FrameBitsPerRow-1:0] Tile_X1Y2_FrameData_O, //CONFIG_PORT
        input [FrameBitsPerRow-1:0] Tile_X0Y3_FrameData, //CONFIG_PORT
        output [FrameBitsPerRow-1:0] Tile_X1Y3_FrameData_O, //CONFIG_PORT
        input [FrameBitsPerRow-1:0] Tile_X0Y4_FrameData, //CONFIG_PORT
        output [FrameBitsPerRow-1:0] Tile_X1Y4_FrameData_O, //CONFIG_PORT
        input [FrameBitsPerRow-1:0] Tile_X0Y5_FrameData, //CONFIG_PORT
        output [FrameBitsPerRow-1:0] Tile_X1Y5_FrameData_O, //CONFIG_PORT
        input [FrameBitsPerRow-1:0] Tile_X0Y6_FrameData, //CONFIG_PORT
        input [MaxFramesPerCol-1:0] Tile_X0Y6_FrameStrobe, //CONFIG_PORT
        input [MaxFramesPerCol-1:0] Tile_X1Y6_FrameStrobe, //CONFIG_PORT
        output [FrameBitsPerRow-1:0] Tile_X1Y6_FrameData_O, //CONFIG_PORT
        output Tile_X0Y0_UserCLKo,
        output Tile_X1Y0_UserCLKo,
        input Tile_X0Y6_UserCLK,
        input Tile_X1Y6_UserCLK
);

 //signal declarations
 //Tile_X0Y0_Direction.EAST
    wire[3:0] Tile_X0Y0_E1BEG; //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
    wire[7:0] Tile_X0Y0_E2BEG; //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[7:0] Tile_X0Y0_E2BEGb; //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[15:0] Tile_X0Y0_EE4BEG; //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
    wire[11:0] Tile_X0Y0_E6BEG; //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
 //Tile_X0Y0_Direction.NORTH
    wire[47:0] Tile_X0Y0_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X0Y0_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X0Y0_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X0Y0_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X0Y0_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X0Y0_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y0_Direction.NORTH
    wire[47:0] Tile_X1Y0_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X1Y0_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X1Y0_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X1Y0_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X1Y0_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X1Y0_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y0_Direction.EAST
    wire[3:0] Tile_X1Y0_W1BEG; //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
    wire[7:0] Tile_X1Y0_W2BEG; //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[7:0] Tile_X1Y0_W2BEGb; //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[15:0] Tile_X1Y0_WW4BEG; //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
    wire[11:0] Tile_X1Y0_W6BEG; //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
 //Tile_X0Y1_Direction.NORTH
    wire[47:0] Tile_X0Y1_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X0Y1_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X0Y1_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X0Y1_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X0Y1_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X0Y1_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X0Y1_Direction.EAST
    wire[3:0] Tile_X0Y1_E1BEG; //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
    wire[7:0] Tile_X0Y1_E2BEG; //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[7:0] Tile_X0Y1_E2BEGb; //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[15:0] Tile_X0Y1_EE4BEG; //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
    wire[11:0] Tile_X0Y1_E6BEG; //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
 //Tile_X0Y1_Direction.NORTH
    wire[47:0] Tile_X0Y1_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X0Y1_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X0Y1_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X0Y1_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X0Y1_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X0Y1_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y1_Direction.NORTH
    wire[47:0] Tile_X1Y1_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X1Y1_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X1Y1_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X1Y1_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X1Y1_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X1Y1_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X1Y1_Direction.NORTH
    wire[47:0] Tile_X1Y1_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X1Y1_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X1Y1_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X1Y1_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X1Y1_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X1Y1_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y1_Direction.EAST
    wire[3:0] Tile_X1Y1_W1BEG; //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
    wire[7:0] Tile_X1Y1_W2BEG; //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[7:0] Tile_X1Y1_W2BEGb; //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[15:0] Tile_X1Y1_WW4BEG; //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
    wire[11:0] Tile_X1Y1_W6BEG; //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
 //Tile_X0Y2_Direction.NORTH
    wire[47:0] Tile_X0Y2_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X0Y2_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X0Y2_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X0Y2_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X0Y2_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X0Y2_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X0Y2_Direction.EAST
    wire[3:0] Tile_X0Y2_E1BEG; //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
    wire[7:0] Tile_X0Y2_E2BEG; //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[7:0] Tile_X0Y2_E2BEGb; //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[15:0] Tile_X0Y2_EE4BEG; //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
    wire[11:0] Tile_X0Y2_E6BEG; //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
 //Tile_X0Y2_Direction.NORTH
    wire[47:0] Tile_X0Y2_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X0Y2_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X0Y2_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X0Y2_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X0Y2_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X0Y2_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y2_Direction.NORTH
    wire[47:0] Tile_X1Y2_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X1Y2_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X1Y2_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X1Y2_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X1Y2_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X1Y2_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X1Y2_Direction.NORTH
    wire[47:0] Tile_X1Y2_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X1Y2_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X1Y2_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X1Y2_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X1Y2_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X1Y2_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y2_Direction.EAST
    wire[3:0] Tile_X1Y2_W1BEG; //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
    wire[7:0] Tile_X1Y2_W2BEG; //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[7:0] Tile_X1Y2_W2BEGb; //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[15:0] Tile_X1Y2_WW4BEG; //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
    wire[11:0] Tile_X1Y2_W6BEG; //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
 //Tile_X0Y3_Direction.NORTH
    wire[47:0] Tile_X0Y3_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X0Y3_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X0Y3_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X0Y3_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X0Y3_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X0Y3_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X0Y3_Direction.EAST
    wire[3:0] Tile_X0Y3_E1BEG; //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
    wire[7:0] Tile_X0Y3_E2BEG; //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[7:0] Tile_X0Y3_E2BEGb; //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[15:0] Tile_X0Y3_EE4BEG; //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
    wire[11:0] Tile_X0Y3_E6BEG; //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
 //Tile_X0Y3_Direction.NORTH
    wire[47:0] Tile_X0Y3_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X0Y3_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X0Y3_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X0Y3_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X0Y3_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X0Y3_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y3_Direction.NORTH
    wire[47:0] Tile_X1Y3_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X1Y3_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X1Y3_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X1Y3_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X1Y3_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X1Y3_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X1Y3_Direction.NORTH
    wire[47:0] Tile_X1Y3_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X1Y3_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X1Y3_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X1Y3_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X1Y3_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X1Y3_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y3_Direction.EAST
    wire[3:0] Tile_X1Y3_W1BEG; //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
    wire[7:0] Tile_X1Y3_W2BEG; //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[7:0] Tile_X1Y3_W2BEGb; //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[15:0] Tile_X1Y3_WW4BEG; //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
    wire[11:0] Tile_X1Y3_W6BEG; //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
 //Tile_X0Y4_Direction.NORTH
    wire[47:0] Tile_X0Y4_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X0Y4_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X0Y4_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X0Y4_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X0Y4_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X0Y4_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X0Y4_Direction.EAST
    wire[3:0] Tile_X0Y4_E1BEG; //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
    wire[7:0] Tile_X0Y4_E2BEG; //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[7:0] Tile_X0Y4_E2BEGb; //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[15:0] Tile_X0Y4_EE4BEG; //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
    wire[11:0] Tile_X0Y4_E6BEG; //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
 //Tile_X0Y4_Direction.NORTH
    wire[47:0] Tile_X0Y4_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X0Y4_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X0Y4_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X0Y4_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X0Y4_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X0Y4_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y4_Direction.NORTH
    wire[47:0] Tile_X1Y4_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X1Y4_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X1Y4_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X1Y4_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X1Y4_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X1Y4_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X1Y4_Direction.NORTH
    wire[47:0] Tile_X1Y4_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X1Y4_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X1Y4_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X1Y4_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X1Y4_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X1Y4_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y4_Direction.EAST
    wire[3:0] Tile_X1Y4_W1BEG; //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
    wire[7:0] Tile_X1Y4_W2BEG; //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[7:0] Tile_X1Y4_W2BEGb; //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[15:0] Tile_X1Y4_WW4BEG; //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
    wire[11:0] Tile_X1Y4_W6BEG; //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
 //Tile_X0Y5_Direction.NORTH
    wire[47:0] Tile_X0Y5_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X0Y5_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X0Y5_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X0Y5_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X0Y5_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X0Y5_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X0Y5_Direction.EAST
    wire[3:0] Tile_X0Y5_E1BEG; //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
    wire[7:0] Tile_X0Y5_E2BEG; //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[7:0] Tile_X0Y5_E2BEGb; //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[15:0] Tile_X0Y5_EE4BEG; //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
    wire[11:0] Tile_X0Y5_E6BEG; //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
 //Tile_X0Y5_Direction.NORTH
    wire[47:0] Tile_X0Y5_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X0Y5_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X0Y5_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X0Y5_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X0Y5_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X0Y5_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y5_Direction.NORTH
    wire[47:0] Tile_X1Y5_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X1Y5_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X1Y5_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X1Y5_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X1Y5_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X1Y5_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X1Y5_Direction.NORTH
    wire[47:0] Tile_X1Y5_BEG_i_0to6; //Port(Name=BEG_i_0to6, IO=OUTPUT, XOffset=0, YOffset=6, WireCount=8, Side=SOUTH)
    wire[3:0] Tile_X1Y5_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X1Y5_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X1Y5_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X1Y5_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[15:0] Tile_X1Y5_SS4BEG; //Port(Name=SS4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
 //Tile_X1Y5_Direction.EAST
    wire[3:0] Tile_X1Y5_W1BEG; //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
    wire[7:0] Tile_X1Y5_W2BEG; //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[7:0] Tile_X1Y5_W2BEGb; //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[15:0] Tile_X1Y5_WW4BEG; //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
    wire[11:0] Tile_X1Y5_W6BEG; //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
 //Tile_X0Y6_Direction.NORTH
    wire[47:0] Tile_X0Y6_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X0Y6_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X0Y6_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X0Y6_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X0Y6_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X0Y6_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X0Y6_Direction.EAST
    wire[55:0] Tile_X0Y6_o_e2w; //Port(Name=o_e2w, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=56, Side=EAST)
    wire[3:0] Tile_X0Y6_E1BEG; //Port(Name=E1BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=4, Side=EAST)
    wire[7:0] Tile_X0Y6_E2BEG; //Port(Name=E2BEG, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[7:0] Tile_X0Y6_E2BEGb; //Port(Name=E2BEGb, IO=OUTPUT, XOffset=1, YOffset=0, WireCount=8, Side=EAST)
    wire[15:0] Tile_X0Y6_EE4BEG; //Port(Name=EE4BEG, IO=OUTPUT, XOffset=4, YOffset=0, WireCount=4, Side=EAST)
    wire[11:0] Tile_X0Y6_E6BEG; //Port(Name=E6BEG, IO=OUTPUT, XOffset=6, YOffset=0, WireCount=2, Side=EAST)
 //Tile_X1Y6_Direction.NORTH
    wire[47:0] Tile_X1Y6_BEG_o_6to0; //Port(Name=BEG_o_6to0, IO=OUTPUT, XOffset=0, YOffset=-6, WireCount=8, Side=NORTH)
    wire[3:0] Tile_X1Y6_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X1Y6_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X1Y6_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X1Y6_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X1Y6_NN4BEG; //Port(Name=NN4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
 //Tile_X1Y6_Direction.EAST
    wire[55:0] Tile_X1Y6_i_w2e; //Port(Name=i_w2e, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=56, Side=WEST)
    wire[3:0] Tile_X1Y6_W1BEG; //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
    wire[7:0] Tile_X1Y6_W2BEG; //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[7:0] Tile_X1Y6_W2BEGb; //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
    wire[15:0] Tile_X1Y6_WW4BEG; //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
    wire[11:0] Tile_X1Y6_W6BEG; //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    wire[FrameBitsPerRow-1:0] Tile_X1Y0_FrameData_O;
    wire[MaxFramesPerCol-1:0] Tile_X0Y1_FrameStrobe_O;
    wire Tile_X0Y1_UserCLKo;
    wire[MaxFramesPerCol-1:0] Tile_X1Y1_FrameStrobe_O;
    wire Tile_X1Y1_UserCLKo;
    wire[FrameBitsPerRow-1:0] Tile_X1Y1_FrameData_O;
    wire[MaxFramesPerCol-1:0] Tile_X0Y2_FrameStrobe_O;
    wire Tile_X0Y2_UserCLKo;
    wire[MaxFramesPerCol-1:0] Tile_X1Y2_FrameStrobe_O;
    wire Tile_X1Y2_UserCLKo;
    wire[FrameBitsPerRow-1:0] Tile_X1Y2_FrameData_O;
    wire[MaxFramesPerCol-1:0] Tile_X0Y3_FrameStrobe_O;
    wire Tile_X0Y3_UserCLKo;
    wire[MaxFramesPerCol-1:0] Tile_X1Y3_FrameStrobe_O;
    wire Tile_X1Y3_UserCLKo;
    wire[FrameBitsPerRow-1:0] Tile_X1Y3_FrameData_O;
    wire[MaxFramesPerCol-1:0] Tile_X0Y4_FrameStrobe_O;
    wire Tile_X0Y4_UserCLKo;
    wire[MaxFramesPerCol-1:0] Tile_X1Y4_FrameStrobe_O;
    wire Tile_X1Y4_UserCLKo;
    wire[FrameBitsPerRow-1:0] Tile_X1Y4_FrameData_O;
    wire[MaxFramesPerCol-1:0] Tile_X0Y5_FrameStrobe_O;
    wire Tile_X0Y5_UserCLKo;
    wire[MaxFramesPerCol-1:0] Tile_X1Y5_FrameStrobe_O;
    wire Tile_X1Y5_UserCLKo;
    wire[FrameBitsPerRow-1:0] Tile_X1Y5_FrameData_O;
    wire[MaxFramesPerCol-1:0] Tile_X0Y6_FrameStrobe_O;
    wire Tile_X0Y6_UserCLKo;
    wire[MaxFramesPerCol-1:0] Tile_X1Y6_FrameStrobe_O;
    wire Tile_X1Y6_UserCLKo;
    wire[FrameBitsPerRow-1:0] Tile_X1Y6_FrameData_O;

SCC0
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y0_Emulate_Bitstream)
    )
`endif
    Tile_X0Y0_SCC0
    (
    .END_o_6to0(Tile_X0Y1_BEG_o_6to0),
    .N1END(Tile_X0Y1_N1BEG),
    .N2MID(Tile_X0Y1_N2BEG),
    .N2END(Tile_X0Y1_N2BEGb),
    .N4END(Tile_X0Y1_N4BEG),
    .NN4END(Tile_X0Y1_NN4BEG),
    .E1END(Tile_X0Y0_E1END),
    .E2MID(Tile_X0Y0_E2MID),
    .E2END(Tile_X0Y0_E2END),
    .EE4END(Tile_X0Y0_EE4END),
    .E6END(Tile_X0Y0_E6END),
    .S1END(Tile_X0Y0_S1END),
    .S2MID(Tile_X0Y0_S2MID),
    .S2END(Tile_X0Y0_S2END),
    .S4END(Tile_X0Y0_S4END),
    .SS4END(Tile_X0Y0_SS4END),
    .W1END(Tile_X1Y0_W1BEG),
    .W2MID(Tile_X1Y0_W2BEG),
    .W2END(Tile_X1Y0_W2BEGb),
    .WW4END(Tile_X1Y0_WW4BEG),
    .W6END(Tile_X1Y0_W6BEG),
    .N1BEG(Tile_X0Y0_N1BEG),
    .N2BEG(Tile_X0Y0_N2BEG),
    .N2BEGb(Tile_X0Y0_N2BEGb),
    .N4BEG(Tile_X0Y0_N4BEG),
    .NN4BEG(Tile_X0Y0_NN4BEG),
    .E1BEG(Tile_X0Y0_E1BEG),
    .E2BEG(Tile_X0Y0_E2BEG),
    .E2BEGb(Tile_X0Y0_E2BEGb),
    .EE4BEG(Tile_X0Y0_EE4BEG),
    .E6BEG(Tile_X0Y0_E6BEG),
    .BEG_i_0to6(Tile_X0Y0_BEG_i_0to6),
    .S1BEG(Tile_X0Y0_S1BEG),
    .S2BEG(Tile_X0Y0_S2BEG),
    .S2BEGb(Tile_X0Y0_S2BEGb),
    .S4BEG(Tile_X0Y0_S4BEG),
    .SS4BEG(Tile_X0Y0_SS4BEG),
    .W1BEG(Tile_X0Y0_W1BEG),
    .W2BEG(Tile_X0Y0_W2BEG),
    .W2BEGb(Tile_X0Y0_W2BEGb),
    .WW4BEG(Tile_X0Y0_WW4BEG),
    .W6BEG(Tile_X0Y0_W6BEG),
    .UserCLK(Tile_X0Y1_UserCLKo),
    .UserCLKo(Tile_X0Y0_UserCLKo),
    .FrameData(Tile_X0Y0_FrameData),
    .FrameData_O(Tile_X0Y0_FrameData_O),
    .FrameStrobe(Tile_X0Y1_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y0_FrameStrobe_O)
);

SCC0_e
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X1Y0_Emulate_Bitstream)
    )
`endif
    Tile_X1Y0_SCC0_e
    (
    .END_o_6to0(Tile_X1Y1_BEG_o_6to0),
    .N1END(Tile_X1Y1_N1BEG),
    .N2MID(Tile_X1Y1_N2BEG),
    .N2END(Tile_X1Y1_N2BEGb),
    .N4END(Tile_X1Y1_N4BEG),
    .NN4END(Tile_X1Y1_NN4BEG),
    .E1END(Tile_X0Y0_E1BEG),
    .E2MID(Tile_X0Y0_E2BEG),
    .E2END(Tile_X0Y0_E2BEGb),
    .EE4END(Tile_X0Y0_EE4BEG),
    .E6END(Tile_X0Y0_E6BEG),
    .S1END(Tile_X1Y0_S1END),
    .S2MID(Tile_X1Y0_S2MID),
    .S2END(Tile_X1Y0_S2END),
    .S4END(Tile_X1Y0_S4END),
    .SS4END(Tile_X1Y0_SS4END),
    .W1END(Tile_X1Y0_W1END),
    .W2MID(Tile_X1Y0_W2MID),
    .W2END(Tile_X1Y0_W2END),
    .WW4END(Tile_X1Y0_WW4END),
    .W6END(Tile_X1Y0_W6END),
    .N1BEG(Tile_X1Y0_N1BEG),
    .N2BEG(Tile_X1Y0_N2BEG),
    .N2BEGb(Tile_X1Y0_N2BEGb),
    .N4BEG(Tile_X1Y0_N4BEG),
    .NN4BEG(Tile_X1Y0_NN4BEG),
    .E1BEG(Tile_X1Y0_E1BEG),
    .E2BEG(Tile_X1Y0_E2BEG),
    .E2BEGb(Tile_X1Y0_E2BEGb),
    .EE4BEG(Tile_X1Y0_EE4BEG),
    .E6BEG(Tile_X1Y0_E6BEG),
    .BEG_i_0to6(Tile_X1Y0_BEG_i_0to6),
    .S1BEG(Tile_X1Y0_S1BEG),
    .S2BEG(Tile_X1Y0_S2BEG),
    .S2BEGb(Tile_X1Y0_S2BEGb),
    .S4BEG(Tile_X1Y0_S4BEG),
    .SS4BEG(Tile_X1Y0_SS4BEG),
    .W1BEG(Tile_X1Y0_W1BEG),
    .W2BEG(Tile_X1Y0_W2BEG),
    .W2BEGb(Tile_X1Y0_W2BEGb),
    .WW4BEG(Tile_X1Y0_WW4BEG),
    .W6BEG(Tile_X1Y0_W6BEG),
    .UserCLK(Tile_X1Y1_UserCLKo),
    .UserCLKo(Tile_X1Y0_UserCLKo),
    .FrameData(Tile_X0Y0_FrameData_O),
    .FrameData_O(Tile_X1Y0_FrameData_O),
    .FrameStrobe(Tile_X1Y1_FrameStrobe_O),
    .FrameStrobe_O(Tile_X1Y0_FrameStrobe_O)
);

SCC1
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y1_Emulate_Bitstream)
    )
`endif
    Tile_X0Y1_SCC1
    (
    .END_o_6to0(Tile_X0Y2_BEG_o_6to0),
    .N1END(Tile_X0Y2_N1BEG),
    .N2MID(Tile_X0Y2_N2BEG),
    .N2END(Tile_X0Y2_N2BEGb),
    .N4END(Tile_X0Y2_N4BEG),
    .NN4END(Tile_X0Y2_NN4BEG),
    .E1END(Tile_X0Y1_E1END),
    .E2MID(Tile_X0Y1_E2MID),
    .E2END(Tile_X0Y1_E2END),
    .EE4END(Tile_X0Y1_EE4END),
    .E6END(Tile_X0Y1_E6END),
    .END_i_0to6(Tile_X0Y0_BEG_i_0to6),
    .S1END(Tile_X0Y0_S1BEG),
    .S2MID(Tile_X0Y0_S2BEG),
    .S2END(Tile_X0Y0_S2BEGb),
    .S4END(Tile_X0Y0_S4BEG),
    .SS4END(Tile_X0Y0_SS4BEG),
    .W1END(Tile_X1Y1_W1BEG),
    .W2MID(Tile_X1Y1_W2BEG),
    .W2END(Tile_X1Y1_W2BEGb),
    .WW4END(Tile_X1Y1_WW4BEG),
    .W6END(Tile_X1Y1_W6BEG),
    .BEG_o_6to0(Tile_X0Y1_BEG_o_6to0),
    .N1BEG(Tile_X0Y1_N1BEG),
    .N2BEG(Tile_X0Y1_N2BEG),
    .N2BEGb(Tile_X0Y1_N2BEGb),
    .N4BEG(Tile_X0Y1_N4BEG),
    .NN4BEG(Tile_X0Y1_NN4BEG),
    .E1BEG(Tile_X0Y1_E1BEG),
    .E2BEG(Tile_X0Y1_E2BEG),
    .E2BEGb(Tile_X0Y1_E2BEGb),
    .EE4BEG(Tile_X0Y1_EE4BEG),
    .E6BEG(Tile_X0Y1_E6BEG),
    .BEG_i_0to6(Tile_X0Y1_BEG_i_0to6),
    .S1BEG(Tile_X0Y1_S1BEG),
    .S2BEG(Tile_X0Y1_S2BEG),
    .S2BEGb(Tile_X0Y1_S2BEGb),
    .S4BEG(Tile_X0Y1_S4BEG),
    .SS4BEG(Tile_X0Y1_SS4BEG),
    .W1BEG(Tile_X0Y1_W1BEG),
    .W2BEG(Tile_X0Y1_W2BEG),
    .W2BEGb(Tile_X0Y1_W2BEGb),
    .WW4BEG(Tile_X0Y1_WW4BEG),
    .W6BEG(Tile_X0Y1_W6BEG),
    .UserCLK(Tile_X0Y2_UserCLKo),
    .UserCLKo(Tile_X0Y1_UserCLKo),
    .FrameData(Tile_X0Y1_FrameData),
    .FrameData_O(Tile_X0Y1_FrameData_O),
    .FrameStrobe(Tile_X0Y2_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y1_FrameStrobe_O)
);

SCC1_e
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X1Y1_Emulate_Bitstream)
    )
`endif
    Tile_X1Y1_SCC1_e
    (
    .END_o_6to0(Tile_X1Y2_BEG_o_6to0),
    .N1END(Tile_X1Y2_N1BEG),
    .N2MID(Tile_X1Y2_N2BEG),
    .N2END(Tile_X1Y2_N2BEGb),
    .N4END(Tile_X1Y2_N4BEG),
    .NN4END(Tile_X1Y2_NN4BEG),
    .E1END(Tile_X0Y1_E1BEG),
    .E2MID(Tile_X0Y1_E2BEG),
    .E2END(Tile_X0Y1_E2BEGb),
    .EE4END(Tile_X0Y1_EE4BEG),
    .E6END(Tile_X0Y1_E6BEG),
    .END_i_0to6(Tile_X1Y0_BEG_i_0to6),
    .S1END(Tile_X1Y0_S1BEG),
    .S2MID(Tile_X1Y0_S2BEG),
    .S2END(Tile_X1Y0_S2BEGb),
    .S4END(Tile_X1Y0_S4BEG),
    .SS4END(Tile_X1Y0_SS4BEG),
    .W1END(Tile_X1Y1_W1END),
    .W2MID(Tile_X1Y1_W2MID),
    .W2END(Tile_X1Y1_W2END),
    .WW4END(Tile_X1Y1_WW4END),
    .W6END(Tile_X1Y1_W6END),
    .BEG_o_6to0(Tile_X1Y1_BEG_o_6to0),
    .N1BEG(Tile_X1Y1_N1BEG),
    .N2BEG(Tile_X1Y1_N2BEG),
    .N2BEGb(Tile_X1Y1_N2BEGb),
    .N4BEG(Tile_X1Y1_N4BEG),
    .NN4BEG(Tile_X1Y1_NN4BEG),
    .E1BEG(Tile_X1Y1_E1BEG),
    .E2BEG(Tile_X1Y1_E2BEG),
    .E2BEGb(Tile_X1Y1_E2BEGb),
    .EE4BEG(Tile_X1Y1_EE4BEG),
    .E6BEG(Tile_X1Y1_E6BEG),
    .BEG_i_0to6(Tile_X1Y1_BEG_i_0to6),
    .S1BEG(Tile_X1Y1_S1BEG),
    .S2BEG(Tile_X1Y1_S2BEG),
    .S2BEGb(Tile_X1Y1_S2BEGb),
    .S4BEG(Tile_X1Y1_S4BEG),
    .SS4BEG(Tile_X1Y1_SS4BEG),
    .W1BEG(Tile_X1Y1_W1BEG),
    .W2BEG(Tile_X1Y1_W2BEG),
    .W2BEGb(Tile_X1Y1_W2BEGb),
    .WW4BEG(Tile_X1Y1_WW4BEG),
    .W6BEG(Tile_X1Y1_W6BEG),
    .UserCLK(Tile_X1Y2_UserCLKo),
    .UserCLKo(Tile_X1Y1_UserCLKo),
    .FrameData(Tile_X0Y1_FrameData_O),
    .FrameData_O(Tile_X1Y1_FrameData_O),
    .FrameStrobe(Tile_X1Y2_FrameStrobe_O),
    .FrameStrobe_O(Tile_X1Y1_FrameStrobe_O)
);

SCC2
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y2_Emulate_Bitstream)
    )
`endif
    Tile_X0Y2_SCC2
    (
    .END_o_6to0(Tile_X0Y3_BEG_o_6to0),
    .N1END(Tile_X0Y3_N1BEG),
    .N2MID(Tile_X0Y3_N2BEG),
    .N2END(Tile_X0Y3_N2BEGb),
    .N4END(Tile_X0Y3_N4BEG),
    .NN4END(Tile_X0Y3_NN4BEG),
    .E1END(Tile_X0Y2_E1END),
    .E2MID(Tile_X0Y2_E2MID),
    .E2END(Tile_X0Y2_E2END),
    .EE4END(Tile_X0Y2_EE4END),
    .E6END(Tile_X0Y2_E6END),
    .END_i_0to6(Tile_X0Y1_BEG_i_0to6),
    .S1END(Tile_X0Y1_S1BEG),
    .S2MID(Tile_X0Y1_S2BEG),
    .S2END(Tile_X0Y1_S2BEGb),
    .S4END(Tile_X0Y1_S4BEG),
    .SS4END(Tile_X0Y1_SS4BEG),
    .W1END(Tile_X1Y2_W1BEG),
    .W2MID(Tile_X1Y2_W2BEG),
    .W2END(Tile_X1Y2_W2BEGb),
    .WW4END(Tile_X1Y2_WW4BEG),
    .W6END(Tile_X1Y2_W6BEG),
    .BEG_o_6to0(Tile_X0Y2_BEG_o_6to0),
    .N1BEG(Tile_X0Y2_N1BEG),
    .N2BEG(Tile_X0Y2_N2BEG),
    .N2BEGb(Tile_X0Y2_N2BEGb),
    .N4BEG(Tile_X0Y2_N4BEG),
    .NN4BEG(Tile_X0Y2_NN4BEG),
    .E1BEG(Tile_X0Y2_E1BEG),
    .E2BEG(Tile_X0Y2_E2BEG),
    .E2BEGb(Tile_X0Y2_E2BEGb),
    .EE4BEG(Tile_X0Y2_EE4BEG),
    .E6BEG(Tile_X0Y2_E6BEG),
    .BEG_i_0to6(Tile_X0Y2_BEG_i_0to6),
    .S1BEG(Tile_X0Y2_S1BEG),
    .S2BEG(Tile_X0Y2_S2BEG),
    .S2BEGb(Tile_X0Y2_S2BEGb),
    .S4BEG(Tile_X0Y2_S4BEG),
    .SS4BEG(Tile_X0Y2_SS4BEG),
    .W1BEG(Tile_X0Y2_W1BEG),
    .W2BEG(Tile_X0Y2_W2BEG),
    .W2BEGb(Tile_X0Y2_W2BEGb),
    .WW4BEG(Tile_X0Y2_WW4BEG),
    .W6BEG(Tile_X0Y2_W6BEG),
    .UserCLK(Tile_X0Y3_UserCLKo),
    .UserCLKo(Tile_X0Y2_UserCLKo),
    .FrameData(Tile_X0Y2_FrameData),
    .FrameData_O(Tile_X0Y2_FrameData_O),
    .FrameStrobe(Tile_X0Y3_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y2_FrameStrobe_O)
);

SCC2_e
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X1Y2_Emulate_Bitstream)
    )
`endif
    Tile_X1Y2_SCC2_e
    (
    .END_o_6to0(Tile_X1Y3_BEG_o_6to0),
    .N1END(Tile_X1Y3_N1BEG),
    .N2MID(Tile_X1Y3_N2BEG),
    .N2END(Tile_X1Y3_N2BEGb),
    .N4END(Tile_X1Y3_N4BEG),
    .NN4END(Tile_X1Y3_NN4BEG),
    .E1END(Tile_X0Y2_E1BEG),
    .E2MID(Tile_X0Y2_E2BEG),
    .E2END(Tile_X0Y2_E2BEGb),
    .EE4END(Tile_X0Y2_EE4BEG),
    .E6END(Tile_X0Y2_E6BEG),
    .END_i_0to6(Tile_X1Y1_BEG_i_0to6),
    .S1END(Tile_X1Y1_S1BEG),
    .S2MID(Tile_X1Y1_S2BEG),
    .S2END(Tile_X1Y1_S2BEGb),
    .S4END(Tile_X1Y1_S4BEG),
    .SS4END(Tile_X1Y1_SS4BEG),
    .W1END(Tile_X1Y2_W1END),
    .W2MID(Tile_X1Y2_W2MID),
    .W2END(Tile_X1Y2_W2END),
    .WW4END(Tile_X1Y2_WW4END),
    .W6END(Tile_X1Y2_W6END),
    .BEG_o_6to0(Tile_X1Y2_BEG_o_6to0),
    .N1BEG(Tile_X1Y2_N1BEG),
    .N2BEG(Tile_X1Y2_N2BEG),
    .N2BEGb(Tile_X1Y2_N2BEGb),
    .N4BEG(Tile_X1Y2_N4BEG),
    .NN4BEG(Tile_X1Y2_NN4BEG),
    .E1BEG(Tile_X1Y2_E1BEG),
    .E2BEG(Tile_X1Y2_E2BEG),
    .E2BEGb(Tile_X1Y2_E2BEGb),
    .EE4BEG(Tile_X1Y2_EE4BEG),
    .E6BEG(Tile_X1Y2_E6BEG),
    .BEG_i_0to6(Tile_X1Y2_BEG_i_0to6),
    .S1BEG(Tile_X1Y2_S1BEG),
    .S2BEG(Tile_X1Y2_S2BEG),
    .S2BEGb(Tile_X1Y2_S2BEGb),
    .S4BEG(Tile_X1Y2_S4BEG),
    .SS4BEG(Tile_X1Y2_SS4BEG),
    .W1BEG(Tile_X1Y2_W1BEG),
    .W2BEG(Tile_X1Y2_W2BEG),
    .W2BEGb(Tile_X1Y2_W2BEGb),
    .WW4BEG(Tile_X1Y2_WW4BEG),
    .W6BEG(Tile_X1Y2_W6BEG),
    .UserCLK(Tile_X1Y3_UserCLKo),
    .UserCLKo(Tile_X1Y2_UserCLKo),
    .FrameData(Tile_X0Y2_FrameData_O),
    .FrameData_O(Tile_X1Y2_FrameData_O),
    .FrameStrobe(Tile_X1Y3_FrameStrobe_O),
    .FrameStrobe_O(Tile_X1Y2_FrameStrobe_O)
);

SCC3
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y3_Emulate_Bitstream)
    )
`endif
    Tile_X0Y3_SCC3
    (
    .END_o_6to0(Tile_X0Y4_BEG_o_6to0),
    .N1END(Tile_X0Y4_N1BEG),
    .N2MID(Tile_X0Y4_N2BEG),
    .N2END(Tile_X0Y4_N2BEGb),
    .N4END(Tile_X0Y4_N4BEG),
    .NN4END(Tile_X0Y4_NN4BEG),
    .E1END(Tile_X0Y3_E1END),
    .E2MID(Tile_X0Y3_E2MID),
    .E2END(Tile_X0Y3_E2END),
    .EE4END(Tile_X0Y3_EE4END),
    .E6END(Tile_X0Y3_E6END),
    .END_i_0to6(Tile_X0Y2_BEG_i_0to6),
    .S1END(Tile_X0Y2_S1BEG),
    .S2MID(Tile_X0Y2_S2BEG),
    .S2END(Tile_X0Y2_S2BEGb),
    .S4END(Tile_X0Y2_S4BEG),
    .SS4END(Tile_X0Y2_SS4BEG),
    .W1END(Tile_X1Y3_W1BEG),
    .W2MID(Tile_X1Y3_W2BEG),
    .W2END(Tile_X1Y3_W2BEGb),
    .WW4END(Tile_X1Y3_WW4BEG),
    .W6END(Tile_X1Y3_W6BEG),
    .BEG_o_6to0(Tile_X0Y3_BEG_o_6to0),
    .N1BEG(Tile_X0Y3_N1BEG),
    .N2BEG(Tile_X0Y3_N2BEG),
    .N2BEGb(Tile_X0Y3_N2BEGb),
    .N4BEG(Tile_X0Y3_N4BEG),
    .NN4BEG(Tile_X0Y3_NN4BEG),
    .E1BEG(Tile_X0Y3_E1BEG),
    .E2BEG(Tile_X0Y3_E2BEG),
    .E2BEGb(Tile_X0Y3_E2BEGb),
    .EE4BEG(Tile_X0Y3_EE4BEG),
    .E6BEG(Tile_X0Y3_E6BEG),
    .BEG_i_0to6(Tile_X0Y3_BEG_i_0to6),
    .S1BEG(Tile_X0Y3_S1BEG),
    .S2BEG(Tile_X0Y3_S2BEG),
    .S2BEGb(Tile_X0Y3_S2BEGb),
    .S4BEG(Tile_X0Y3_S4BEG),
    .SS4BEG(Tile_X0Y3_SS4BEG),
    .W1BEG(Tile_X0Y3_W1BEG),
    .W2BEG(Tile_X0Y3_W2BEG),
    .W2BEGb(Tile_X0Y3_W2BEGb),
    .WW4BEG(Tile_X0Y3_WW4BEG),
    .W6BEG(Tile_X0Y3_W6BEG),
    .UserCLK(Tile_X0Y4_UserCLKo),
    .UserCLKo(Tile_X0Y3_UserCLKo),
    .FrameData(Tile_X0Y3_FrameData),
    .FrameData_O(Tile_X0Y3_FrameData_O),
    .FrameStrobe(Tile_X0Y4_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y3_FrameStrobe_O)
);

SCC3_e
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X1Y3_Emulate_Bitstream)
    )
`endif
    Tile_X1Y3_SCC3_e
    (
    .END_o_6to0(Tile_X1Y4_BEG_o_6to0),
    .N1END(Tile_X1Y4_N1BEG),
    .N2MID(Tile_X1Y4_N2BEG),
    .N2END(Tile_X1Y4_N2BEGb),
    .N4END(Tile_X1Y4_N4BEG),
    .NN4END(Tile_X1Y4_NN4BEG),
    .E1END(Tile_X0Y3_E1BEG),
    .E2MID(Tile_X0Y3_E2BEG),
    .E2END(Tile_X0Y3_E2BEGb),
    .EE4END(Tile_X0Y3_EE4BEG),
    .E6END(Tile_X0Y3_E6BEG),
    .END_i_0to6(Tile_X1Y2_BEG_i_0to6),
    .S1END(Tile_X1Y2_S1BEG),
    .S2MID(Tile_X1Y2_S2BEG),
    .S2END(Tile_X1Y2_S2BEGb),
    .S4END(Tile_X1Y2_S4BEG),
    .SS4END(Tile_X1Y2_SS4BEG),
    .W1END(Tile_X1Y3_W1END),
    .W2MID(Tile_X1Y3_W2MID),
    .W2END(Tile_X1Y3_W2END),
    .WW4END(Tile_X1Y3_WW4END),
    .W6END(Tile_X1Y3_W6END),
    .BEG_o_6to0(Tile_X1Y3_BEG_o_6to0),
    .N1BEG(Tile_X1Y3_N1BEG),
    .N2BEG(Tile_X1Y3_N2BEG),
    .N2BEGb(Tile_X1Y3_N2BEGb),
    .N4BEG(Tile_X1Y3_N4BEG),
    .NN4BEG(Tile_X1Y3_NN4BEG),
    .E1BEG(Tile_X1Y3_E1BEG),
    .E2BEG(Tile_X1Y3_E2BEG),
    .E2BEGb(Tile_X1Y3_E2BEGb),
    .EE4BEG(Tile_X1Y3_EE4BEG),
    .E6BEG(Tile_X1Y3_E6BEG),
    .BEG_i_0to6(Tile_X1Y3_BEG_i_0to6),
    .S1BEG(Tile_X1Y3_S1BEG),
    .S2BEG(Tile_X1Y3_S2BEG),
    .S2BEGb(Tile_X1Y3_S2BEGb),
    .S4BEG(Tile_X1Y3_S4BEG),
    .SS4BEG(Tile_X1Y3_SS4BEG),
    .W1BEG(Tile_X1Y3_W1BEG),
    .W2BEG(Tile_X1Y3_W2BEG),
    .W2BEGb(Tile_X1Y3_W2BEGb),
    .WW4BEG(Tile_X1Y3_WW4BEG),
    .W6BEG(Tile_X1Y3_W6BEG),
    .UserCLK(Tile_X1Y4_UserCLKo),
    .UserCLKo(Tile_X1Y3_UserCLKo),
    .FrameData(Tile_X0Y3_FrameData_O),
    .FrameData_O(Tile_X1Y3_FrameData_O),
    .FrameStrobe(Tile_X1Y4_FrameStrobe_O),
    .FrameStrobe_O(Tile_X1Y3_FrameStrobe_O)
);

SCC4
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y4_Emulate_Bitstream)
    )
`endif
    Tile_X0Y4_SCC4
    (
    .END_o_6to0(Tile_X0Y5_BEG_o_6to0),
    .N1END(Tile_X0Y5_N1BEG),
    .N2MID(Tile_X0Y5_N2BEG),
    .N2END(Tile_X0Y5_N2BEGb),
    .N4END(Tile_X0Y5_N4BEG),
    .NN4END(Tile_X0Y5_NN4BEG),
    .E1END(Tile_X0Y4_E1END),
    .E2MID(Tile_X0Y4_E2MID),
    .E2END(Tile_X0Y4_E2END),
    .EE4END(Tile_X0Y4_EE4END),
    .E6END(Tile_X0Y4_E6END),
    .END_i_0to6(Tile_X0Y3_BEG_i_0to6),
    .S1END(Tile_X0Y3_S1BEG),
    .S2MID(Tile_X0Y3_S2BEG),
    .S2END(Tile_X0Y3_S2BEGb),
    .S4END(Tile_X0Y3_S4BEG),
    .SS4END(Tile_X0Y3_SS4BEG),
    .W1END(Tile_X1Y4_W1BEG),
    .W2MID(Tile_X1Y4_W2BEG),
    .W2END(Tile_X1Y4_W2BEGb),
    .WW4END(Tile_X1Y4_WW4BEG),
    .W6END(Tile_X1Y4_W6BEG),
    .BEG_o_6to0(Tile_X0Y4_BEG_o_6to0),
    .N1BEG(Tile_X0Y4_N1BEG),
    .N2BEG(Tile_X0Y4_N2BEG),
    .N2BEGb(Tile_X0Y4_N2BEGb),
    .N4BEG(Tile_X0Y4_N4BEG),
    .NN4BEG(Tile_X0Y4_NN4BEG),
    .E1BEG(Tile_X0Y4_E1BEG),
    .E2BEG(Tile_X0Y4_E2BEG),
    .E2BEGb(Tile_X0Y4_E2BEGb),
    .EE4BEG(Tile_X0Y4_EE4BEG),
    .E6BEG(Tile_X0Y4_E6BEG),
    .BEG_i_0to6(Tile_X0Y4_BEG_i_0to6),
    .S1BEG(Tile_X0Y4_S1BEG),
    .S2BEG(Tile_X0Y4_S2BEG),
    .S2BEGb(Tile_X0Y4_S2BEGb),
    .S4BEG(Tile_X0Y4_S4BEG),
    .SS4BEG(Tile_X0Y4_SS4BEG),
    .W1BEG(Tile_X0Y4_W1BEG),
    .W2BEG(Tile_X0Y4_W2BEG),
    .W2BEGb(Tile_X0Y4_W2BEGb),
    .WW4BEG(Tile_X0Y4_WW4BEG),
    .W6BEG(Tile_X0Y4_W6BEG),
    .UserCLK(Tile_X0Y5_UserCLKo),
    .UserCLKo(Tile_X0Y4_UserCLKo),
    .FrameData(Tile_X0Y4_FrameData),
    .FrameData_O(Tile_X0Y4_FrameData_O),
    .FrameStrobe(Tile_X0Y5_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y4_FrameStrobe_O)
);

SCC4_e
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X1Y4_Emulate_Bitstream)
    )
`endif
    Tile_X1Y4_SCC4_e
    (
    .END_o_6to0(Tile_X1Y5_BEG_o_6to0),
    .N1END(Tile_X1Y5_N1BEG),
    .N2MID(Tile_X1Y5_N2BEG),
    .N2END(Tile_X1Y5_N2BEGb),
    .N4END(Tile_X1Y5_N4BEG),
    .NN4END(Tile_X1Y5_NN4BEG),
    .E1END(Tile_X0Y4_E1BEG),
    .E2MID(Tile_X0Y4_E2BEG),
    .E2END(Tile_X0Y4_E2BEGb),
    .EE4END(Tile_X0Y4_EE4BEG),
    .E6END(Tile_X0Y4_E6BEG),
    .END_i_0to6(Tile_X1Y3_BEG_i_0to6),
    .S1END(Tile_X1Y3_S1BEG),
    .S2MID(Tile_X1Y3_S2BEG),
    .S2END(Tile_X1Y3_S2BEGb),
    .S4END(Tile_X1Y3_S4BEG),
    .SS4END(Tile_X1Y3_SS4BEG),
    .W1END(Tile_X1Y4_W1END),
    .W2MID(Tile_X1Y4_W2MID),
    .W2END(Tile_X1Y4_W2END),
    .WW4END(Tile_X1Y4_WW4END),
    .W6END(Tile_X1Y4_W6END),
    .BEG_o_6to0(Tile_X1Y4_BEG_o_6to0),
    .N1BEG(Tile_X1Y4_N1BEG),
    .N2BEG(Tile_X1Y4_N2BEG),
    .N2BEGb(Tile_X1Y4_N2BEGb),
    .N4BEG(Tile_X1Y4_N4BEG),
    .NN4BEG(Tile_X1Y4_NN4BEG),
    .E1BEG(Tile_X1Y4_E1BEG),
    .E2BEG(Tile_X1Y4_E2BEG),
    .E2BEGb(Tile_X1Y4_E2BEGb),
    .EE4BEG(Tile_X1Y4_EE4BEG),
    .E6BEG(Tile_X1Y4_E6BEG),
    .BEG_i_0to6(Tile_X1Y4_BEG_i_0to6),
    .S1BEG(Tile_X1Y4_S1BEG),
    .S2BEG(Tile_X1Y4_S2BEG),
    .S2BEGb(Tile_X1Y4_S2BEGb),
    .S4BEG(Tile_X1Y4_S4BEG),
    .SS4BEG(Tile_X1Y4_SS4BEG),
    .W1BEG(Tile_X1Y4_W1BEG),
    .W2BEG(Tile_X1Y4_W2BEG),
    .W2BEGb(Tile_X1Y4_W2BEGb),
    .WW4BEG(Tile_X1Y4_WW4BEG),
    .W6BEG(Tile_X1Y4_W6BEG),
    .UserCLK(Tile_X1Y5_UserCLKo),
    .UserCLKo(Tile_X1Y4_UserCLKo),
    .FrameData(Tile_X0Y4_FrameData_O),
    .FrameData_O(Tile_X1Y4_FrameData_O),
    .FrameStrobe(Tile_X1Y5_FrameStrobe_O),
    .FrameStrobe_O(Tile_X1Y4_FrameStrobe_O)
);

SCC5
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y5_Emulate_Bitstream)
    )
`endif
    Tile_X0Y5_SCC5
    (
    .END_o_6to0(Tile_X0Y6_BEG_o_6to0),
    .N1END(Tile_X0Y6_N1BEG),
    .N2MID(Tile_X0Y6_N2BEG),
    .N2END(Tile_X0Y6_N2BEGb),
    .N4END(Tile_X0Y6_N4BEG),
    .NN4END(Tile_X0Y6_NN4BEG),
    .E1END(Tile_X0Y5_E1END),
    .E2MID(Tile_X0Y5_E2MID),
    .E2END(Tile_X0Y5_E2END),
    .EE4END(Tile_X0Y5_EE4END),
    .E6END(Tile_X0Y5_E6END),
    .END_i_0to6(Tile_X0Y4_BEG_i_0to6),
    .S1END(Tile_X0Y4_S1BEG),
    .S2MID(Tile_X0Y4_S2BEG),
    .S2END(Tile_X0Y4_S2BEGb),
    .S4END(Tile_X0Y4_S4BEG),
    .SS4END(Tile_X0Y4_SS4BEG),
    .W1END(Tile_X1Y5_W1BEG),
    .W2MID(Tile_X1Y5_W2BEG),
    .W2END(Tile_X1Y5_W2BEGb),
    .WW4END(Tile_X1Y5_WW4BEG),
    .W6END(Tile_X1Y5_W6BEG),
    .BEG_o_6to0(Tile_X0Y5_BEG_o_6to0),
    .N1BEG(Tile_X0Y5_N1BEG),
    .N2BEG(Tile_X0Y5_N2BEG),
    .N2BEGb(Tile_X0Y5_N2BEGb),
    .N4BEG(Tile_X0Y5_N4BEG),
    .NN4BEG(Tile_X0Y5_NN4BEG),
    .E1BEG(Tile_X0Y5_E1BEG),
    .E2BEG(Tile_X0Y5_E2BEG),
    .E2BEGb(Tile_X0Y5_E2BEGb),
    .EE4BEG(Tile_X0Y5_EE4BEG),
    .E6BEG(Tile_X0Y5_E6BEG),
    .BEG_i_0to6(Tile_X0Y5_BEG_i_0to6),
    .S1BEG(Tile_X0Y5_S1BEG),
    .S2BEG(Tile_X0Y5_S2BEG),
    .S2BEGb(Tile_X0Y5_S2BEGb),
    .S4BEG(Tile_X0Y5_S4BEG),
    .SS4BEG(Tile_X0Y5_SS4BEG),
    .W1BEG(Tile_X0Y5_W1BEG),
    .W2BEG(Tile_X0Y5_W2BEG),
    .W2BEGb(Tile_X0Y5_W2BEGb),
    .WW4BEG(Tile_X0Y5_WW4BEG),
    .W6BEG(Tile_X0Y5_W6BEG),
    .UserCLK(Tile_X0Y6_UserCLKo),
    .UserCLKo(Tile_X0Y5_UserCLKo),
    .FrameData(Tile_X0Y5_FrameData),
    .FrameData_O(Tile_X0Y5_FrameData_O),
    .FrameStrobe(Tile_X0Y6_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y5_FrameStrobe_O)
);

SCC5_e
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X1Y5_Emulate_Bitstream)
    )
`endif
    Tile_X1Y5_SCC5_e
    (
    .END_o_6to0(Tile_X1Y6_BEG_o_6to0),
    .N1END(Tile_X1Y6_N1BEG),
    .N2MID(Tile_X1Y6_N2BEG),
    .N2END(Tile_X1Y6_N2BEGb),
    .N4END(Tile_X1Y6_N4BEG),
    .NN4END(Tile_X1Y6_NN4BEG),
    .E1END(Tile_X0Y5_E1BEG),
    .E2MID(Tile_X0Y5_E2BEG),
    .E2END(Tile_X0Y5_E2BEGb),
    .EE4END(Tile_X0Y5_EE4BEG),
    .E6END(Tile_X0Y5_E6BEG),
    .END_i_0to6(Tile_X1Y4_BEG_i_0to6),
    .S1END(Tile_X1Y4_S1BEG),
    .S2MID(Tile_X1Y4_S2BEG),
    .S2END(Tile_X1Y4_S2BEGb),
    .S4END(Tile_X1Y4_S4BEG),
    .SS4END(Tile_X1Y4_SS4BEG),
    .W1END(Tile_X1Y5_W1END),
    .W2MID(Tile_X1Y5_W2MID),
    .W2END(Tile_X1Y5_W2END),
    .WW4END(Tile_X1Y5_WW4END),
    .W6END(Tile_X1Y5_W6END),
    .BEG_o_6to0(Tile_X1Y5_BEG_o_6to0),
    .N1BEG(Tile_X1Y5_N1BEG),
    .N2BEG(Tile_X1Y5_N2BEG),
    .N2BEGb(Tile_X1Y5_N2BEGb),
    .N4BEG(Tile_X1Y5_N4BEG),
    .NN4BEG(Tile_X1Y5_NN4BEG),
    .E1BEG(Tile_X1Y5_E1BEG),
    .E2BEG(Tile_X1Y5_E2BEG),
    .E2BEGb(Tile_X1Y5_E2BEGb),
    .EE4BEG(Tile_X1Y5_EE4BEG),
    .E6BEG(Tile_X1Y5_E6BEG),
    .BEG_i_0to6(Tile_X1Y5_BEG_i_0to6),
    .S1BEG(Tile_X1Y5_S1BEG),
    .S2BEG(Tile_X1Y5_S2BEG),
    .S2BEGb(Tile_X1Y5_S2BEGb),
    .S4BEG(Tile_X1Y5_S4BEG),
    .SS4BEG(Tile_X1Y5_SS4BEG),
    .W1BEG(Tile_X1Y5_W1BEG),
    .W2BEG(Tile_X1Y5_W2BEG),
    .W2BEGb(Tile_X1Y5_W2BEGb),
    .WW4BEG(Tile_X1Y5_WW4BEG),
    .W6BEG(Tile_X1Y5_W6BEG),
    .UserCLK(Tile_X1Y6_UserCLKo),
    .UserCLKo(Tile_X1Y5_UserCLKo),
    .FrameData(Tile_X0Y5_FrameData_O),
    .FrameData_O(Tile_X1Y5_FrameData_O),
    .FrameStrobe(Tile_X1Y6_FrameStrobe_O),
    .FrameStrobe_O(Tile_X1Y5_FrameStrobe_O)
);

SCC6
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y6_Emulate_Bitstream)
    )
`endif
    Tile_X0Y6_SCC6
    (
    .END_o_6to0(Tile_X0Y6_END_o_6to0),
    .N1END(Tile_X0Y6_N1END),
    .N2MID(Tile_X0Y6_N2MID),
    .N2END(Tile_X0Y6_N2END),
    .N4END(Tile_X0Y6_N4END),
    .NN4END(Tile_X0Y6_NN4END),
    .E1END(Tile_X0Y6_E1END),
    .E2MID(Tile_X0Y6_E2MID),
    .E2END(Tile_X0Y6_E2END),
    .EE4END(Tile_X0Y6_EE4END),
    .E6END(Tile_X0Y6_E6END),
    .END_i_0to6(Tile_X0Y5_BEG_i_0to6),
    .S1END(Tile_X0Y5_S1BEG),
    .S2MID(Tile_X0Y5_S2BEG),
    .S2END(Tile_X0Y5_S2BEGb),
    .S4END(Tile_X0Y5_S4BEG),
    .SS4END(Tile_X0Y5_SS4BEG),
    .i_w2e(Tile_X1Y6_i_w2e),
    .W1END(Tile_X1Y6_W1BEG),
    .W2MID(Tile_X1Y6_W2BEG),
    .W2END(Tile_X1Y6_W2BEGb),
    .WW4END(Tile_X1Y6_WW4BEG),
    .W6END(Tile_X1Y6_W6BEG),
    .BEG_o_6to0(Tile_X0Y6_BEG_o_6to0),
    .N1BEG(Tile_X0Y6_N1BEG),
    .N2BEG(Tile_X0Y6_N2BEG),
    .N2BEGb(Tile_X0Y6_N2BEGb),
    .N4BEG(Tile_X0Y6_N4BEG),
    .NN4BEG(Tile_X0Y6_NN4BEG),
    .o_e2w(Tile_X0Y6_o_e2w),
    .E1BEG(Tile_X0Y6_E1BEG),
    .E2BEG(Tile_X0Y6_E2BEG),
    .E2BEGb(Tile_X0Y6_E2BEGb),
    .EE4BEG(Tile_X0Y6_EE4BEG),
    .E6BEG(Tile_X0Y6_E6BEG),
    .BEG_i_0to6(Tile_X0Y6_BEG_i_0to6),
    .S1BEG(Tile_X0Y6_S1BEG),
    .S2BEG(Tile_X0Y6_S2BEG),
    .S2BEGb(Tile_X0Y6_S2BEGb),
    .S4BEG(Tile_X0Y6_S4BEG),
    .SS4BEG(Tile_X0Y6_SS4BEG),
    .W1BEG(Tile_X0Y6_W1BEG),
    .W2BEG(Tile_X0Y6_W2BEG),
    .W2BEGb(Tile_X0Y6_W2BEGb),
    .WW4BEG(Tile_X0Y6_WW4BEG),
    .W6BEG(Tile_X0Y6_W6BEG),
    .UserCLK(Tile_X0Y6_UserCLK),
    .UserCLKo(Tile_X0Y6_UserCLKo),
    .FrameData(Tile_X0Y6_FrameData),
    .FrameData_O(Tile_X0Y6_FrameData_O),
    .FrameStrobe(Tile_X0Y6_FrameStrobe),
    .FrameStrobe_O(Tile_X0Y6_FrameStrobe_O)
);

SCC6_e
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X1Y6_Emulate_Bitstream)
    )
`endif
    Tile_X1Y6_SCC6_e
    (
    .N1END(Tile_X1Y6_N1END),
    .N2MID(Tile_X1Y6_N2MID),
    .N2END(Tile_X1Y6_N2END),
    .N4END(Tile_X1Y6_N4END),
    .NN4END(Tile_X1Y6_NN4END),
    .o_e2w(Tile_X0Y6_o_e2w),
    .E1END(Tile_X0Y6_E1BEG),
    .E2MID(Tile_X0Y6_E2BEG),
    .E2END(Tile_X0Y6_E2BEGb),
    .EE4END(Tile_X0Y6_EE4BEG),
    .E6END(Tile_X0Y6_E6BEG),
    .END_i_0to6(Tile_X1Y5_BEG_i_0to6),
    .S1END(Tile_X1Y5_S1BEG),
    .S2MID(Tile_X1Y5_S2BEG),
    .S2END(Tile_X1Y5_S2BEGb),
    .S4END(Tile_X1Y5_S4BEG),
    .SS4END(Tile_X1Y5_SS4BEG),
    .W1END(Tile_X1Y6_W1END),
    .W2MID(Tile_X1Y6_W2MID),
    .W2END(Tile_X1Y6_W2END),
    .WW4END(Tile_X1Y6_WW4END),
    .W6END(Tile_X1Y6_W6END),
    .BEG_o_6to0(Tile_X1Y6_BEG_o_6to0),
    .N1BEG(Tile_X1Y6_N1BEG),
    .N2BEG(Tile_X1Y6_N2BEG),
    .N2BEGb(Tile_X1Y6_N2BEGb),
    .N4BEG(Tile_X1Y6_N4BEG),
    .NN4BEG(Tile_X1Y6_NN4BEG),
    .E1BEG(Tile_X1Y6_E1BEG),
    .E2BEG(Tile_X1Y6_E2BEG),
    .E2BEGb(Tile_X1Y6_E2BEGb),
    .EE4BEG(Tile_X1Y6_EE4BEG),
    .E6BEG(Tile_X1Y6_E6BEG),
    .S1BEG(Tile_X1Y6_S1BEG),
    .S2BEG(Tile_X1Y6_S2BEG),
    .S2BEGb(Tile_X1Y6_S2BEGb),
    .S4BEG(Tile_X1Y6_S4BEG),
    .SS4BEG(Tile_X1Y6_SS4BEG),
    .i_w2e(Tile_X1Y6_i_w2e),
    .W1BEG(Tile_X1Y6_W1BEG),
    .W2BEG(Tile_X1Y6_W2BEG),
    .W2BEGb(Tile_X1Y6_W2BEGb),
    .WW4BEG(Tile_X1Y6_WW4BEG),
    .W6BEG(Tile_X1Y6_W6BEG),
    .UserCLK(Tile_X1Y6_UserCLK),
    .UserCLKo(Tile_X1Y6_UserCLKo),
    .FrameData(Tile_X0Y6_FrameData_O),
    .FrameData_O(Tile_X1Y6_FrameData_O),
    .FrameStrobe(Tile_X1Y6_FrameStrobe),
    .FrameStrobe_O(Tile_X1Y6_FrameStrobe_O)
);

endmodule
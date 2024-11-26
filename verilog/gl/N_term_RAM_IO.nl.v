// This is the unpowered netlist.
module N_term_RAM_IO (UserCLK,
    UserCLKo,
    FrameStrobe,
    FrameStrobe_O,
    N1END,
    N2END,
    N2MID,
    N4END,
    S1BEG,
    S2BEG,
    S2BEGb,
    S4BEG);
 input UserCLK;
 output UserCLKo;
 input [19:0] FrameStrobe;
 output [19:0] FrameStrobe_O;
 input [3:0] N1END;
 input [7:0] N2END;
 input [7:0] N2MID;
 input [15:0] N4END;
 output [3:0] S1BEG;
 output [7:0] S2BEG;
 output [7:0] S2BEGb;
 output [15:0] S4BEG;

 wire \Inst_N_term_RAM_IO_switch_matrix.S1BEG0 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S1BEG1 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S1BEG2 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S1BEG3 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEG0 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEG1 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEG2 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEG3 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEG4 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEG5 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEG6 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEG7 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEGb0 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEGb1 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEGb2 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEGb3 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEGb4 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEGb5 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEGb6 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S2BEGb7 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG0 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG1 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG10 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG11 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG12 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG13 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG14 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG15 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG2 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG3 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG4 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG5 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG6 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG7 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG8 ;
 wire \Inst_N_term_RAM_IO_switch_matrix.S4BEG9 ;
 wire net1;
 wire net10;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net11;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net2;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net3;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net4;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net5;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net6;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire net67;
 wire net68;
 wire net69;
 wire net7;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net8;
 wire net80;
 wire net81;
 wire net82;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net88;
 wire net89;
 wire net9;
 wire net90;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;
 wire \strobe_inbuf_0.X ;
 wire \strobe_inbuf_1.X ;
 wire \strobe_inbuf_10.X ;
 wire \strobe_inbuf_11.X ;
 wire \strobe_inbuf_12.X ;
 wire \strobe_inbuf_13.X ;
 wire \strobe_inbuf_14.X ;
 wire \strobe_inbuf_15.X ;
 wire \strobe_inbuf_16.X ;
 wire \strobe_inbuf_17.X ;
 wire \strobe_inbuf_18.X ;
 wire \strobe_inbuf_19.X ;
 wire \strobe_inbuf_2.X ;
 wire \strobe_inbuf_3.X ;
 wire \strobe_inbuf_4.X ;
 wire \strobe_inbuf_5.X ;
 wire \strobe_inbuf_6.X ;
 wire \strobe_inbuf_7.X ;
 wire \strobe_inbuf_8.X ;
 wire \strobe_inbuf_9.X ;
 wire \strobe_outbuf_0.X ;
 wire \strobe_outbuf_1.X ;
 wire \strobe_outbuf_10.X ;
 wire \strobe_outbuf_11.X ;
 wire \strobe_outbuf_12.X ;
 wire \strobe_outbuf_13.X ;
 wire \strobe_outbuf_14.X ;
 wire \strobe_outbuf_15.X ;
 wire \strobe_outbuf_16.X ;
 wire \strobe_outbuf_17.X ;
 wire \strobe_outbuf_18.X ;
 wire \strobe_outbuf_19.X ;
 wire \strobe_outbuf_2.X ;
 wire \strobe_outbuf_3.X ;
 wire \strobe_outbuf_4.X ;
 wire \strobe_outbuf_5.X ;
 wire \strobe_outbuf_6.X ;
 wire \strobe_outbuf_7.X ;
 wire \strobe_outbuf_8.X ;
 wire \strobe_outbuf_9.X ;

 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(net16));
 sky130_fd_sc_hd__diode_2 ANTENNA_2 (.DIODE(net20));
 sky130_fd_sc_hd__diode_2 ANTENNA_3 (.DIODE(net114));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_110 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_126 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_136 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_151 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_253 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_10 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_138 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_231 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_241 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_254 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_102 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_106 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_2_110 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_128 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_2_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_139 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_2_141 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_2_149 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_15 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_2_158 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_215 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_227 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_253 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_2_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_37 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_42 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_2_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_65 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_2_81 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_89 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_2_96 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_3_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_149 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_3_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_3_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_223 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_225 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_237 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_253 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_4_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_177 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_4_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_221 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_233 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_4_245 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_251 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_253 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_4_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_97 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_5_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_149 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_5_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_5_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_223 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_237 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_5_249 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_177 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_221 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_233 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_245 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_253 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_106 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_111 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_117 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_121 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_126 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_132 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_137 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_145 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_152 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_160 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_164 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_173 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_177 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_185 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_191 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_203 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_208 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_220 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_237 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_249 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_253 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_55 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_60 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_68 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_73 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_86 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_94 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_98 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_104 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_109 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_115 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_119 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_124 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_135 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_139 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_150 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_158 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_162 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_170 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_175 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_183 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_195 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_206 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_218 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_230 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_242 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_253 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_41 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_53 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_57 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_65 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_71 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_79 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_85 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_96 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_110 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_113 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_126 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_136 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_162 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_17 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_178 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_188 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_206 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_217 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_228 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_240 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_25 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_253 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_35 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_42 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_48 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_60 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_71 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_9 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_97 ();
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._00_  (.A(net24),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S1BEG0 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._01_  (.A(net23),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S1BEG1 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._02_  (.A(net22),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S1BEG2 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._03_  (.A(net21),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S1BEG3 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._04_  (.A(net40),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEG0 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._05_  (.A(net39),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEG1 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._06_  (.A(net38),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEG2 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._07_  (.A(net37),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEG3 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._08_  (.A(net36),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEG4 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._09_  (.A(net35),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEG5 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._10_  (.A(net34),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEG6 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._11_  (.A(net33),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEG7 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._12_  (.A(net32),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb0 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._13_  (.A(net31),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb1 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._14_  (.A(net30),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb2 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._15_  (.A(net29),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb3 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._16_  (.A(net28),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb4 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._17_  (.A(net27),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb5 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._18_  (.A(net26),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb6 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._19_  (.A(net25),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb7 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._20_  (.A(net47),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG0 ));
 sky130_fd_sc_hd__buf_1 \Inst_N_term_RAM_IO_switch_matrix._21_  (.A(net46),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG1 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._22_  (.A(net52),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG10 ));
 sky130_fd_sc_hd__buf_1 \Inst_N_term_RAM_IO_switch_matrix._23_  (.A(net51),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG11 ));
 sky130_fd_sc_hd__buf_1 \Inst_N_term_RAM_IO_switch_matrix._24_  (.A(net50),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG12 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._25_  (.A(net49),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG13 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._26_  (.A(net48),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG14 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._27_  (.A(net41),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG15 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._28_  (.A(net45),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG2 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._29_  (.A(net44),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG3 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._30_  (.A(net43),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG4 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._31_  (.A(net42),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG5 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._32_  (.A(net56),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG6 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._33_  (.A(net55),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG7 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._34_  (.A(net54),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG8 ));
 sky130_fd_sc_hd__clkbuf_1 \Inst_N_term_RAM_IO_switch_matrix._35_  (.A(net53),
    .X(\Inst_N_term_RAM_IO_switch_matrix.S4BEG9 ));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_20 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_21 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_22 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_23 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_24 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_25 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_26 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_73 ();
 sky130_fd_sc_hd__clkbuf_1 _00_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S1BEG0 ),
    .X(net78));
 sky130_fd_sc_hd__clkbuf_1 _01_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S1BEG1 ),
    .X(net79));
 sky130_fd_sc_hd__clkbuf_1 _02_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S1BEG2 ),
    .X(net80));
 sky130_fd_sc_hd__clkbuf_1 _03_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S1BEG3 ),
    .X(net81));
 sky130_fd_sc_hd__clkbuf_1 _04_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEG0 ),
    .X(net82));
 sky130_fd_sc_hd__clkbuf_1 _05_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEG1 ),
    .X(net83));
 sky130_fd_sc_hd__clkbuf_1 _06_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEG2 ),
    .X(net84));
 sky130_fd_sc_hd__clkbuf_1 _07_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEG3 ),
    .X(net85));
 sky130_fd_sc_hd__clkbuf_1 _08_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEG4 ),
    .X(net86));
 sky130_fd_sc_hd__clkbuf_1 _09_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEG5 ),
    .X(net87));
 sky130_fd_sc_hd__clkbuf_1 _10_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEG6 ),
    .X(net88));
 sky130_fd_sc_hd__clkbuf_1 _11_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEG7 ),
    .X(net89));
 sky130_fd_sc_hd__clkbuf_1 _12_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb0 ),
    .X(net90));
 sky130_fd_sc_hd__clkbuf_1 _13_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb1 ),
    .X(net91));
 sky130_fd_sc_hd__clkbuf_1 _14_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb2 ),
    .X(net92));
 sky130_fd_sc_hd__clkbuf_1 _15_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb3 ),
    .X(net93));
 sky130_fd_sc_hd__clkbuf_1 _16_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb4 ),
    .X(net94));
 sky130_fd_sc_hd__buf_1 _17_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb5 ),
    .X(net95));
 sky130_fd_sc_hd__clkbuf_1 _18_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb6 ),
    .X(net96));
 sky130_fd_sc_hd__clkbuf_1 _19_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S2BEGb7 ),
    .X(net97));
 sky130_fd_sc_hd__clkbuf_1 _20_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG0 ),
    .X(net98));
 sky130_fd_sc_hd__clkbuf_1 _21_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG1 ),
    .X(net105));
 sky130_fd_sc_hd__clkbuf_1 _22_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG2 ),
    .X(net106));
 sky130_fd_sc_hd__clkbuf_1 _23_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG3 ),
    .X(net107));
 sky130_fd_sc_hd__clkbuf_1 _24_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG4 ),
    .X(net108));
 sky130_fd_sc_hd__clkbuf_1 _25_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG5 ),
    .X(net109));
 sky130_fd_sc_hd__clkbuf_1 _26_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG6 ),
    .X(net110));
 sky130_fd_sc_hd__clkbuf_1 _27_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG7 ),
    .X(net111));
 sky130_fd_sc_hd__clkbuf_1 _28_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG8 ),
    .X(net112));
 sky130_fd_sc_hd__clkbuf_1 _29_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG9 ),
    .X(net113));
 sky130_fd_sc_hd__clkbuf_1 _30_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG10 ),
    .X(net99));
 sky130_fd_sc_hd__clkbuf_1 _31_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG11 ),
    .X(net100));
 sky130_fd_sc_hd__clkbuf_1 _32_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG12 ),
    .X(net101));
 sky130_fd_sc_hd__clkbuf_1 _33_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG13 ),
    .X(net102));
 sky130_fd_sc_hd__clkbuf_1 _34_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG14 ),
    .X(net103));
 sky130_fd_sc_hd__clkbuf_1 _35_ (.A(\Inst_N_term_RAM_IO_switch_matrix.S4BEG15 ),
    .X(net104));
 sky130_fd_sc_hd__buf_1 _36_ (.A(\strobe_outbuf_0.X ),
    .X(net58));
 sky130_fd_sc_hd__buf_1 _37_ (.A(\strobe_outbuf_1.X ),
    .X(net69));
 sky130_fd_sc_hd__clkbuf_1 _38_ (.A(\strobe_outbuf_2.X ),
    .X(net70));
 sky130_fd_sc_hd__clkbuf_1 _39_ (.A(\strobe_outbuf_3.X ),
    .X(net71));
 sky130_fd_sc_hd__clkbuf_1 _40_ (.A(\strobe_outbuf_4.X ),
    .X(net72));
 sky130_fd_sc_hd__clkbuf_1 _41_ (.A(\strobe_outbuf_5.X ),
    .X(net73));
 sky130_fd_sc_hd__clkbuf_1 _42_ (.A(\strobe_outbuf_6.X ),
    .X(net74));
 sky130_fd_sc_hd__clkbuf_1 _43_ (.A(\strobe_outbuf_7.X ),
    .X(net75));
 sky130_fd_sc_hd__clkbuf_1 _44_ (.A(\strobe_outbuf_8.X ),
    .X(net76));
 sky130_fd_sc_hd__clkbuf_1 _45_ (.A(\strobe_outbuf_9.X ),
    .X(net77));
 sky130_fd_sc_hd__clkbuf_1 _46_ (.A(\strobe_outbuf_10.X ),
    .X(net59));
 sky130_fd_sc_hd__clkbuf_1 _47_ (.A(\strobe_outbuf_11.X ),
    .X(net60));
 sky130_fd_sc_hd__clkbuf_1 _48_ (.A(\strobe_outbuf_12.X ),
    .X(net61));
 sky130_fd_sc_hd__clkbuf_1 _49_ (.A(\strobe_outbuf_13.X ),
    .X(net62));
 sky130_fd_sc_hd__clkbuf_1 _50_ (.A(\strobe_outbuf_14.X ),
    .X(net63));
 sky130_fd_sc_hd__clkbuf_1 _51_ (.A(\strobe_outbuf_15.X ),
    .X(net64));
 sky130_fd_sc_hd__clkbuf_1 _52_ (.A(\strobe_outbuf_16.X ),
    .X(net65));
 sky130_fd_sc_hd__clkbuf_1 _53_ (.A(\strobe_outbuf_17.X ),
    .X(net66));
 sky130_fd_sc_hd__clkbuf_1 _54_ (.A(\strobe_outbuf_18.X ),
    .X(net67));
 sky130_fd_sc_hd__clkbuf_1 _55_ (.A(\strobe_outbuf_19.X ),
    .X(net68));
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(FrameStrobe[0]),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input10 (.A(FrameStrobe[18]),
    .X(net10));
 sky130_fd_sc_hd__clkbuf_1 input11 (.A(FrameStrobe[19]),
    .X(net11));
 sky130_fd_sc_hd__buf_1 input12 (.A(FrameStrobe[1]),
    .X(net12));
 sky130_fd_sc_hd__buf_1 input13 (.A(FrameStrobe[2]),
    .X(net13));
 sky130_fd_sc_hd__buf_1 input14 (.A(FrameStrobe[3]),
    .X(net14));
 sky130_fd_sc_hd__buf_1 input15 (.A(FrameStrobe[4]),
    .X(net15));
 sky130_fd_sc_hd__buf_1 input16 (.A(FrameStrobe[5]),
    .X(net16));
 sky130_fd_sc_hd__buf_1 input17 (.A(FrameStrobe[6]),
    .X(net17));
 sky130_fd_sc_hd__buf_1 input18 (.A(FrameStrobe[7]),
    .X(net18));
 sky130_fd_sc_hd__buf_1 input19 (.A(FrameStrobe[8]),
    .X(net19));
 sky130_fd_sc_hd__buf_1 input2 (.A(FrameStrobe[10]),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input20 (.A(FrameStrobe[9]),
    .X(net20));
 sky130_fd_sc_hd__clkbuf_1 input21 (.A(N1END[0]),
    .X(net21));
 sky130_fd_sc_hd__clkbuf_1 input22 (.A(N1END[1]),
    .X(net22));
 sky130_fd_sc_hd__clkbuf_1 input23 (.A(N1END[2]),
    .X(net23));
 sky130_fd_sc_hd__clkbuf_1 input24 (.A(N1END[3]),
    .X(net24));
 sky130_fd_sc_hd__clkbuf_1 input25 (.A(N2END[0]),
    .X(net25));
 sky130_fd_sc_hd__clkbuf_1 input26 (.A(N2END[1]),
    .X(net26));
 sky130_fd_sc_hd__clkbuf_1 input27 (.A(N2END[2]),
    .X(net27));
 sky130_fd_sc_hd__clkbuf_1 input28 (.A(N2END[3]),
    .X(net28));
 sky130_fd_sc_hd__clkbuf_1 input29 (.A(N2END[4]),
    .X(net29));
 sky130_fd_sc_hd__buf_1 input3 (.A(FrameStrobe[11]),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_1 input30 (.A(N2END[5]),
    .X(net30));
 sky130_fd_sc_hd__clkbuf_1 input31 (.A(N2END[6]),
    .X(net31));
 sky130_fd_sc_hd__clkbuf_1 input32 (.A(N2END[7]),
    .X(net32));
 sky130_fd_sc_hd__buf_1 input33 (.A(N2MID[0]),
    .X(net33));
 sky130_fd_sc_hd__buf_1 input34 (.A(N2MID[1]),
    .X(net34));
 sky130_fd_sc_hd__buf_1 input35 (.A(N2MID[2]),
    .X(net35));
 sky130_fd_sc_hd__buf_1 input36 (.A(N2MID[3]),
    .X(net36));
 sky130_fd_sc_hd__buf_1 input37 (.A(N2MID[4]),
    .X(net37));
 sky130_fd_sc_hd__clkbuf_1 input38 (.A(N2MID[5]),
    .X(net38));
 sky130_fd_sc_hd__clkbuf_1 input39 (.A(N2MID[6]),
    .X(net39));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(FrameStrobe[12]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input40 (.A(N2MID[7]),
    .X(net40));
 sky130_fd_sc_hd__buf_1 input41 (.A(N4END[0]),
    .X(net41));
 sky130_fd_sc_hd__clkbuf_1 input42 (.A(N4END[10]),
    .X(net42));
 sky130_fd_sc_hd__clkbuf_1 input43 (.A(N4END[11]),
    .X(net43));
 sky130_fd_sc_hd__clkbuf_1 input44 (.A(N4END[12]),
    .X(net44));
 sky130_fd_sc_hd__clkbuf_1 input45 (.A(N4END[13]),
    .X(net45));
 sky130_fd_sc_hd__clkbuf_1 input46 (.A(N4END[14]),
    .X(net46));
 sky130_fd_sc_hd__clkbuf_1 input47 (.A(N4END[15]),
    .X(net47));
 sky130_fd_sc_hd__buf_1 input48 (.A(N4END[1]),
    .X(net48));
 sky130_fd_sc_hd__buf_1 input49 (.A(N4END[2]),
    .X(net49));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(FrameStrobe[13]),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_1 input50 (.A(N4END[3]),
    .X(net50));
 sky130_fd_sc_hd__clkbuf_1 input51 (.A(N4END[4]),
    .X(net51));
 sky130_fd_sc_hd__clkbuf_1 input52 (.A(N4END[5]),
    .X(net52));
 sky130_fd_sc_hd__buf_1 input53 (.A(N4END[6]),
    .X(net53));
 sky130_fd_sc_hd__clkbuf_1 input54 (.A(N4END[7]),
    .X(net54));
 sky130_fd_sc_hd__clkbuf_1 input55 (.A(N4END[8]),
    .X(net55));
 sky130_fd_sc_hd__clkbuf_1 input56 (.A(N4END[9]),
    .X(net56));
 sky130_fd_sc_hd__clkbuf_1 input57 (.A(UserCLK),
    .X(net57));
 sky130_fd_sc_hd__clkbuf_1 input6 (.A(FrameStrobe[14]),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_1 input7 (.A(FrameStrobe[15]),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_1 input8 (.A(FrameStrobe[16]),
    .X(net8));
 sky130_fd_sc_hd__clkbuf_1 input9 (.A(FrameStrobe[17]),
    .X(net9));
 sky130_fd_sc_hd__clkbuf_2 inst_clk_buf (.A(net57),
    .X(net114));
 sky130_fd_sc_hd__clkbuf_4 output100 (.A(net100),
    .X(S4BEG[11]));
 sky130_fd_sc_hd__clkbuf_4 output101 (.A(net101),
    .X(S4BEG[12]));
 sky130_fd_sc_hd__clkbuf_4 output102 (.A(net102),
    .X(S4BEG[13]));
 sky130_fd_sc_hd__buf_2 output103 (.A(net103),
    .X(S4BEG[14]));
 sky130_fd_sc_hd__clkbuf_4 output104 (.A(net104),
    .X(S4BEG[15]));
 sky130_fd_sc_hd__clkbuf_4 output105 (.A(net105),
    .X(S4BEG[1]));
 sky130_fd_sc_hd__clkbuf_4 output106 (.A(net106),
    .X(S4BEG[2]));
 sky130_fd_sc_hd__clkbuf_4 output107 (.A(net107),
    .X(S4BEG[3]));
 sky130_fd_sc_hd__clkbuf_4 output108 (.A(net108),
    .X(S4BEG[4]));
 sky130_fd_sc_hd__clkbuf_4 output109 (.A(net109),
    .X(S4BEG[5]));
 sky130_fd_sc_hd__clkbuf_4 output110 (.A(net110),
    .X(S4BEG[6]));
 sky130_fd_sc_hd__clkbuf_4 output111 (.A(net111),
    .X(S4BEG[7]));
 sky130_fd_sc_hd__clkbuf_4 output112 (.A(net112),
    .X(S4BEG[8]));
 sky130_fd_sc_hd__clkbuf_4 output113 (.A(net113),
    .X(S4BEG[9]));
 sky130_fd_sc_hd__clkbuf_4 output114 (.A(net114),
    .X(UserCLKo));
 sky130_fd_sc_hd__buf_2 output58 (.A(net58),
    .X(FrameStrobe_O[0]));
 sky130_fd_sc_hd__clkbuf_4 output59 (.A(net59),
    .X(FrameStrobe_O[10]));
 sky130_fd_sc_hd__clkbuf_4 output60 (.A(net60),
    .X(FrameStrobe_O[11]));
 sky130_fd_sc_hd__clkbuf_4 output61 (.A(net61),
    .X(FrameStrobe_O[12]));
 sky130_fd_sc_hd__clkbuf_4 output62 (.A(net62),
    .X(FrameStrobe_O[13]));
 sky130_fd_sc_hd__clkbuf_4 output63 (.A(net63),
    .X(FrameStrobe_O[14]));
 sky130_fd_sc_hd__buf_2 output64 (.A(net64),
    .X(FrameStrobe_O[15]));
 sky130_fd_sc_hd__buf_2 output65 (.A(net65),
    .X(FrameStrobe_O[16]));
 sky130_fd_sc_hd__clkbuf_4 output66 (.A(net66),
    .X(FrameStrobe_O[17]));
 sky130_fd_sc_hd__clkbuf_4 output67 (.A(net67),
    .X(FrameStrobe_O[18]));
 sky130_fd_sc_hd__clkbuf_4 output68 (.A(net68),
    .X(FrameStrobe_O[19]));
 sky130_fd_sc_hd__clkbuf_4 output69 (.A(net69),
    .X(FrameStrobe_O[1]));
 sky130_fd_sc_hd__clkbuf_4 output70 (.A(net70),
    .X(FrameStrobe_O[2]));
 sky130_fd_sc_hd__clkbuf_4 output71 (.A(net71),
    .X(FrameStrobe_O[3]));
 sky130_fd_sc_hd__clkbuf_4 output72 (.A(net72),
    .X(FrameStrobe_O[4]));
 sky130_fd_sc_hd__clkbuf_4 output73 (.A(net73),
    .X(FrameStrobe_O[5]));
 sky130_fd_sc_hd__clkbuf_4 output74 (.A(net74),
    .X(FrameStrobe_O[6]));
 sky130_fd_sc_hd__clkbuf_4 output75 (.A(net75),
    .X(FrameStrobe_O[7]));
 sky130_fd_sc_hd__buf_2 output76 (.A(net76),
    .X(FrameStrobe_O[8]));
 sky130_fd_sc_hd__buf_2 output77 (.A(net77),
    .X(FrameStrobe_O[9]));
 sky130_fd_sc_hd__buf_2 output78 (.A(net78),
    .X(S1BEG[0]));
 sky130_fd_sc_hd__clkbuf_4 output79 (.A(net79),
    .X(S1BEG[1]));
 sky130_fd_sc_hd__buf_2 output80 (.A(net80),
    .X(S1BEG[2]));
 sky130_fd_sc_hd__clkbuf_4 output81 (.A(net81),
    .X(S1BEG[3]));
 sky130_fd_sc_hd__buf_2 output82 (.A(net82),
    .X(S2BEG[0]));
 sky130_fd_sc_hd__clkbuf_4 output83 (.A(net83),
    .X(S2BEG[1]));
 sky130_fd_sc_hd__buf_2 output84 (.A(net84),
    .X(S2BEG[2]));
 sky130_fd_sc_hd__buf_2 output85 (.A(net85),
    .X(S2BEG[3]));
 sky130_fd_sc_hd__buf_2 output86 (.A(net86),
    .X(S2BEG[4]));
 sky130_fd_sc_hd__clkbuf_4 output87 (.A(net87),
    .X(S2BEG[5]));
 sky130_fd_sc_hd__clkbuf_4 output88 (.A(net88),
    .X(S2BEG[6]));
 sky130_fd_sc_hd__buf_2 output89 (.A(net89),
    .X(S2BEG[7]));
 sky130_fd_sc_hd__clkbuf_4 output90 (.A(net90),
    .X(S2BEGb[0]));
 sky130_fd_sc_hd__buf_2 output91 (.A(net91),
    .X(S2BEGb[1]));
 sky130_fd_sc_hd__clkbuf_4 output92 (.A(net92),
    .X(S2BEGb[2]));
 sky130_fd_sc_hd__buf_2 output93 (.A(net93),
    .X(S2BEGb[3]));
 sky130_fd_sc_hd__clkbuf_4 output94 (.A(net94),
    .X(S2BEGb[4]));
 sky130_fd_sc_hd__clkbuf_4 output95 (.A(net95),
    .X(S2BEGb[5]));
 sky130_fd_sc_hd__buf_2 output96 (.A(net96),
    .X(S2BEGb[6]));
 sky130_fd_sc_hd__buf_2 output97 (.A(net97),
    .X(S2BEGb[7]));
 sky130_fd_sc_hd__clkbuf_4 output98 (.A(net98),
    .X(S4BEG[0]));
 sky130_fd_sc_hd__clkbuf_4 output99 (.A(net99),
    .X(S4BEG[10]));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_0._0_  (.A(net1),
    .X(\strobe_inbuf_0.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_1._0_  (.A(net12),
    .X(\strobe_inbuf_1.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_10._0_  (.A(net2),
    .X(\strobe_inbuf_10.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_11._0_  (.A(net3),
    .X(\strobe_inbuf_11.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_12._0_  (.A(net4),
    .X(\strobe_inbuf_12.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_13._0_  (.A(net5),
    .X(\strobe_inbuf_13.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_14._0_  (.A(net6),
    .X(\strobe_inbuf_14.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_15._0_  (.A(net7),
    .X(\strobe_inbuf_15.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_16._0_  (.A(net8),
    .X(\strobe_inbuf_16.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_17._0_  (.A(net9),
    .X(\strobe_inbuf_17.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_18._0_  (.A(net10),
    .X(\strobe_inbuf_18.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_19._0_  (.A(net11),
    .X(\strobe_inbuf_19.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_2._0_  (.A(net13),
    .X(\strobe_inbuf_2.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_3._0_  (.A(net14),
    .X(\strobe_inbuf_3.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_4._0_  (.A(net15),
    .X(\strobe_inbuf_4.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_5._0_  (.A(net16),
    .X(\strobe_inbuf_5.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_6._0_  (.A(net17),
    .X(\strobe_inbuf_6.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_7._0_  (.A(net18),
    .X(\strobe_inbuf_7.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_8._0_  (.A(net19),
    .X(\strobe_inbuf_8.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_inbuf_9._0_  (.A(net20),
    .X(\strobe_inbuf_9.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_0._0_  (.A(\strobe_inbuf_0.X ),
    .X(\strobe_outbuf_0.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_1._0_  (.A(\strobe_inbuf_1.X ),
    .X(\strobe_outbuf_1.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_10._0_  (.A(\strobe_inbuf_10.X ),
    .X(\strobe_outbuf_10.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_11._0_  (.A(\strobe_inbuf_11.X ),
    .X(\strobe_outbuf_11.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_12._0_  (.A(\strobe_inbuf_12.X ),
    .X(\strobe_outbuf_12.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_13._0_  (.A(\strobe_inbuf_13.X ),
    .X(\strobe_outbuf_13.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_14._0_  (.A(\strobe_inbuf_14.X ),
    .X(\strobe_outbuf_14.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_15._0_  (.A(\strobe_inbuf_15.X ),
    .X(\strobe_outbuf_15.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_16._0_  (.A(\strobe_inbuf_16.X ),
    .X(\strobe_outbuf_16.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_17._0_  (.A(\strobe_inbuf_17.X ),
    .X(\strobe_outbuf_17.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_18._0_  (.A(\strobe_inbuf_18.X ),
    .X(\strobe_outbuf_18.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_19._0_  (.A(\strobe_inbuf_19.X ),
    .X(\strobe_outbuf_19.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_2._0_  (.A(\strobe_inbuf_2.X ),
    .X(\strobe_outbuf_2.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_3._0_  (.A(\strobe_inbuf_3.X ),
    .X(\strobe_outbuf_3.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_4._0_  (.A(\strobe_inbuf_4.X ),
    .X(\strobe_outbuf_4.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_5._0_  (.A(\strobe_inbuf_5.X ),
    .X(\strobe_outbuf_5.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_6._0_  (.A(\strobe_inbuf_6.X ),
    .X(\strobe_outbuf_6.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_7._0_  (.A(\strobe_inbuf_7.X ),
    .X(\strobe_outbuf_7.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_8._0_  (.A(\strobe_inbuf_8.X ),
    .X(\strobe_outbuf_8.X ));
 sky130_fd_sc_hd__clkbuf_1 \strobe_outbuf_9._0_  (.A(\strobe_inbuf_9.X ),
    .X(\strobe_outbuf_9.X ));
endmodule


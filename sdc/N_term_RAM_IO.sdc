###############################################################################
# Created by write_sdc
# Sun Nov 24 23:03:05 2024
###############################################################################
current_design N_term_RAM_IO
###############################################################################
# Timing Constraints
###############################################################################
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {UserCLKo}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[19]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[18]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[17]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[16]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[15]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[14]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[13]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[12]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[11]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[10]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[9]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[8]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[7]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[6]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[5]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[4]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[3]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[2]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[1]}]
set_load -pin_load 0.0334 [get_ports {FrameStrobe_O[0]}]
set_load -pin_load 0.0334 [get_ports {S1BEG[3]}]
set_load -pin_load 0.0334 [get_ports {S1BEG[2]}]
set_load -pin_load 0.0334 [get_ports {S1BEG[1]}]
set_load -pin_load 0.0334 [get_ports {S1BEG[0]}]
set_load -pin_load 0.0334 [get_ports {S2BEG[7]}]
set_load -pin_load 0.0334 [get_ports {S2BEG[6]}]
set_load -pin_load 0.0334 [get_ports {S2BEG[5]}]
set_load -pin_load 0.0334 [get_ports {S2BEG[4]}]
set_load -pin_load 0.0334 [get_ports {S2BEG[3]}]
set_load -pin_load 0.0334 [get_ports {S2BEG[2]}]
set_load -pin_load 0.0334 [get_ports {S2BEG[1]}]
set_load -pin_load 0.0334 [get_ports {S2BEG[0]}]
set_load -pin_load 0.0334 [get_ports {S2BEGb[7]}]
set_load -pin_load 0.0334 [get_ports {S2BEGb[6]}]
set_load -pin_load 0.0334 [get_ports {S2BEGb[5]}]
set_load -pin_load 0.0334 [get_ports {S2BEGb[4]}]
set_load -pin_load 0.0334 [get_ports {S2BEGb[3]}]
set_load -pin_load 0.0334 [get_ports {S2BEGb[2]}]
set_load -pin_load 0.0334 [get_ports {S2BEGb[1]}]
set_load -pin_load 0.0334 [get_ports {S2BEGb[0]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[15]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[14]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[13]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[12]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[11]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[10]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[9]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[8]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[7]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[6]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[5]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[4]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[3]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[2]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[1]}]
set_load -pin_load 0.0334 [get_ports {S4BEG[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {UserCLK}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[19]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[18]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[17]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {FrameStrobe[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N1END[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N1END[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N1END[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N1END[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2END[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2END[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2END[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2END[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2END[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2END[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2END[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2END[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2MID[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2MID[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2MID[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2MID[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2MID[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2MID[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2MID[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N2MID[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {N4END[0]}]
###############################################################################
# Design Rules
###############################################################################
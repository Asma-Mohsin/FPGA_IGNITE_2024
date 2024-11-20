#!/bin/bash

verilator  --lint-only  -Wall  --Wno-DECLFILENAME  --top-module summer_school_top_wrapper verilog/rtl/*.v verilog/rtl/black_box_modules/*.v verilog/rtl/Tile/N_term_single/*.v verilog/rtl/Tile/N_term_RAM_IO/*.v verilog/rtl/Tile/LUT4AB/*.v verilog/rtl/Tile/RAM_IO/*.v verilog/rtl/Tile/S_term_single/*.v verilog/rtl/Tile/S_term_RAM_IO/*.v verilog/rtl/Tile/W_IO/*.v verilog/rtl/Tile/*.v -Wno-fatal --relative-includes > lint.log 2>&1

`timescale 1ns/1ps
module toplevel ( input reset_n,
               input uart0_rxd,
               input system_clk,
               input system_clk_locked,
               output reg uart0_txd);

   always @ (posedge system_clk)
      case ({reset_n,uart0_rxd})
         2'b00 :  uart0_txd <= uart0_rxd;
         2'b01 :  uart0_txd <= 0;
         2'b10 :  uart0_txd <= 1;
         2'b11 :  uart0_txd <= ~uart0_txd;
         default: uart0_txd <= uart0_rxd;
      endcase
endmodule

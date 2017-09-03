`timescale 1ns / 1ps

module toplevel(
    input io_e3, // clk
    input io_c12, // reset
    output io_c4, // uart - txd
    input io_d4,  // uart - rxd
    output [7:0] io_led
  );
  
  wire [31:0] io_gpioA_read;
  wire [31:0] io_gpioA_write;
  wire [31:0] io_gpioA_writeEnable;

  assign io_led = io_gpioA_write[7 : 0];

  Murax murax ( 
    .io_asyncReset(0),
    .io_mainClk (io_e3),
    .io_jtag_tck(0),
    .io_jtag_tdi(0),
    .io_jtag_tdo(0),
    .io_jtag_tms(0),
    .io_gpioA_read(io_gpioA_read),
    .io_gpioA_write(io_gpioA_write),
    .io_gpioA_writeEnable(io_gpioA_writeEnable),
    .io_uart_txd(io_c4),
    .io_uart_rxd(io_d4)
  );		
endmodule

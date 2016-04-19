// $Id: $
// File name:   shift_register.sv
// Created:     2/23/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: 6 in the morning



module shift_register
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire d_orig,
	output reg [7:0] rcv_data
);


flex_stp_sr #(8,0) a0 (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .serial_in(d_orig), .parallel_out(rcv_data));

endmodule

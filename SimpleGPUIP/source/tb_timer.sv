// $Id: $
// File name:   tb_timer.sv
// Created:     2/29/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: tb_timer dawg
`timescale 1ns /10 ps
module tb_timer
();

	reg clk = 1;
	reg n_rst;
	reg d_edge;
	reg rcving;
	reg shift_enable;
	reg byte_received;
	integer i;
	//clock
	always
	begin
		#5 clk = 0;
		#5 clk = 1;
	end
	initial
	begin
		d_edge = 0;
		rcving = 0;
		n_rst = 0;
		#10;
		n_rst = 1;
		rcving = 1;
		#200;

	end

timer a2 (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), .shift_enable(shift_enable), .byte_received(byte_received));


endmodule
			


// $Id: $
// File name:   tb_Rasteriser.sv
// Created:     4/19/2016
// Author:      Kyle Diekhoff
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Testbench for the rasteriser module

`timescale 1 ns / 100 ps

module tb_Rasteriser
();

	// DUT Signals
	reg tb_clk;
	reg tb_reset;

	//Connections
	Rasteriser U1 (.clk(tb_clk),
			.reset(tb_reset));

	//Clock Signal
	always
	begin
		#2 tb_clk = !tb_clk;
	end

	initial
	begin
		tb_clk = 1'b0;
		tb_reset = 1'b0;
	end

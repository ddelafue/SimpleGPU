// $Id: $
// File name:   tb_AlphaBlender.sv
// Created:     4/19/2016
// Author:      Kyle Diekhoff
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: TestBench for the AlphaBlender
//

`timescale 1 ns / 100 ps

module tb_AlphaBlender
();
	
	// DUT Signals
	reg tb_clk;
	reg tb_n_rst;
	reg[18:0] tb_pixel_number;
	reg tb_pixel_ready;
	reg[7:0] tb_r;
	reg[7:0] tb_g;
	reg[7:0] tb_b;
	reg[7:0] tb_read_r;
	reg[7:0] tb_read_g;
	reg[7:0] tb_read_b;
	reg tb_frame_ready;
	wire tb_o_frame_ready;
	wire tb_read;
	wire tb_write;
	wire[7:0] tb_write_r;
	wire[7:0] tb_write_g;
	wire[7:0] tb_write_b;

endmodule 

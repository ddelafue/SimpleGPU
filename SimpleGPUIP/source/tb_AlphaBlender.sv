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
	reg tb_reset;
	reg[18:0] tb_pixel_number;
	reg tb_pixel_ready;
	reg[7:0] tb_r;
	reg[7:0] tb_g;
	reg[7:0] tb_b;
	reg[7:0] tb_a;
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

	//Connections
	AlphaBlender U1 (.clk(tb_clk), .reset(tb_reset), .pixel_number(tb_pixel_number), .pixel_ready(tb_pixel_ready), .r(tb_r), .g(tb_g), .b(tb_b), .a(tb_a), .read_r(tb_read_r), .read_g(tb_read_g), .read_b(tb_read_b), .frame_ready(tb_frame_ready), .o_frame_ready(tb_o_frame_ready), .read(tb_read), .write(tb_write), .write_r(tb_write_r), .write_g(tb_write_g), .write_b(tb_write_b));

	//Clock signal
	always
	begin
		#2 tb_clk = !tb_clk;
	end

endmodule 

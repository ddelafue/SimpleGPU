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
	reg tb_opcode_received;
	reg tb_frame_ready;
	reg tb_data_ready;
	reg tb_triangle_done;
	reg[15:0] tb_x1;
	reg[15:0] tb_y1;
	reg[15:0] tb_x2;
	reg[15:0] tb_y2;
	reg[15:0] tb_x3;
	reg[15:0] tb_y3;
	wire tb_clear;
	wire tb_count_up;
	wire tb_next_triangle;
	wire tb_load_texture;
	wire tb_get_rgba;
	wire tb_get_pixel;
	wire tb_get_line;
	wire [18:0] tb_pixel_number;
	wire tb_frame_ready_o;

	//Connections
	Rasteriser U1 (.clk(tb_clk),
			.reset(tb_reset),
			.opcode_received(tb_opcode_received),
			.frame_ready(tb_frame_ready),
			.data_ready(tb_data_ready),
			.triangle_done(tb_triangle_done),
			.x1(tb_x1),
			.y1(tb_y1),
			.x2(tb_x2),
			.y2(tb_y2),
			.x3(tb_x3),
			.y3(tb_y3),
			.clear(tb_clear),
			.count_up(tb_count_up),
			.next_triangle(tb_next_triangle),
			.load_texture(tb_load_texture),
			.get_rgba(tb_get_rgba),
			.get_pixel(tb_get_pixel),
			.pixel_number(tb_pixel_number),
			.frame_ready_o(tb_frame_ready_o));

	//Clock Signal
	always
	begin
		#2 tb_clk = !tb_clk;
	end

	initial
	begin
		tb_clk = 1'b0;
		tb_reset = 1'b0;
		#4;
		tb_opcode_received = 1'b1;
		#4;
		tb_opcode_received = 1'b0;
	end

endmodule

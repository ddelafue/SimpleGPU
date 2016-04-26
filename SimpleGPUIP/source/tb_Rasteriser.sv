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
	reg tb_finished;
	reg[15:0] tb_x1;
	reg[15:0] tb_y1;
	reg[15:0] tb_x2;
	reg[15:0] tb_y2;
	reg[15:0] tb_x3;
	reg[15:0] tb_y3;
	wire tb_next_triangle;
	wire tb_load_texture;
	wire tb_get_rgba;
	wire tb_get_pixel;
	wire [18:0] tb_pixel_number;
	wire tb_pixel_ready;
	wire tb_frame_ready_o;

	int test_case;

	// Edges
	reg [18:0] tb_next_triangle_e;
	reg [18:0] tb_load_texture_e;
	reg [18:0] tb_get_rgba_e;
	reg [18:0] tb_get_pixel_e;
	reg [18:0] tb_pixel_ready_e;
	reg [18:0] tb_frame_ready_o_e;

	/*
		module Rasteriser
		#(
			parameter CALC_WAIT = 8,
			parameter ALPHA_WAIT = 1,
			parameter TEXTURE_WAIT = 2,
			parameter LOG_MAX_WAIT = 3
		)
		(
			input wire clk,
			input wire reset,
			input wire opcode_received,
			input wire frame_ready,
			input wire data_ready,
			input wire finished,
			input wire [15:0] x1,
			input wire [15:0] y1,
			input wire [15:0] x2,
			input wire [15:0] y2,
			input wire [15:0] x3,
			input wire [15:0] y3,
			output reg next_triangle,
			output reg load_texture,
			output reg get_rgba,
			output reg get_pixel,
			output reg [18:0] pixel_number,
			output reg pixel_ready,
			output reg frame_ready_o
		);
	*/

	//Connections
	Rasteriser U1 (.clk(tb_clk),
			.reset(tb_reset),
			.opcode_received(tb_opcode_received),
			.frame_ready(tb_frame_ready),
			.data_ready(tb_data_ready),
			.finished(tb_finished),
			.x1(tb_x1),
			.y1(tb_y1),
			.x2(tb_x2),
			.y2(tb_y2),
			.x3(tb_x3),
			.y3(tb_y3),
			.next_triangle(tb_next_triangle),
			.load_texture(tb_load_texture),
			.get_rgba(tb_get_rgba),
			.get_pixel(tb_get_pixel),
			.pixel_number(tb_pixel_number),
			.pixel_ready(tb_pixel_ready),
			.frame_ready_o(tb_frame_ready_o));

	always_ff @ (negedge tb_reset, posedge tb_clk)
	begin
		if (tb_reset == 1'b0)
		begin
			tb_next_triangle_e <= '0;
			tb_load_texture_e <= '0;
			tb_get_rgba_e <= '0;
			tb_get_pixel_e <= '0;
			tb_pixel_ready_e <= '0;
			tb_frame_ready_o_e <= '0;
		end
		if (tb_next_triangle)
			tb_next_triangle_e <= tb_next_triangle_e + 1;
		else
			tb_next_triangle_e <= tb_next_triangle_e;

		if (tb_load_texture)
			tb_load_texture_e <= tb_load_texture_e + 1;
		else
			tb_load_texture_e <= tb_load_texture_e;

		if (tb_get_rgba)
			tb_get_rgba_e <= tb_get_rgba_e + 1;
		else
			tb_get_rgba_e <= tb_get_rgba_e;

		if (tb_get_pixel)
			tb_get_pixel_e <= tb_get_pixel_e + 1;
		else
			tb_get_pixel_e <= tb_get_pixel_e;
		
		if (tb_pixel_ready)
			tb_pixel_ready_e <= tb_pixel_ready_e + 1;
		else
			tb_pixel_ready_e <= tb_pixel_ready_e;
		
		if (tb_frame_ready_o)
			tb_frame_ready_o_e <= tb_frame_ready_o_e + 1;
		else
			tb_frame_ready_o_e <= tb_frame_ready_o_e;
	end

	task Reset_Edges;
	begin
		tb_next_triangle_e = '0;
		tb_load_texture_e = '0;
		tb_get_rgba_e = '0;
		tb_get_pixel_e = '0;
		tb_pixel_ready_e = '0;
		tb_frame_ready_o_e = '0;
	end
	endtask

	//Clock Signal
	always
	begin
		#2 tb_clk = !tb_clk;
	end

	task Check_Edges;
		input [18:0] expected_next_triangle;
		input [18:0] expected_load_texture;
		input [18:0] expected_get_rgba;
		input [18:0] expected_get_pixel;
		input [18:0] expected_pixel_ready;
		input [18:0] expected_frame_ready;
	begin
		assert (tb_next_triangle_e == expected_next_triangle)
			$info("Correct next_triangle %d", test_case);
		else
			$error("Wrong! next_triangle %d", test_case);
		
		assert (tb_load_texture_e == expected_load_texture)
			$info("Correct load_texture %d", test_case);
		else
			$error("Wrong! load_texture %d", test_case);
		
		assert (tb_get_rgba_e == expected_get_rgba)
			$info("Correct get_rgba %d", test_case);
		else
			$error("Wrong! get_rgba %d", test_case);
		
		assert (tb_get_pixel_e == expected_get_pixel)
			$info("Correct get_pixel %d", test_case);
		else
			$error("Wrong! get_pixel %d", test_case);
		
		assert (tb_pixel_ready_e == expected_pixel_ready)
			$info("Correct pixel_ready %d", test_case);
		else
			$error("Wrong! pixel_ready %d", test_case);
		
		assert (tb_frame_ready_o_e == expected_frame_ready)
			$info("Correct frame_ready %d", test_case);
		else
			$error("Wrong! frame_ready %d", test_case);
	end
	endtask

	/*
		task Check_Edges;
			input [18:0] expected_next_triangle;
			input [18:0] expected_load_texture;
			input [18:0] expected_get_rgba;
			input [18:0] expected_get_pixel;
			input [18:0] expected_pixel_ready;
			input [18:0] expected_frame_ready;
	*/

	initial
	begin
		Reset_Edges();
		tb_clk = 1'b0;
		tb_reset = 1'b0;
		tb_opcode_received = 1'b0;
		tb_frame_ready = 1'b0;
		tb_data_ready = 1'b0;
		tb_finished = 1'b0;
		tb_x1 = 16'd20;
		tb_y1 = 16'd10;
		tb_x3 = 16'd20;
		tb_y3 = 16'd20;
		tb_x2 = 16'd30;
		tb_y2 = 16'd10;
		test_case = 0;

		#4;

		// TEST CASE 1: A Regular right triangle
		test_case = test_case + 1;

		tb_reset = 1'b1;
		tb_opcode_received = 1'b1;
		#4;
		tb_opcode_received = 1'b0;
		#20;
		tb_data_ready = 1'b1;
		#4;
		tb_data_ready = 1'b0;
		#6000;
		Check_Edges('d2, 'd1, 'd55, 'd55, 'd66, 'b0);
		#4;
		Reset_Edges();

		// TEST CASE 2: An irregular right triangle
		test_case = test_case + 1;
		
		tb_data_ready = 1'b1;
		tb_x2 = 16'd24;
		#4;
		tb_data_ready = 1'b0;
		#6000;
		Check_Edges('b1, 'b1, 'd27, 'd27, 'd38, 'b0);
		#4;
		Reset_Edges();

		// TEST CASE 3: Sending the finished signal
		test_case = test_case + 1;

		tb_frame_ready = 1'b1;
		#4;
		tb_frame_ready = 1'b0;
		#16;
		tb_finished = 1'b1;
		#4;
		tb_finished = 1'b0;

		Check_Edges(1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1);
		#4;
		Reset_Edges();
		#4;
		
		// TEST CASE 4: A right triangle rotated 15 degrees
		test_case = test_case + 1;
		
		tb_x3 = 16'd17;
		tb_x2 = 16'd25;
		tb_y3 = 16'd20;
		tb_y2 = 16'd11;
		tb_opcode_received = 1'b1;
		#4;
		tb_opcode_received = 1'b0;
		#12;
		tb_data_ready = 1'b1;
		#4;
		tb_data_ready = 1'b0;
		#6000;
		Check_Edges('d2, 'b1, 'd47, 'd47, 'd57, 'b0);
		#4;
		Reset_Edges();
	end

endmodule

// $Id: $
// File name:   Rasteriser.sv
// Created:     4/19/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: The unit that will step through each pixel of a particular triangle.

module Rasteriser
#(
	parameter CALC_WAIT = 14,
	parameter ALPHA_WAIT = 1,
	parameter TEXTURE_WAIT = 2,
	parameter LOG_MAX_WAIT = 4
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

reg calc_1;
reg calc_2;
reg next_calc_1;
reg next_calc_2;
wire [15:0] x_out_1;
wire [15:0] y_out_1;
wire [15:0] x_out_2;
wire [15:0] y_out_2;
wire [15:0] x_out_3;
wire [15:0] y_out_3;
reg [15:0] x_bullshit1;
reg [15:0] y_bullshit1;
reg get_line_pixel;
wire end_1;
wire end_2;
wire end_3;
reg [LOG_MAX_WAIT - 1:0] wait1;
reg [LOG_MAX_WAIT - 1:0] next_wait;

	/*
		module DrawLine
		(
			input wire clk,
			input wire reset,
			input wire calculate,
			input wire [15:0] x1,
			input wire [15:0] y1,
			input wire [15:0] x2,
			input wire [15:0] y2,
			input wire get_pixel,
			output reg [15:0] x_o,
			output reg [15:0] y_o,
			output reg line_complete
		);
	*/

DrawLine d1 (.clk(clk),
		.reset(reset),
		.calculate(calc_1),
		.x1(x1),
		.y1(y1),
		.x2(x3),
		.y2(y3),
		.get_pixel(get_line_pixel),
		.x_o(x_out_1),
		.y_o(y_out_1),
		.line_complete(end_1));

DrawLine d2 (.clk(clk),
		.reset(reset),
		.calculate(calc_1),
		.x1(x2),
		.y1(y2),
		.x2(x3),
		.y2(y3),
		.get_pixel(get_line_pixel),
		.x_o(x_out_2),
		.y_o(y_out_2),
		.line_complete(end_2));

DrawLine d3 (.clk(clk),
		.reset(reset),
		.calculate(calc_2),
		.x1(x_out_1),
		.y1(y_out_1),
		.x2(x_out_2),
		.y2(y_out_2),
		.get_pixel(get_pixel),
		.x_o(x_out_3),
		.y_o(y_out_3),
		.line_complete(end_3));

typedef enum bit [4:0] {
						IDLE,
						GET,
						WAIT,
						IN_XY,
						CALC,
						WAIT_C,
						READY,
						ALPHA,
						GET_PIX,
						TEXTURE,
						DONE,
						READY2,
						ALPHA2,
						FRAME,
						SD,
						READY3,
						ALPHA3
						} states;
states state = IDLE;
states next_state = IDLE;

always_ff @ (posedge clk, negedge reset)
begin
	if (reset == 1'b0)
	begin
		calc_1 <= '0;
		calc_2 <= '0;
		state <= IDLE;
		wait1 <= '0;
	end
	else
	begin
		calc_1 <= next_calc_1;
		calc_2 <= next_calc_2;
		wait1 <= next_wait;
		state <= next_state;
	end
end

always_comb
begin : NEXT_STATE_LOGIC
	next_state = state;
	next_wait = '0;
	case(state)
		IDLE:
			if (opcode_received)
				next_state = GET;
		GET:
			next_state = WAIT;
		WAIT:
		begin
			if (frame_ready)
				next_state = FRAME;
			else if (data_ready)
				next_state = IN_XY;
		end
		IN_XY:
			next_state = CALC;
		CALC:
			next_state = WAIT_C;
		WAIT_C:
		begin
			if (end_1 || end_2)
				next_state = READY2;
			else if (wait1 == CALC_WAIT - 1)
				next_state = READY;
			else
				next_wait = wait1 + 1;
		end
		READY:
			next_state = ALPHA;
		ALPHA:
		begin
			if (wait1 == ALPHA_WAIT - 1)
				next_state = GET_PIX;
			else
				next_wait = wait1 + 1;
		end
		GET_PIX:
			next_state = TEXTURE;
		TEXTURE:
		begin
			if (end_3)
				next_state = READY3;
			else if (wait1 == TEXTURE_WAIT - 1)
				next_state = READY;
			else
				next_wait = wait1 + 1;
		end
		READY3:
			next_state = ALPHA3;
		ALPHA3:
		begin
			if (wait1 == ALPHA_WAIT - 1)
				next_state = DONE;
			else
				next_wait = wait1 + 1;
		end
		DONE:
			next_state = WAIT_C;
		READY2:
			next_state = ALPHA2;
		ALPHA2:
		begin
			if (wait1 == ALPHA_WAIT - 1)
				next_state = GET;
			else
				next_wait = wait1 + 1;
		end
		FRAME:
			next_state = SD;
		SD:
		begin
			if (finished)
				next_state = IDLE;
		end
		default:
			next_state = IDLE;
	endcase
end

always_comb
begin : OUTPUT_LOGIC
	next_triangle = 1'b0;
	load_texture = 1'b0;
	get_rgba = 1'b0;
	get_pixel = 1'b0;
	frame_ready_o = 1'b0;
	next_calc_1 = 1'b0;
	next_calc_2 = 1'b0;
	get_line_pixel = 1'b0;
	pixel_ready = 1'b0;
	case(state)
		GET:
			next_triangle = 1'b1;
		IN_XY:
		begin
			load_texture = 1'b1;
			next_calc_1 = 1'b1;
		end
		WAIT_C:
			next_calc_2 = 1'b1;
		READY:
			pixel_ready = 1'b1;
		GET_PIX:
		begin
			get_rgba = 1'b1;
			get_pixel = 1'b1;
		end
		READY3:
			pixel_ready = 1'b1;
		DONE:
			get_line_pixel = 1'b1;
		READY2:
			pixel_ready = 1'b1;
		FRAME:
			frame_ready_o = 1'b1;
	endcase
end

always_comb
begin
	x_bullshit1 = x_out_3;
	y_bullshit1 = y_out_3;
	pixel_number = 18'd640 * y_bullshit1 + x_bullshit1;
end

endmodule

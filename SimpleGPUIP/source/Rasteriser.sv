// $Id: $
// File name:   Rasteriser.sv
// Created:     4/19/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: The unit that will step through each pixel of a particular triangle.

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
wire [15:0] x_out_1;
wire [15:0] y_out_1;
wire [15:0] x_out_2;
wire [15:0] y_out_2;
wire [15:0] x_out_3;
wire [15:0] y_out_3;
reg get_line_pixel;
wire end_1;
wire end_2;
wire end_3;
reg [LOG_MAX_WAIT - 1:0] wait;
reg [LOG_MAX_WAIT - 1:0] next_wait;


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
		state <= IDLE;
		wait <= '0;
	end
	else
	begin
		wait <= next_wait;
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
			else if (wait == CALC_WAIT - 1)
				next_state = READY;
			else
				next_wait = wait + 1;
		end
		READY:
			next_state = ALPHA;
		ALPHA:
		begin
			if (wait == ALPHA_WAIT - 1)
				next_state = GET_PIX;
			else
				next_wait = wait + 1;
		end
		GET_PIX:
			next_state = TEXTURE;
		TEXTURE:
		begin
			if (end_3)
				next_state = READY3;
			else if (wait == TEXTURE_WAIT - 1)
				next_state = READY;
			else
				next_wait = wait + 1;
		end
		READY3:
			next_state = ALPHA3;
		ALPHA3:
		begin
			if (wait == ALPHA_WAIT - 1)
				next_state = DONE;
			else
				next_wait = wait + 1;
		end
		DONE:
			next_state = WAIT_C;
		READY2:
			next_state = ALPHA2;
		ALPHA2:
		begin
			if (wait == ALPHA_WAIT - 1)
				next_state = GET;
			else
				next_wait = wait + 1;
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
	calc_1 = 1'b0;
	calc_2 = 1'b0;
	get_line_pixel = 1'b0;
	case(state)
		GET:
			next_triangle = 1'b1;
		IN_XY:
			calc_1 = 1'b1;
		WAIT_C:
			calc_2 = 1'b1;
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
	pixel_number = 640 * y_out_3 + x_out_3;
end

endmodule

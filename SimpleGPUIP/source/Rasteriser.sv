// $Id: $
// File name:   Rasteriser.sv
// Created:     4/19/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: The unit that will step through each pixel of a particular triangle.

module Rasteriser
#(
	parameter CALC_WAIT = 1
)

(
	input wire clk,
	input wire reset,
	input wire opcode_received,
	input wire frame_ready,
	input wire data_ready,
	input wire triangle_done,
	input wire [15:0] x1,
	input wire [15:0] y1,
	input wire [15:0] x2,
	input wire [15:0] y2,
	input wire [15:0] x3,
	input wire [15:0] y3,
	output reg clear,
	output reg count_up,
	output reg next_triangle,
	output reg load_texture,
	output reg get_rgba,
	output reg get_pixel,
	output reg get_line,
	output reg [18:0] pixel_number,
	output wire frame_ready_o
);


int calc_wait = 0;
reg calc_1 = 1'b0;
reg calc_2 = 1'b0;
reg [15:0] x_out_1;
reg [15:0] y_out_1;
reg [15:0] x_out_2;
reg [15:0] y_out_2;
reg [15:0] x_out_3;
reg [15:0] y_out_3;
reg get_line_pixel = 1'b0;
reg end_1;
reg end_2;
reg end_3;


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

typedef enum bit [2:0] {IDLE,IN_XY,CALC,WAIT_C,GET_PIX,SEND_PIX,DONE} states;
states state = IDLE;
states next_state = IDLE;

always_ff @ (posedge clk, negedge reset)
begin
	if (reset == 1'b0)
	begin
		state <= IDLE;
	end
	else
	begin
		state <= next_state;
	end
end

always_comb
begin
	get_pixel = 1'b0;
	next_state = IDLE;
	case(state)
		IDLE:
		begin
			if(opcode_received == 1'b1)
			begin
				next_state = IN_XY;
			end
			calc_wait = 0;
		end
		IN_XY:
		begin
			next_state = CALC;
		end
		CALC:
		begin
			next_state = WAIT_C;
			calc_1 = 1'b1;
		end
		WAIT_C:
		begin
			calc_1 = 1'b0;
			if(calc_wait == CALC_WAIT)
			begin
				next_state = GET_PIX;
				calc_wait = 0;
			end
			else
			begin
				next_state = WAIT_C;
				calc_wait = calc_wait + 1;
			end
		end
		GET_PIX:
		begin
			next_state = SEND_PIX;
			get_pixel = 1'b1;
		end
		SEND_PIX:
		begin
			get_pixel = 1'b0;
			next_state = GET_PIX;
		end
	endcase
end

endmodule

// $Id: $
// File name:   Rasteriser.sv
// Created:     4/19/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: The unit that will step through each pixel of a particular triangle.

module Rasteriser
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

typedef enum bit [2:0] {IDLE,IN_XY,GET_PIX,SEND_PIX,DONE} states;
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
		end
		IN_XY:
		begin
			next_state = GET_PIX;
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

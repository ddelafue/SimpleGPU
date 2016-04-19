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
	output reg [18:0] pixel_number
);

endmodule

// $Id: $
// File name:   AlphaBlender.sv
// Created:     4/18/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Alpha Blender Module

module AlphaBlender
(
	input wire [18:0] pixel_number,
	input wire pixel_ready,
	input wire [7:0] r,
	input wire [7:0] g,
	input wire [7:0] b,
	input wire [7:0] read_r,
	input wire [7:0] read_g,
	input wire [7:0] read_b,
	input wire frame_ready,
	output wire o_frame_ready,
	output wire read,
	output reg write,
	output wire [7:0] write_r,
	output wire [7:0] write_g,
	output wire [7:0] write_b
);

	

endmodule

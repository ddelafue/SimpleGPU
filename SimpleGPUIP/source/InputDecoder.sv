// $Id: $
// File name:   InputDecoder.sv
// Created:     4/23/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: A module for controlling the input from the Atom processor and decoding the protocol.

module InputDecoder
(	
	input wire clk,
	input wire reset,
	input wire write,
	input wire [31:0] w_data,
	input wire next_triangle,
	output reg opcode_received,
	output reg frame_ready,
	output reg data_ready,
	output reg [15:0] x1,
	output reg [15:0] y1,
	output reg [15:0] x2,
	output reg [15:0] y2,
	output reg [15:0] x3,
	output reg [15:0] y3,
	output reg [7:0] TexNum
);

endmodule

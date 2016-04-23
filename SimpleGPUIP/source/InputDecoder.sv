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
	input wire fifo_write,
	input wire [31:0] fifo_w_data,
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

	wire fifo_read, fifo_empty, fifo_full;
	wire [31:0] fifo_r_data;

	/*
		module InputDecoder_fifo_RAM
		(
			input wire clk,
			input wire reset,
			input wire write,
			input wire read,
			input wire [31:0] w_data,
			output wire [31:0] r_data,
			output reg empty,
			output reg full
		);
	*/

	InputDecoder_fifo_RAM RAM (
							.clk(clk),
							.reset(reset),
							.write(fifo_write),
							.read(fifo_read),
							.w_data(fifo_w_data),
							.r_data(fifo_r_data),
							.empty(fifo_empty),
							.full(fifo_full)
							);

	
	

endmodule

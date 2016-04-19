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
	input wire clk,
	input wire reset,
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

wire [7:0] max = 8'b11111111;
wire [7:0] subr;
wire [7:0] subg;
wire [7:0] subb;
wire [7:0] mul1r;
wire [7:0] mul2r;
wire [7:0] mul1g;
wire [7:0] mul2g;
wire [7:0] mul1b;
wire [7:0] mul2b;
wire [7:0] addr;
wire [7:0] addg;
wire [7:0] addb;


subr = fpga_sub red1 (.dataa(max), .datab(


endmodule

// $Id: $
// File name:   AlphaBlender.sv
// Created:     4/18/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Alpha Blender Module

module AlphaBlender
#(
	parameter CLKWAIT = 2
)
(
	input wire [16:0] pixel_number,
	input wire pixel_ready,
	input wire [7:0] r,
	input wire [7:0] g,
	input wire [7:0] b,
	input wire [7:0] a,
	input wire [7:0] read_r,
	input wire clk,
	input wire reset,
	input wire [7:0] read_g,
	input wire [7:0] read_b,
	input wire frame_ready,
	input wire finished,
	output wire o_frame_ready,
	output wire read,
	output wire write,
	output reg [7:0] write_r,
	output reg [7:0] write_g,
	output reg [7:0] write_b,
	output wire [16:0] pixel_number_o,
	output wire finished_o
);

wire [7:0] max = 8'b11111111;
wire [7:0] subr;
wire [7:0] subg;
wire [7:0] subb;
reg [15:0] mul1r;
wire [7:0] mul2r;
reg [15:0] mul1g;
wire [7:0] mul2g;
reg [15:0] mul1b;
wire [7:0] mul2b;
wire [7:0] addr;
wire [7:0] addg;
wire [7:0] addb;
wire [7:0] blankremainder;

reg [CLKWAIT - 1:0] wtime;

assign write = wtime[CLKWAIT - 1];
assign pixel_number_o = pixel_number;
assign finished_o = finished;

always_ff @ (negedge reset, posedge clk)
begin
	if(reset == 1'b0)
	begin
		for (int i = 0; i < CLKWAIT; i = i + 1)
		begin
			wtime <= 1'b0;
		end
	end
	else
	begin
		wtime[0] <= pixel_ready;
		for (int i = 1; i < CLKWAIT; i = i + 1)
		begin
			wtime[i] <= wtime[i - 1];
		end
	end
end

	




assign read = pixel_ready;
assign o_frame_ready = frame_ready; 

always_comb
begin
	mul1r = read_r*(max - a) + r*a;
	write_r = mul1r/max;
	mul1g = read_g*(max - a) + g*a;
	write_g = mul1g/max;
	mul1b = read_b*(max - a) + b*a;
	write_b = mul1b/max;
end



















endmodule

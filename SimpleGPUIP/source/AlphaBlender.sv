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
	input wire [18:0] pixel_number,
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
wire [7:0] blankremainder;
int i = 0


always_ff @ (negedge reset, posedge clk)
begin
	if(i < CLKWAIT)
	begin
		i = i + 1
	end

	else
	begin
		write <= pixel_ready
		i = 0
end

	




assign read = pixel_ready
assign 
fpga_sub redsub1 (.dataa(max), .datab(a), .result(subr));
fpga_sub greensub1 (.dataa(max), .datab(a), .result(subg));
fpga_sub bluesub1 (.dataa(max), .datab(a), .result(subb));
fpga_mult redmul1 (.dataa(read_r), .datab(subr), .result(mul1r));
fpga_mult greenmul1 (.dataa(read_g), .datab(subg), .result(mul1g));
fpga_mult bluemul1 (.dataa(read_b), .datab(subb), .result(mul1b));
fpga_mult redmul2 (.dataa(r), .datab(a), .result(mul2r));
fpga_mult greenmul2 (.dataa(g), .datab(a), .result(mul2g));
fpga_mult bluemul2 (.dataa(b), .datab(a), .result(mul2b));
fpga_add redadd (.dataa(mul1r), .datab(mul2r), .result(addr));
fpga_add greenadd (.dataa(mul1g), .datab(mul2g), .result(addg));
fpga_add blueadd (.dataa(mul1b), .datab(mul2b), .result(addb));
fpga_divide reddiv (.denom(max), .numer(addr), .quotient(write_r), .remain(blankremainder);
fpga_divide greendiv (.denom(max), .numer(addg), .quotient(write_g), .remain(blankremainder));
fpga_divide bluediv (.denom(max), .numer(addb), .quotient(write_b), .remain(blankremainder));



















endmodule

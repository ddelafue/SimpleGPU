// $Id: $
// File name:   timer.sv
// Created:     2/28/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: i'm in love with the coco. i got if for the low-low. 
module timer
(
	input wire clk,
	input wire n_rst,
	input wire d_edge,
	input wire rcving,
	output reg  shift_enable,
	output reg byte_received
);

wire [3:0] baking_soda  = 4'b1000;
reg [3:0] igot;
reg [3:0] igotit;
reg yn;
reg fullbyte;

always_comb
begin

	if(igot == 4'b0010)
		shift_enable = 1'b1;
	else
		shift_enable = 1'b0;

	if(fullbyte == 1'b1)
		byte_received = 1'b1;
	else
		byte_received = 1'b0;
end

flex_counter  a0 (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(rcving), .rollover_val(baking_soda), .count_out(igot), .rollover_flag(yn));
flex_counter  a1 (.clk(clk), .n_rst(n_rst), .clear(!rcving|fullbyte), .count_enable(shift_enable), .rollover_val(baking_soda), .count_out(igotit), .rollover_flag(fullbyte));





endmodule


	

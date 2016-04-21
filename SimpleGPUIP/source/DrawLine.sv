// $Id: $
// File name:   DrawLine.sv
// Created:     4/19/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: A sub-module for stepping through each pixel of a line.

module DrawLine
(
	input wire [15:0] x1,
	input wire [15:0] y1,
	input wire [15:0] x2,
	input wire [15:0] y2,
	input wire get_pixel,
	output reg [15:0] x_o,
	output reg [15:0] y_o
);
//Don't need this many registers just don't feel like doing max math now
reg[15:0] delta_x;
reg[15:0] delta_y;
reg[15:0] min;
reg[15:0] max;
reg[15:0] pixels_in_group;
reg[15:0] pixels_missing;
reg[15:0] a;

always_comb
begin
	delta_x = x2 - x1;
	delta_y = y2 - y1;
	if (delta_x[15] ==  1'b1)
	begin
		delta_x = delta_x * -1;
	end
	if (delta_y[15] == 1'b1)
	begin
		delta_y = delta_y * -1;
	end
	if (delta_y > delta_x)
	begin
		min = delta_x;
		max = delta_y;
	end
	else
	begin
		min = delta_y;
		max = delta_x;
	end
	pixels_in_group = max / (min + 1);
	pixels_missing = max - (min) * pixels_in_group;
	a = max / (pixels_missing + 1);
end	

endmodule

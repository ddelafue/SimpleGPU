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

always_comb
begin
	x_o = x2 - x1;
	y_o = y2 - y1;
end	

endmodule

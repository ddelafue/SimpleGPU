// $Id: $
// File name:   tb_DrawLine.sv
// Created:     4/19/2016
// Author:      Kyle Diekhoff
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Test bench for the draw line component

`timescale 1 ns / 100 ps

module tb_DrawLine
();

	// DUT Signals
	reg[15:0] tb_x1;
	reg[15:0] tb_y1;
	reg[15:0] tb_x2;
	reg[15:0] tb_y2;
	reg tb_get_pixel;
	wire[15:0] tb_x_o;
	wire[15:0] tb_y_o;

	//Connections
	DrawLine U1 (.x1(tb_x1),
			.y1(tb_y1),
			.x2(tb_x2),
			.y2(tb_y2),
			.get_pixel(tb_get_pixel),
			.x_o(tb_x_o),
			.y_o(tb_y_o));

endmodule
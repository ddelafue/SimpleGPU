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
	reg tb_clk;
	reg tb_reset;
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

	//Clock Signal
	always
	begin
		#2 tb_clk = !tb_clk;
	end

	initial
	begin
		//Initializations
		tb_clk = 1'b0;
		tb_reset = 1'b0;
		tb_x1 = 16'd100;
		tb_x2 = 16'd50;
		tb_y1 = 16'd90;
		tb_y2 = 16'd100;
		
		#4;
		tb_reset = 1'b1;
		#4;
		tb_reset = 1'b0;
		tb_x1 = 16'd90;
		tb_x2 = 16'd100;
		tb_y1 = 16'd100;
		tb_y2 = 16'd50;
		#4
		tb_reset = 1'b1;
	end

endmodule

// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/23/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: no
`timescale 1 ns / 100 ps
module tb_eop_detect
();
	reg d_plus;
	reg d_minus;
	reg eop;
	reg clk = 1;
	reg i = 0;
always
begin
	#1 clk = 0;
	#1 clk = 1;
end

initial
begin
//Test1
	for(i = 0; i<4; i++)
	begin
		d_plus = 0;
		d_minus = 0;
		#2;
		d_plus = 0;
		d_minus = 1;
		#2;
		d_plus = 1;
		d_minus = 0;
		#2;
		d_plus = 1;
		d_minus = 1;
		#2;
	end
end

eop_detect A0 (d_plus, d_minus, eop);
endmodule

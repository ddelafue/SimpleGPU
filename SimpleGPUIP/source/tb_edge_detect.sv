// $Id: $
// File name:   tb_edge_detect.sv
// Created:     2/23/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: no
`timescale 1ns / 10 ps
module tb_edge_detect
();
	reg clk = 1;
	reg  n_rst;
	reg  d_plus;
	reg  d_edge;

//Clock
always
begin
	#5 clk = 0;
	#5 clk = 1;
end

initial
begin
//Test1
	n_rst = 0;
	d_plus = 0;
	#10;
	n_rst = 1;
	d_plus = 1;
	#10;
	d_plus = 1;
	#10;
	d_plus = 1;
	#10;
	d_plus = 0;
	#10;
	d_plus = 0;
	#10;
	d_plus = 1;
	#10;
	d_plus = 1;
	#10;
	d_plus = 0;
	#10;
	d_plus = 1;
	#10;
end

edge_detect A0(clk, n_rst, d_plus, d_edge);


endmodule



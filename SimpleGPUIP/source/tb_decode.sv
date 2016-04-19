// $Id: $
// File name:   tb_decode.sv
// Created:     2/23/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: decode
`timescale 1ns / 10 ps 
module tb_decode
();
	reg clk = 1;
	reg n_rst;
	reg d_plus;
	reg shift_enable;
	reg eop;
	reg d_orig;

	//Clock
	always
	begin
		#5 clk = 0;
		#5 clk = 1;
	end

	initial
	begin
	//Test1 does reset work
		d_plus = 1;
		n_rst = 0;
		eop = 0;
		shift_enable =0;
		#10;
		n_rst = 1;
		#10;
	//Test2 test to see if the basic edge works, 
		d_plus = 0;
		#10;
		//should now be a 0 kk
		d_plus = 1;
		#10;
		d_plus = 0;
		#10;
		shift_enable = 1;
		#10;
	    shift_enable = 0;
		#10;
		d_plus = 1;
		#10;
		d_plus = 1;
		#10;
		shift_enable =1;
		#10;
		shift_enable = 0;
		#10; 
		shift_enable = 1;
		#10;
		shift_enable = 0;
		#20;
		shift_enable = 1;
		eop = 1;
		#10;
		eop = 0;
		shift_enable = 0;
		#10;


	end

decode A0(clk,n_rst,d_plus,shift_enable,eop,d_orig);


endmodule



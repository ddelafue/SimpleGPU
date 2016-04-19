// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     2/29/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: falco punch
`timescale 1ns / 10 ps
module tb_usb_receiver
();
	reg clk = 1;
	reg n_rst;
	reg d_plus;
	reg d_minus;
	reg r_enable;
	reg [7:0] r_data;
	reg empty;
	reg full;
	reg rcving;
	reg r_error;
	reg [7:0] test;
	integer i;
	integer j;
	//Clock
	always
	begin
		#5 clk = 0;
		#5 clk = 1;
	end
	initial
	begin
		n_rst = 1'b0;
		d_plus = 1'b1;
		d_minus = 1'b0;
		r_enable = 1'b0;
		#10
		n_rst = 1'b1;
		#10;
		for(i = 0; i< 7; i++)
		begin
			d_plus = ~d_plus;
			d_minus = ~d_minus;
			#80;
		end
		#720;
		i = 0;
		test = 8'b11001100;
		for(i = 0; i<8; i++)
		begin
			d_plus = test[i];
			d_minus = ~ d_plus;
			#80;
		end
		r_enable = 1'b1;
		#10;
		r_enable = 1'b0;
		#10;
		d_plus = 0;
		d_minus = 0;
		#80;
		r_enable = 1'b0;
		d_plus = 1;
		d_minus = 0;
		#80;
		d_plus = 0;
		d_minus = 1;
		#80;

	


	end

usb_receiver A1 (clk, n_rst,d_plus, d_minus, r_enable, r_data, empty, full, rcving, r_error);

endmodule

		

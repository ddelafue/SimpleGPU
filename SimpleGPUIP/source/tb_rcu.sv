// $Id: $
// File name:   tb_rcu.sv
// Created:     2/29/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: rcu
`timescale 1ns / 10 ps
module tb_rcu
();
	reg clk = 1;
	reg n_rst;
	reg d_edge;
	reg eop;
	reg shift_enable;
	reg [7:0] rcv_data;
	reg byte_received;
	reg rcving;
	reg w_enable;
	reg r_error;

	//Clock
	always
	begin
		#5 clk = 0;
		#5 clk = 1;
	end

	initial
	begin
		rcv_data = 8'b00000000;
		d_edge = 0;
		byte_received = 0;
		shift_enable = 0;
		n_rst = 0;
		//everything is set to zero hopefully
		#10;
		//from idle to S_CAP
		n_rst = 1;
		d_edge = 1'b1;
		#10;
		//scap to schk
		d_edge = 0;
		rcv_data = 8'b00000001;
		byte_received = 1'b1;
		#10;
		//check if sync is bueno
		#10;
		byte_received = 1'b1;
		#10;
		#10;
		shift_enable = 1'b1;
		eop =1'b1;
		#10;//to wait3a
		#10;//to eop1
		eop = 1'b0;
		#10;
	end
rcu A0(.clk(clk),.n_rst(n_rst),.d_edge(d_edge),.eop(eop),.shift_enable(shift_enable),.rcv_data(rcv_data),.byte_received(byte_received),.rcving(rcving),.w_enable(w_enable),.r_error(r_error));

endmodule
	







	

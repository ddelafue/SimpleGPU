// $Id: $
// File name:   tb_GPU.sv
// Created:     4/25/2016
// Author:      Kyle Diekhoff
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: There is a thing to write the thing
// for real though this is the test bench for the GPU
// it will be done as said so in the bible

`timescale 1 ns / 100 ps

module tb_GPU
();

	// DUT Signals
	reg tb_clk;
	reg tb_reset;
	reg[31:0] tb_fifo_write_data;
	reg tb_fifo_write;
	reg tb_SD_waitrequest;
	wire tb_SD_write;
	wire[31:0] tb_SD_wdata;
	wire [21:0] tb_SD_address;

	int i;

	//Connections
	GPU U1 (.clk(tb_clk),
		.reset(tb_reset),
		.fifo_write_data(tb_fifo_write_data),
		.fifo_write(tb_fifo_write),
		.SD_waitrequest(tb_SD_waitrequest),
		.SD_write(tb_SD_write),
		.SD_wdata(tb_SD_wdata),
		.SD_address(tb_SD_address));

	//Clock Signal
	always
	begin
		#2 tb_clk = !tb_clk;
	end

	initial
	begin
		f = $fopen("test_1.txt","w");
		tb_clk = 1'b0;
		tb_reset = 1'b0;
		tb_fifo_write = 1'b0;
		tb_SD_waitrequest = 1'b0;
		tb_fifo_write_data = 32'b00010000000000000000000000000010;
		#4;
		tb_reset = 1'b1;
		#4;
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write_data = 32'b00000000000111100000000001100100;
		#4;
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write_data = 32'b00000000100000100000000001100100;
		#4;
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write_data = 32'b00000000000111100000000000000000;
		#4;
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write_data = 32'b00000000000101000000000000001010;
		#4;
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write_data = 32'b00000000000111100000000000001010;
		#4;
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write_data = 32'b00000000000101000000000000010100;
		#4;
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write_data = 32'b00100000000000000000000000000000;
		#4;
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		
	end

always_ff @ (posedge tb_SD_write)
begin
	
end

endmodule

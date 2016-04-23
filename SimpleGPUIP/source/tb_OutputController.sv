// $Id: $
// File name:   tb_OutputController.sv
// Created:     4/20/2016
// Author:      Kyle Diekhoff
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: The test bench for the Output Controller

`timescale 1 ns / 100 ps

module tb_OutputController.sv
();

	// DUT Signals
	reg tb_n_rst;
	reg tb_clk;
	reg[7:0] tb_write_r;
	reg[7:0] tb_write_g;
	reg[7:0] tb_write_b;
	reg tb_write;
	reg tb_read;
	reg tb_frame_ready;
	reg [7:0] tb_Pixel_Number;
	wire [7:0] tb_read_r;
	wire [7:0] tb_read_g;
	wire [7:0] tb_read_b;
	wire [31:0] tb_M9_wdata;
	wire [31:0] tb_M9_rdata;
	reg  tb_M9_write;
	reg tb_waitrequest;
	wire [25:0] tb_SD_address;
	wire [31:0] tb_SD_wdata;
	reg SD_write;
	//? im not sure how to initialize the read and write address but this is what I think
	reg [16:0] tb_read_address;
	reg [16:0] tb_write_address;
	reg waitrequest;
	wire SD_write;



	



	

		

endmodule

// $Id: $
// File name:   tb_OutputController.sv
// Created:     4/20/2016
// Author:      Kyle Diekhoff
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: The test bench for the Output Controller

`timescale 1 ns / 100 ps

module tb_OutputController
();

	// DUT Signals
	reg tb_n_rst;
	reg tb_clk;
	reg[7:0] tb_write_r;
	reg[7:0] tb_write_g;
	reg[7:0] tb_write_b;
	reg tb_M9_write;
	reg tb_read;
	reg tb_frame_ready;
	reg [16:0] tb_Pixel_Number;
	wire [7:0] tb_read_r;
	wire [7:0] tb_read_g;
	wire [7:0] tb_read_b;
	reg tb_waitrequest;
	wire [27:0] tb_SD_address;
	wire [31:0] tb_SD_wdata;
	wire  tb_SD_write;
	//? im not sure how to initialize the read and write address but this is what I think
	wire tb_finished;
	reg [16:0] count;
	reg hello;
	reg [25:0] nope;
	//the sd array
	reg [7:0] sd_array [399:0]; //imgonnahave to update this sheit to 1228799
	//instantiate this thing
	
	OutputController ten (.reset(tb_n_rst), .clk(tb_clk), .write_r(tb_write_r), .write_g(tb_write_g), .write_b(tb_write_b), .M9_write(tb_M9_write), .read(tb_read), .frame_ready(tb_frame_ready), .Pixel_Number(tb_Pixel_Number),  .read_r(tb_read_r), .read_g(tb_read_g), .read_b(tb_read_b), .SD_write(tb_SD_write), .SD_wdata(tb_SD_wdata), .SD_address(tb_SD_address), .waitrequest(tb_waitrequest), .finished(tb_finished));

	//Clock Signal
	always
	begin
		#2 tb_clk = !tb_clk;
	end

	initial
	begin
		//Initializations
		tb_clk = 1'b0;
		tb_n_rst = 1'b0;
		tb_write_r = 8'd1;
		tb_write_g = 8'd2;
		tb_write_b = 8'd3;
		tb_M9_write = 1'b0;
		count = 17'd0;
		tb_read = 1'b0;
		tb_frame_ready = 1'b0;
		tb_waitrequest = 1'b1;
		nope = 26'h8000000;
		#4;
		//First Process is loading the M9 with some data from the supposed Alpha
		tb_n_rst  = 1'b1;
		tb_M9_write = 1'b1;
		tb_Pixel_Number = 17'b00000000000000000; //could be an issue with the pixel number, could have to fix this
		#4;
		count = count + 1;
		tb_M9_write = 1'b0;
		tb_write_r = 8'd200;
		tb_write_g = 8'd200;
		tb_write_b = 8'd201;
		#4;
		tb_M9_write = 1'b1;
		tb_Pixel_Number = 17'b00000000000000001;
		#4;	
		count = count + 1;
		tb_M9_write = 1'b0;
		tb_write_r = 8'd50;
		tb_write_g = 8'd55;
		tb_write_b = 8'd100;
		#4;
		tb_M9_write = 1'b1;
		tb_Pixel_Number = 17'b00000000000000010;
		#4;
		//ok, now let's read the array to see if we get the right values
		tb_M9_write = 1'b0;
		tb_read = 1'b1;
		tb_Pixel_Number = 17'b00000000000000000;
		#4;
		tb_Pixel_Number = 17'b00000000000000001;
		#4;
		tb_Pixel_Number = 17'b00000000000000010;
		#4;
		tb_read = 1'b0;
		tb_write_r = 8'd4;
		tb_write_g = 8'd4;
		tb_write_b = 8'd4;
		#4;
		//Filling it in with all 640* 180 pixels and then setting frame_ready = 1 which means all pixels are good. 
		tb_M9_write = 1'b1;
		tb_Pixel_Number = 17'd3;
		count = count + 1;
		#4;
		tb_M9_write = 1'b0;
		tb_write_r = 8'd3;
		tb_write_g = 8'd1;
		tb_write_b = 8'd7;
		hello = 1'b0;
		#4;
		for(int i = 0; i <= 102396; i ++)
		begin
			tb_Pixel_Number = i + 4;
			tb_M9_write = 1'b1;
			#4;
			tb_M9_write = 1'b0;
			count = count + 1;
			#4;
		end
		#4;
		if(count == 102400)
		begin
			tb_frame_ready = 1'b1;
			tb_waitrequest = 1'b0;
		end
		
		#16;
		sd_array[tb_SD_address - 28'h8000000] = tb_SD_wdata[7:0];
		sd_array[tb_SD_address - 28'h8000000 + 1] = tb_SD_wdata[15:8];	
		sd_array[tb_SD_address - 28'h8000000 + 2] = tb_SD_wdata[23:16];	
		sd_array[tb_SD_address - 28'h8000000 + 3] = tb_SD_wdata[31:24];
		#12;
		while(tb_SD_address < 28'h8000190)
		begin
			sd_array[tb_SD_address - 28'h8000000] = tb_SD_wdata[7:0];
			sd_array[tb_SD_address - 28'h8000000 +1] = tb_SD_wdata[15:8];
			sd_array[tb_SD_address - 28'h8000000 +2] = tb_SD_wdata[23:16];
			sd_array[tb_SD_address - 28'h8000000 +3] = tb_SD_wdata[31:24];
		#12;
		end
		#800000;


				
	/*		
			
		//Testcase: Load psuedo SDRAM (sdarray here) with the data from the M9, but adding 8 bits of 0 to the front and flipping it. Once it's done, then we want to get a signal that says the SDARRAY is full :)
		for(int j = 0; j<= 3071988; j++)
		begin
			tb_waitrequest = 1'b1;
			#4;
			sd_array[tb_SD_address] = tb_SD_wdata[7:0];
			sd_array[tb_SD_address+1] = tb_SD_wdata[15:8];
			sd_array[tb_SD_address+2] = tb_SD_wdata[23:16];
			sd_array[tb_SD_address+3] = tb_SD_wdata[31:24];
			#4;
			tb_waitrequest = 1'b0;
			#4;
		end
		#4;



		*/
			


		
	end
endmodule


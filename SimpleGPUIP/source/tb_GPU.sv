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
	wire [27:0] tb_SD_address;

	reg [16:0] write_address;
	reg write;
	reg [31:0] write_data;
			
	reg tb_mwrite;
	reg [7:0] tb_mr;
	reg [7:0] tb_mg;
	reg [7:0] tb_mb;
	reg [16:0] tb_maddress;

	int i;
	int f;

	/*
		module GPU
		(
			input wire clk,
			input wire reset,
			input wire [31:0] fifo_write_data,
			input wire fifo_write,
			input wire SD_waitrequest,
			output wire SD_write,
			output wire [31:0] SD_wdata,
			output wire [27:0] SD_address,
			//DEBUG SIGNALS
			output wire[16:0] write_address,
			output wire write,
			output wire[31:0] write_data
	
			input wire mwrite,
			input wire [7:0] mr,
			input wire [7:0] mg,
			input wire [7:0] mb,
			input wire [16:0] maddress
		);
	*/

	//Connections
	GPU U1 (.clk(tb_clk),
		.reset(tb_reset),
		.fifo_write_data(tb_fifo_write_data),
		.fifo_write(tb_fifo_write),
		.SD_waitrequest(tb_SD_waitrequest),
		.SD_write(tb_SD_write),
		.SD_wdata(tb_SD_wdata),
		.SD_address(tb_SD_address),
		.write_address(write_address),
		.write(write),
		.write_data(write_data),
		.mwrite(tb_mwrite),
		.mr(tb_mr),
		.mg(tb_mg),
		.mb(tb_mb),
		.maddress(tb_maddress));

	//Clock Signal
	always
	begin
		#2 tb_clk = !tb_clk;
	end

	task Initialize_RAM;
	begin
		tb_maddress = '0;
		tb_mr = 8'd255;
		tb_mg = 8'd255;
		tb_mb = 8'd255;
		tb_mwrite = '0;
		#4;
		for (int i = 0; i < 'd102400; i = i + 1)
		begin
			tb_mwrite = 1'b1;
			#4;
			tb_maddress = tb_maddress + 1;
			tb_mwrite = 1'b0;
			#4;
		end
	end
	endtask
	

	task Fill_Texture;
		input [16:0] starting_address;
		input [16:0] depth;
		input [7:0] r;
		input [7:0] g;
		input [7:0] b;
		input [7:0] a;
	begin
		write_address = starting_address;
		write_data = {r,g,b,a};
		#4;
		for (int i = 0; i < 'd102400; i = i + 1)
		begin
			write = 1'b1;
			#4;
			write_address = write_address + 1;
			write = 1'b0;
			#4;
		end
	end
	endtask

	task Send_EndOp;
	begin
		tb_fifo_write_data = {4'd2, 28'b0};
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
	end
	endtask;

	task Load_Values;
		input [3:0] opcode;
		input [7:0] TexNum;
		input [15:0] x1;
		input [15:0] y1;
		input [15:0] x2;
		input [15:0] y2;
		input [15:0] x3;
		input [15:0] y3;
	begin
		tb_fifo_write_data = {opcode, 20'b0, TexNum};
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write_data = {x1, y1};
		tb_fifo_write = 1'b1;
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write = 1'b1;
		tb_fifo_write_data = {x2, y2};
		#4;
		tb_fifo_write = 1'b0;
		#4;
		tb_fifo_write = 1'b1;
		tb_fifo_write_data = {x3, y3};
		#4;
		tb_fifo_write = 1'b0;
		#4;
	end
	endtask

	initial
	begin
		f = $fopen("test_1.txt","w");
		tb_clk = 1'b0;
		tb_reset = 1'b0;
		tb_fifo_write = 1'b0;
		tb_SD_waitrequest = 1'b0;
		tb_fifo_write_data = '0;
		write_address = '0;
		write = '0;
		write_data = '0;
		tb_mwrite = '0;
		tb_mr = '0;
		tb_mg = '0;
		tb_mb = '0;
		tb_maddress = '0;

		#4;
		tb_reset = 1'b1;
		#4;
		Initialize_RAM();
		#4;
		Fill_Texture(17'd0, 17'd10000, 8'd255, 8'd0, 8'd0, 8'd255);

		Load_Values(4'd1, 8'd1, 16'd10, 16'd10, 16'd10, 16'd110, 16'd110, 16'd10);
		Send_EndOp();


	end

always_ff @ (posedge tb_SD_write)
begin
	$fwrite(f,"%b\n",{tb_SD_wdata[7:0],tb_SD_wdata[15:8],tb_SD_wdata[23:16]});
end

endmodule

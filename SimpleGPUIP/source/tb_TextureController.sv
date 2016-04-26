// $Id: $
// File name:   tb_TextureController.sv
// Created:     4/25/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Texture Controller Test Bench. Simple write and read tbh lmaoooo

`timescale 1 ns / 100 ps

module tb_TextureController
();
	//DUT Signals
	reg tb_clk;
	reg tb_reset;
	reg [7:0] tb_TexNum;
	reg tb_load_texture;
	reg tb_get_rgba;
	wire [7:0] tb_red;
	wire [7:0] tb_green;
	wire [7:0] tb_blue;
	wire [7:0] tb_alpha;
	reg [16:0] tb_write_address;
	reg tb_write;
	reg [31:0] tb_write_data;
	reg [6:0] count;

	TextureController U1 (.TexNum(tb_TexNum), .clk(tb_clk), .reset(tb_reset), .load_texture(tb_load_texture), .get_rgba(tb_get_rgba), .red(tb_red), .green(tb_green), .blue(tb_blue), .alpha(tb_alpha), .write_address(tb_write_address), .write(tb_write), .write_data(tb_write_data));

	always
	begin
		#2 tb_clk = !tb_clk;
	end

	initial
	begin
		//Testcases: Start off with the reset 
		tb_clk = 1'b0;
		tb_reset = 1'b0;
		tb_TexNum = '0;
		tb_load_texture = 1'b0;
		tb_get_rgba = 1'b0;
		tb_write = 1'b0;
		tb_write_address = 17'b0;
		count = 7'd0;
		tb_write_data = 32'd4294967295;
		#4;
		tb_reset = 1'b1;
		for(int i = 0; i < 50; i++)
		begin
			tb_write = 1'b1;
			#4;
			tb_write_address = tb_write_address + 1;
			tb_write = 1'b0;
			count = count + 1;
			#4;
		end

		
		$display("Test 1: Load the RAM with data, in this case 32 bits of 1");
		assert(count == 7'd50)
		begin
			$display("Test1: Correct!");
		end
		else
		begin
			$error("Was not able to load 50 32 bits of ones into RAM count is actually %d", count);
		end
		#4;
		$display("Test2, read the first 32 bit array of one's from the RAM, the first 32 bits of Tex 1");
		tb_load_texture = 1'b1;
		tb_TexNum = 8'd1;
		#8;
		tb_load_texture = 1'b0;
		assert(tb_red == 8'b11111111 && tb_blue == 8'b11111111 && tb_green == 8'b11111111 && tb_alpha == 8'b11111111)
		begin
			$display("Test2: Correct, the value was all ones as red, blue,green and alpha were %d, %d, %d, %d", tb_red, tb_blue,tb_green, tb_alpha);
		end
		else
		begin
			$error("rgba are now %d, %d, %d, %d", tb_red, tb_blue,tb_green, tb_alpha);
		end
		#4;
		$display("Test3, Write solely red to Texture 2 red and solely blue to Texture 3 and read first pixel in each");			
		 tb_write_data = 32'd4278190080;
		 tb_write_address = 17'd50;
		 tb_write = 1'b0;
		 #4;
		 for(int i = 0; i < 30; i++)
		 begin
		 	tb_write = 1'b1;
			#4;
			tb_write_address = tb_write_address + 1;
			tb_write = 1'b0;
			count = count + 1;
		 end
		 #4;
		 tb_write_address = 17'd80;
		 tb_write = 1'b0;
		 tb_write_data = 32'd16711680;
		 #4;
		 for(int i = 0; i < 40; i++)
		 begin
		 	tb_write = 1'b1;
			#4;
			tb_write_address = tb_write_address + 1;
			tb_write = 1'b0;
			count = count + 1;
		 end
		 tb_TexNum = 8'd2;
		 #4;
		 tb_load_texture = 1'b1;
		 #12;
		 tb_load_texture = 1'b0;
	     assert(tb_red == 8'b11111111 && tb_blue == 8'd0 && tb_green == 8'd0 && tb_alpha == 8'd0)
		 begin
			$display("Test3: Correct, the value was all for rgba  were %d, %d, %d, %d", tb_red, tb_blue,tb_green, tb_alpha);
		 end
		 else
		 begin
			$error("rgba are now %d, %d, %d, %d", tb_red, tb_blue,tb_green, tb_alpha);
		 end
		 tb_TexNum = 8'd3;
		 #4;
		 tb_load_texture = 1'b1;
		 #12;
		 tb_load_texture = 1'b0;
	     assert(tb_red == 8'd0 && tb_blue == 8'd0 && tb_green == 8'b11111111 && tb_alpha == 8'd0)
		 begin
			$display("Test3: Correct, the value was all for rgba  were %d, %d, %d, %d", tb_red, tb_blue,tb_green, tb_alpha);
		 end
		 else
		 begin
			$error("rgba are now %d, %d, %d, %d", tb_red, tb_blue,tb_green, tb_alpha);
		 end
		 #4;








	end
		


endmodule


	

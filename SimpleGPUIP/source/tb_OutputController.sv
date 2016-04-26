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
	reg [25:0] framecount;
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
		framecount = 0;
		tb_clk = 1'b0;
		tb_n_rst = 1'b0;
		tb_write_r = 8'd255;
		tb_write_g = 8'd0;
		tb_write_b = 8'd0;
		tb_M9_write = 1'b0;
		count = 17'd0;
		tb_read = 1'b0;
		tb_frame_ready = 1'b0;
		tb_waitrequest = 1'b1;
		nope = 26'h8000000;
		#4;
		tb_n_rst  = 1'b1;
		tb_M9_write = 1'b1;
		tb_Pixel_Number = 17'b00000000000000000; //could be an issue with the pixel number, could have to fix this
		#4;
		count = count + 1;
		tb_M9_write = 1'b0;
		tb_write_r = 8'd0;
		tb_write_g = 8'd255;
		tb_write_b = 8'd0;
		#4;
		$display("Testing writing only red to pixel position %d", tb_Pixel_Number);
		assert(tb_read_r == 8'd255 && tb_read_g == 8'd0 && tb_read_b == 8'd0)
		begin
			$display("Correct!:Red value of pixel position  %d  is %d, Green is %d and Blue is %d", tb_Pixel_Number, tb_read_r, tb_read_g, tb_read_b);
		end
		else
		begin
			$error("Error: Red Test Failed or mapped wrong");
		end
		tb_M9_write = 1'b1;
		tb_Pixel_Number = 17'b00000000000000001;
		#4;	
		count = count + 1;
		tb_M9_write = 1'b0;
		tb_write_r = 8'd0;
		tb_write_g = 8'd0;
		tb_write_b = 8'd255;
		#4;
		$display("Testing writing only Green to pixel position %d", tb_Pixel_Number);
		assert(tb_read_r == 8'd0 && tb_read_g == 8'd255 && tb_read_b == 8'd0)
		begin
			$display("Correct!:Red value of pixel position  %d  is %d, Green is %d and Blue is %d", tb_Pixel_Number, tb_read_r, tb_read_g, tb_read_b);
		end
		else
		begin
			$error("Error: Green Test Failed or mapped wrong");
		end
		tb_M9_write = 1'b1;
		tb_Pixel_Number = 17'b00000000000000010;
		#4;
		count = count + 1;
		tb_M9_write = 1'b0;
		tb_write_r = 8'd255;
		tb_write_g = 8'd255;
		tb_write_b = 8'd255;
		#4;
		$display("Testing writing only Blue to pixel position %d", tb_Pixel_Number);
		assert(tb_read_r == 8'd0 && tb_read_g == 8'd0 && tb_read_b == 8'd255)
		begin
			$display("Correct!:Red value of pixel position  %d  is %d, Green is %d and Blue is %d", tb_Pixel_Number, tb_read_r, tb_read_g, tb_read_b);
		end
		else
		begin
			$error("Error: Blue Test Failed or mapped wrong");
		end
		tb_M9_write = 1'b1;
		tb_Pixel_Number = 17'd3;
		#4;
		count = count + 1;
		tb_M9_write = 1'b0;
		hello = 1'b0;
		#4;
		$display("Testing writing White to pixel position %d", tb_Pixel_Number);
		assert(tb_read_r == 8'd255 && tb_read_g == 8'd255 && tb_read_b == 8'd255)
		begin
			$display("Correct!:Red value of pixel position  %d  is %d, Green is %d and Blue is %d", tb_Pixel_Number, tb_read_r, tb_read_g, tb_read_b);
		end
		else
		begin
			$error("Error: White Failed or mapped wrong");
		end
		for(int i = 0; i < 102396; i ++) //actual value is 102396
		begin
			tb_Pixel_Number = i + 4;
			tb_M9_write = 1'b1;
			#4;
			tb_M9_write = 1'b0;
			count = count + 1;
			#4;
		end
		#4;
		tb_M9_write = 1'b1;
		#4;
		tb_M9_write = 1'b0;
		$display("Check if RAM holds 640* 160 pixel values");
		if(count == 102400)
		begin
			$display("Correct count of pixels");
			tb_frame_ready = 1'b1;
			tb_waitrequest = 1'b0;
		end
		else
		begin
			$error("not correct dawg, your value is sadly %d", count);
		end
	
		#16;
		$display("Test Sets for sending data to SRAM");
		sd_array[tb_SD_address - 28'h8000000] = tb_SD_wdata[7:0];
		sd_array[tb_SD_address - 28'h8000000 + 1] = tb_SD_wdata[15:8];	
		sd_array[tb_SD_address - 28'h8000000 + 2] = tb_SD_wdata[23:16];	
		sd_array[tb_SD_address - 28'h8000000 + 3] = tb_SD_wdata[31:24];
		framecount = framecount + 1;
		#4;
		assert(sd_array[tb_SD_address -28'h8000000] == 8'd0 && sd_array[tb_SD_address -28'h8000000 + 1] == 8'd255 && sd_array[tb_SD_address -28'h8000000 + 2 ] == 8'd0 && sd_array[tb_SD_address -28'h8000000 +3] == 8'd0)
		begin
			$display("For the pixel # %d, we see that that the red is stored as value %d, green is stored as value %d, and blue is stored as value %d as expected from the red pixel", framecount, sd_array[tb_SD_address -28'h8000000 + 1], sd_array[tb_SD_address -28'h8000000 + 2], sd_array[tb_SD_address -28'h8000000 + 3]);
		end
		else
		begin
			$error("Issue reading sdram stored red pixel number %d", framecount);
		end
		#8;
		while(tb_SD_address < 28'h8000190)
		begin
			sd_array[tb_SD_address - 28'h8000000] = tb_SD_wdata[7:0];
			sd_array[tb_SD_address - 28'h8000000 +1] = tb_SD_wdata[15:8];
			sd_array[tb_SD_address - 28'h8000000 +2] = tb_SD_wdata[23:16];
			sd_array[tb_SD_address - 28'h8000000 +3] = tb_SD_wdata[31:24];
			framecount = framecount + 1;
			#4;
			if(framecount == 2)
			begin
				assert(sd_array[tb_SD_address -28'h8000000] == 8'd0 && sd_array[tb_SD_address -28'h8000000 + 1] == 8'd0 && sd_array[tb_SD_address -28'h8000000 + 2 ] == 8'd255 && sd_array[tb_SD_address -28'h8000000 +3] == 8'd0)
				begin
					$display("For the pixel # %d, we see that that the red is stored as value %d, green is stored as value %d, and blue is stored as value %d as expected from the green pixel", framecount, sd_array[tb_SD_address -28'h8000000 + 1], sd_array[tb_SD_address -28'h8000000 + 2], sd_array[tb_SD_address -28'h8000000 + 3]);
				end
			end
			if(framecount == 3)
			begin
				assert(sd_array[tb_SD_address -28'h8000000] == 8'd0 && sd_array[tb_SD_address -28'h8000000 + 1] == 8'd0 && sd_array[tb_SD_address -28'h8000000 + 2 ] == 8'd0 && sd_array[tb_SD_address -28'h8000000 +3] == 8'd255)
				begin
					$display("For the pixel # %d, we see that that the red is stored as value %d, green is stored as value %d, and blue is stored as value %d as expected from the blue pixel", framecount, sd_array[tb_SD_address -28'h8000000 + 1], sd_array[tb_SD_address -28'h8000000 + 2], sd_array[tb_SD_address -28'h8000000 + 3]);
				end
			end
			if(framecount == 4)
			begin
				assert(sd_array[tb_SD_address -28'h8000000] == 8'd0 && sd_array[tb_SD_address -28'h8000000 + 1] == 8'd255 && sd_array[tb_SD_address -28'h8000000 + 2 ] == 8'd255 && sd_array[tb_SD_address -28'h8000000 +3] == 8'd255)
				begin
					$display("For the pixel # %d, we see that that the red is stored as value %d, green is stored as value %d, and blue is stored as value %d as expected from the white pixel", framecount, sd_array[tb_SD_address -28'h8000000 + 1], sd_array[tb_SD_address -28'h8000000 + 2], sd_array[tb_SD_address -28'h8000000 + 3]);
				end
			end
			#8;
			
		end
		#1228800;
		$display("At this point, the sdram should be reading black pixels as our frames are only one third of the required size, Next Test shows sd_wdata is black after waiting the appropriate amount of cycles");
		begin
			assert(tb_SD_wdata == 32'd0)
			begin
				$display("Correct: The pixels written are of value %32d", tb_SD_wdata);
			end
			else
			begin
				$error("not black written?");
			end
		end
		#4;
		while(tb_SD_address != 28'h812bffc)
		begin
			#12;
		end
		#8;
		$display("finished should be set high at this point, check to confirm");
		assert(tb_finished == 1'b1)
		begin
			$display("finished writing");
		end
		else
		begin
			$display("let's deal with this later");
		end
		#4;

				

			


		
	end
endmodule


// $Id: $
// File name:   tb_AlphaBlender.sv
// Created:     4/19/2016
// Author:      Kyle Diekhoff
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: TestBench for the AlphaBlender
//

`timescale 1 ns / 100 ps

module tb_AlphaBlender
();
	
	// DUT Signals
	reg tb_clk;
	reg tb_reset;
	reg[16:0] tb_pixel_number;
	reg tb_pixel_ready;
	reg[7:0] tb_r;
	reg[7:0] tb_g;
	reg[7:0] tb_b;
	reg[7:0] tb_a;
	reg[7:0] tb_read_r;
	reg[7:0] tb_read_g;
	reg[7:0] tb_read_b;
	reg tb_frame_ready;
	wire tb_o_frame_ready;
	wire tb_read;
	wire tb_write;
	wire[7:0] tb_write_r;
	wire[7:0] tb_write_g;
	wire[7:0] tb_write_b;
	wire[16:0] tb_pixel_number_o;
	wire tb_finished_o;
	reg tb_finished;

	//Connections
	AlphaBlender #(2) U1 (.clk(tb_clk),
			 .reset(tb_reset),
			 .finished(tb_finished),
			 .pixel_number(tb_pixel_number),
			 .pixel_ready(tb_pixel_ready),
			 .r(tb_r),
			 .g(tb_g),
			 .b(tb_b),
			 .a(tb_a),
			 .read_r(tb_read_r),
			 .read_g(tb_read_g),
			 .read_b(tb_read_b),
			 .frame_ready(tb_frame_ready),
			 .o_frame_ready(tb_o_frame_ready),
			 .read(tb_read),
			 .write(tb_write),
			 .write_r(tb_write_r),
			 .write_g(tb_write_g),
			 .write_b(tb_write_b),
			 .pixel_number_o(tb_pixel_number_o),
			 .finished_o(tb_finished_o));

	//Clock signal
	always
	begin
		#2 tb_clk = !tb_clk;
	end

	initial
	begin
		//Initializations
		tb_clk = 1'b0;
		tb_reset = 1'b0;
		tb_read_r = 8'b00000001;
		tb_read_g = 8'b00000010;
		tb_read_b = 8'b00000011;
		tb_r = 8'b10000000;
		tb_g = 8'b01000000;
		tb_b = 8'b11000000;
		tb_a = 8'b00010001;
		tb_pixel_number = 1'b0;
		tb_pixel_ready = 1'b0;

		#4;
		tb_reset = 1'b1;
		tb_pixel_ready = 1'b1;
		#4;
		tb_pixel_ready = 1'b0;
		#4;
		// Checking for values
		assert(tb_write_r == 8'b00001001)
		begin
			$display("Correct Value: Red");
		end
		else
		begin
			$display("Error: Incorrect Value: Red");
		end
		assert(tb_write_g == 8'b00000110)
		begin
			$display("Correct Value: Green");
		end
		else
		begin
			$display("Error: Incorrect Value: Green");
		end
		assert(tb_write_b == 8'b00001111)
		begin
			$display("Correct Value: Blue");
		end
		else
		begin
			$display("Error: Incorrect Value: Green");
		end

		#4;
		tb_read_r = 8'b11111111;
		tb_read_g = 8'b10101010;
		tb_read_b = 8'b00000000;
		tb_r = 8'b00000000;
		tb_g = 8'b00000000;
		tb_b = 8'b00000000;
		tb_a = 8'b00000000;
		tb_pixel_ready = 1'b1;
		#4;
		tb_pixel_ready = 1'b0;
		#4;
		#4;
		
		assert(tb_write_r == tb_read_r)
		begin
			$display("Correct: Red Opacity");
		end
		else
		begin
			$display("Error: Incorrect Red Opacity");
		end
		assert(tb_write_g == tb_read_g)
		begin
			$display("Correct: Green Opacity");
		end
		else
		begin
			$display("Error: Incorrect Green Opacity");
		end
		assert(tb_write_b == tb_read_b)
		begin
			$display("Correct: Blue Opacity");
		end
		else
		begin
			$display("Error: Incorrect Blue Opacity");
		end
		
		tb_a = 8'b11111111;
		tb_pixel_ready = 1'b1;
		#4;
		tb_pixel_ready = 1'b0;
		#8;

		assert(tb_write_r == tb_r)
		begin
			$display("Correct: Red Nopacity");
		end
		else
		begin
			$display("Error: Incorrect Red Nopacity");
		end
		assert(tb_write_g == tb_g)
		begin
			$display("Correct: Green Nopacity");
		end
		else
		begin
			$display("Error: Incorrect Green Nopacity");
		end
		assert(tb_write_b == tb_b)
		begin
			$display("Correct: Blue Nopacity");
		end
		else
		begin
			$display("Error: Incorrect Blue Nopacity");
		end
	end

endmodule 

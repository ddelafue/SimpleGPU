// $Id: $
// File name:   tb_InputDecoder_fifo_RAM.sv
// Created:     4/21/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: A test bench for the input decoder's fifo.

module tb_InputDecoder_fifo_RAM ();

	timeunit 1ns;
	reg tb_clk = 0, tb_reset, tb_write, tb_read;
	reg [31:0] tb_r_data;
	wire tb_full, tb_empty;
	wire [31:0] tb_w_data;
	integer test_case;

	/*
		module InputDecoder_fifo_RAM
		(
			input wire clk,
			input wire reset,
			input wire write,
			input wire read,
			input wire [31:0] w_data,
			output wire [31:0] r_data,
			output reg empty,
			output reg full
		);
	*/

	// Generate a clockorino
	always
	begin
		#5 tb_clk = 1;
		#5 tb_clk = 0;
	end

	task Set_Inputs;
		input write;
		input read;
		input [31:0] w_data;
	begin
		c_fifo.write <= write;
		c_fifo.read <= read;
		c_fifo.w_data <= w_data;
	end
	endtask

	decode DUT (
				.clk(tb_clk),
				.reset(tb_reset),
				.write(tb_write),
				.read(tb_read),
				.w_data(tb_w_data),
				.r_data(tb_r_data),
				.empty(tb_empty),
				.full(tb_full)
				);

	task Check_Outputs;
		input [31:0] r_data;
		input empty;
		input full;
	begin
		assert (c_fifo.r_data == r_data)
			$info("Correct r_data %d", test_case);
		else
			$error("Wrong! r_data %d", test_case);
		
		assert (c_fifo.empty == empty)
			$info("Correct empty %d", test_case);
		else
			$error("Wrong! empty %d", test_case);
		
		assert (c_fifo.full == full)
			$info("Correct full %d", test_case);
		else
			$error("Wrong! full %d", test_case);
	end
	endtask
	
	default clocking c_fifo @(posedge tb_clk);
		default input #1step output #4;
		output negedge reset = tb_reset;
		output write = tb_write;
		output read = tb_read;
		output w_data = tb_w_data;
		input r_data = tb_r_data;
		input empty = tb_empty;
		input full = tb_full;
	endclocking

	initial
	begin
		tb_reset = 0;
		tb_write = 0;
		tb_read = 0;
		tb_w_data = 0;
		test_case = 0;

		// Applied at the negative edge of the first clock

		// Applied at the negative edge of the first clock
		##1 c_fifo.reset <= 1; // Drive Test 1
		// Applied 4ns after clock edge
		##1 Set_Inputs(0,0,0); // Drive Test 1
		##1 Set_Inputs(0,0,32'd1); // Drive Test 2
		##1 Set_Inputs(1,0,32'd1); // Drive Test 3

		// TEST 1
		test_case = test_case + 1;
		Check_Outputs(32'dx, 1'b1, 1'b0);
		

		##1 Set_Inputs(1,0,32'd4294967295); // Drive Test 4
		// TEST 2
		test_case = test_case + 1;
		Check_Outputs(32'dx, 1'b1, 1'b0);
		 

		##1 Set_Inputs(1,1,32'd1000); // Drive Test 5
		// TEST 3
		test_case = test_case + 1;
		Check_Outputs(32'd1, 1'b0, 1'b0);
		
		##1 Set_Inputs(0,1,32'd1000); // Drive Test 6
		// TEST 4
		test_case = test_case + 1;
		Check_Outputs(32'd1, 1'b0, 1'b0);
		
		##1 Set_Inputs(0,1,32'd99999); // Drive Test 7
		// TEST 5
		test_case = test_case + 1;
		Check_Outputs(32'd4294967295, 1'b0, 1'b0);
		
		##1
		// TEST 6
		test_case = test_case + 1;
		Check_Outputs(32'd1000, 1'b0, 1'b0);
		
		##1
		// TEST 7
		test_case = test_case + 1;
		Check_Outputs(32'dx, 1'b1, 1'b0);
	end

endmodule

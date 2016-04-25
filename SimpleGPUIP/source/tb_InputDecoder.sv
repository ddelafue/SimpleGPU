// $Id: $
// File name:   tb_InputDecoder.sv
// Created:     4/23/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: A test bench for the input decoder.

module tb_InputDecoder ();

	timeunit 1ns;
	reg tb_clk = 0, tb_reset, tb_fifo_write, tb_next_triangle;
	reg [31:0] tb_fifo_w_data;
	wire tb_opcode_received, tb_frame_ready, tb_data_ready;
	wire [15:0] tb_x1, tb_y1, tb_x2, tb_y2, tb_x3, tb_y3;
	wire [7:0] tb_TexNum;
	integer test_case;

	reg opcode_received_edge, frame_ready_edge, data_ready_edge;

	/*
		module InputDecoder
		(	
			input wire clk,
			input wire reset,
			input wire next_triangle,
			output reg opcode_received,
			output reg frame_ready,
			output reg data_ready,
			output reg [15:0] x1,
			output reg [15:0] y1,
			output reg [15:0] x2,
			output reg [15:0] y2,
			output reg [15:0] x3,
			output reg [15:0] y3,
			output reg [7:0] TexNum
		);
	*/

	// Generate a clockorino
	always
	begin
		#5 tb_clk = 1;
		#5 tb_clk = 0;
	end

	always_ff @ (negedge tb_reset, posedge tb_clk)
	begin
		if (tb_reset == 1'b0)
		begin
			opcode_received_edge <= '0;
			frame_ready_edge <= '0;
			data_ready_edge <= '0;
		end
		if (c_input.opcode_received)
			opcode_received_edge <= 1'b1;
		else
			opcode_received_edge <= opcode_received_edge;
		if (c_input.frame_ready)
			frame_ready_edge <= 1'b1;
		else
			frame_ready_edge <= frame_ready_edge;
		if (c_input.data_ready)
			data_ready_edge <= 1'b1;
		else
			data_ready_edge <= data_ready_edge;
	end

	task Reset_Edges;
	begin
		opcode_received_edge = 1'b0;
		frame_ready_edge = 1'b0;
		data_ready_edge = 1'b0;
	end
	endtask

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
		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {opcode, 20'd0, TexNum};
		##1;
		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {x1, y1};
		##1;
		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {x2, y2};
		##1;
		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {x3, y3};
		##1;
		c_input.fifo_write <= 1'b0;
	end
	endtask

	InputDecoder DUT (
				.clk(tb_clk),
				.reset(tb_reset),
				.fifo_write(tb_fifo_write),
				.fifo_w_data(tb_fifo_w_data),
				.next_triangle(tb_next_triangle),
				.opcode_received(tb_opcode_received),
				.frame_ready(tb_frame_ready),
				.data_ready(tb_data_ready),
				.x1(tb_x1),
				.y1(tb_y1),
				.x2(tb_x2),
				.y2(tb_y2),
				.x3(tb_x3),
				.y3(tb_y3),
				.TexNum(tb_TexNum)
				);

	task Check_Outputs;
		input [7:0] TexNum;
		input [15:0] x1;
		input [15:0] y1;
		input [15:0] x2;
		input [15:0] y2;
		input [15:0] x3;
		input [15:0] y3;
	begin
		assert (c_input.TexNum == TexNum)
			$info("Correct TexNum %d", test_case);
		else
			$error("Wrong! TexNum %d", test_case);
		
		assert (c_input.x1 == x1)
			$info("Correct x1 %d", test_case);
		else
			$error("Wrong! x1 %d", test_case);
		
		assert (c_input.y1 == y1)
			$info("Correct y1 %d", test_case);
		else
			$error("Wrong! y1 %d", test_case);
		
		assert (c_input.x2 == x2)
			$info("Correct x2 %d", test_case);
		else
			$error("Wrong! x2 %d", test_case);
		
		assert (c_input.y2 == y2)
			$info("Correct y2 %d", test_case);
		else
			$error("Wrong! y2 %d", test_case);
		
		assert (c_input.x3 == x3)
			$info("Correct x3 %d", test_case);
		else
			$error("Wrong! x3 %d", test_case);
		
		assert (c_input.y3 == y3)
			$info("Correct y3 %d", test_case);
		else
			$error("Wrong! y3 %d", test_case);
	end
	endtask

	task Check_Edges;
		input expected_opcode_received;
		input expected_frame_ready;
		input expected_data_ready;
	begin
		assert (opcode_received_edge == expected_opcode_received)
			$info("Correct opcode_received %d", test_case);
		else
			$error("Wrong! opcode_received %d", test_case);
		
		assert (frame_ready_edge == expected_frame_ready)
			$info("Correct frame_ready %d", test_case);
		else
			$error("Wrong! frame_ready %d", test_case);
		
		assert (data_ready_edge == expected_data_ready)
			$info("Correct data_ready %d", test_case);
		else
			$error("Wrong! data_ready %d", test_case);
	end
	endtask
	
	default clocking c_input @(posedge tb_clk);
		default input #1step output #4;
		output negedge reset = tb_reset;
		output fifo_write = tb_fifo_write;
		output fifo_w_data = tb_fifo_w_data;
		output next_triangle = tb_next_triangle;
		input opcode_received = tb_opcode_received;
		input frame_ready = tb_frame_ready;
		input data_ready = tb_data_ready;
		input x1 = tb_x1;
		input y1 = tb_y1;
		input x2 = tb_x2;
		input y2 = tb_y2;
		input x3 = tb_x3;
		input y3 = tb_y3;
		input TexNum = tb_TexNum;
	endclocking


	/*
		task Load_Values;
			input [3:0] opcode;
			input [7:0] TexNum;
			input [15:0] x1;
			input [15:0] y1;
			input [15:0] x2;
			input [15:0] y2;
			input [15:0] x3;
			input [15:0] y3;

		task Check_Outputs;
			input [7:0] TexNum;
			input [15:0] x1;
			input [15:0] y1;
			input [15:0] x2;
			input [15:0] y2;
			input [15:0] x3;
			input [15:0] y3;
	
		task Check_Edges;
			input expected_opcode_received;
			input expected_frame_ready;
			input expected_data_ready;
	
		task Reset_Edges
	*/

	initial
	begin
		tb_reset = 0;
		tb_next_triangle = 0;
		opcode_received_edge = '0;
		frame_ready_edge = '0;
		data_ready_edge = '0;
		tb_fifo_write = '0;
		tb_fifo_w_data = '0;
		test_case = 0;

		// Applied at the negative edge of the first clock
		##1 c_input.reset <= 1; // Drive Test 1
		tb_reset = 1;
		// Applied 4ns after clock edge
		##2

		// TEST 1
		test_case = test_case + 1;

		Load_Values(4'd1, 8'd2, 16'd3, 16'd4, 16'd5, 16'd6, 16'd7, 16'd8);
		c_input.next_triangle <= 1'b1;
		##1;
		c_input.next_triangle <= 1'b0;
		##9;
		Check_Outputs(8'd2, 16'd3, 16'd4, 16'd5, 16'd6, 16'd7, 16'd8);
		Check_Edges(1'b1, 1'b0, 1'b1);
		Reset_Edges();

		##1;

		// TEST 2
		test_case = test_case + 1;

		Load_Values(4'd0, 8'd2, 16'd3, 16'd4, 16'd5, 16'd6, 16'd7, 16'd8);
		c_input.next_triangle <= 1'b1;
		##1;
		c_input.next_triangle <= 1'b0;
		##9;
		Check_Outputs(8'd2, 16'd3, 16'd4, 16'd5, 16'd6, 16'd7, 16'd8);
		Check_Edges(1'b0, 1'b0, 1'b1);
		Reset_Edges();

		##1;

		// TEST 3
		test_case = test_case + 1;

		Load_Values(4'd0, 8'd5, 16'd5, 16'd5, 16'd5, 16'd5, 16'd5, 16'd5);
		c_input.next_triangle <= 1'b1;
		##1;
		c_input.next_triangle <= 1'b0;
		##9;
		Check_Outputs(8'd5, 16'd5, 16'd5, 16'd5, 16'd5, 16'd5, 16'd5);
		Check_Edges(1'b0, 1'b0, 1'b1);
		Reset_Edges();

		##1;
		
		// TEST 4
		test_case = test_case + 1;

		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {4'd2, 28'd0};
		##1;
		c_input.fifo_write <= 1'b0;
		c_input.next_triangle <= 1'b1;
		##1;
		c_input.next_triangle <= 1'b0;
		##7;
		Check_Edges(1'b0, 1'b1, 1'b0);
		Reset_Edges();

		##1;
		
		// TEST 5
		test_case = test_case + 1;

		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {4'd1, 28'd0};
		##1;
		c_input.fifo_write <= 1'b0;
		c_input.next_triangle <= 1'b1;
		##1;
		c_input.next_triangle <= 1'b0;
		##6;
		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {16'd20, 16'd21};
		##1;
		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {16'd22, 16'd23};
		##1;
		c_input.fifo_write <= 1'b0;
		##8;
		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {16'd24, 16'd25};
		##1;
		c_input.fifo_write <= 1'b0;
		##7;
		Check_Outputs(8'd0, 16'd20, 16'd21, 16'd22, 16'd23, 16'd24, 16'd25);
		Check_Edges(1'b1, 1'b0, 1'b1);
		Reset_Edges();

		##1;
		
		// TEST 6
		test_case = test_case + 1;

		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {4'd2, 28'd30};
		##1;
		c_input.fifo_write <= 1'b0;
		c_input.next_triangle <= 1'b1;
		##1;
		c_input.next_triangle <= 1'b0;
		##7;
		Check_Outputs(8'd0, 16'd20, 16'd21, 16'd22, 16'd23, 16'd24, 16'd25);
		Check_Edges(1'b0, 1'b1, 1'b0);
		Reset_Edges();
		
		// TEST 7
		test_case = test_case + 1;

		c_input.next_triangle <= 1'b1;
		##1;
		c_input.next_triangle <= 1'b0;
		##6;
		Load_Values(4'd1, 8'd100, 16'd500, 16'd666, 16'd777, 16'd345, 16'd845, 16'd984);
		c_input.fifo_write <= 1'b1;
		c_input.fifo_w_data <= {4'd2, 28'd2433};
		##1;
		c_input.fifo_write <= 1'b0;
		##11;
		Check_Outputs(8'd100, 16'd500, 16'd666, 16'd777, 16'd345, 16'd845, 16'd984);
		Check_Edges(1'b1, 1'b0, 1'b1);
		Reset_Edges();
		##1;
		c_input.next_triangle <= 1'b1;
		##1;
		c_input.next_triangle <= 1'b0;
		##1;
		Check_Edges(1'b0, 1'b1, 1'b0);
		Reset_Edges();

	end

endmodule

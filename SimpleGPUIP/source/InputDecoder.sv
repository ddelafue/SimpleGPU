// $Id: $
// File name:   InputDecoder.sv
// Created:     4/23/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: A module for controlling the input from the Atom processor and decoding the protocol.

module InputDecoder
(	
	input wire clk,
	input wire reset,
	input wire fifo_write,
	input wire [31:0] fifo_w_data,
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
	
	typedef enum bit [3:0] {
							Idle,
							Wait1,
							Wait2,
							Wait3,
							Wait4,
							Latch1,
							Latch2,
							Latch3,
							Latch4,
							Frame
							} stateType;

	stateType state;
	stateType next_state;

	wire fifo_read, fifo_empty, fifo_full;
	wire [31:0] fifo_r_data;
	wire [3:0] opcode;

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

	InputDecoder_fifo_RAM RAM (
							.clk(clk),
							.reset(reset),
							.write(fifo_write),
							.read(fifo_read),
							.w_data(fifo_w_data),
							.r_data(fifo_r_data),
							.empty(fifo_empty),
							.full(fifo_full)
							);

	
	assign opcode = fifo_r_data[31:28];

	always_ff @ (negedge n_rst, posedge clk)
	begin
		if (reset == 1'b0)
			state <= Idle;
		else
			state <= next_state;
	end

	always_comb
	begin : NEXT_STATE_LOGIC
		next_state = state;

		case(state)
			Idle:
			begin
				if (next_triangle && opcode != 4'd2 && fifo_empty)
					next_state = Wait1;
				else if (next_triangle && opcode != 4'd2 && !fifo_empty)
					next_state = Latch1;
				else if (next_triangle && opcode == 4'd2)
					next_state = Frame;
			end
			Wait1:
				if (!fifo_empty)
					next_state = Latch1;
			Latch1:
			begin
				if (fifo_empty)
					next_state = Wait2;
				else
					next_state = Latch2;
			end
			Wait2:
				if (!fifo_empty)
					next_state = Latch2;
			Latch2:
			begin
				if (fifo_empty)
					next_state = Wait3;
				else
					next_state = Latch3;
			end
			Wait3:
				if (!fifo_empty)
					next_state = Latch3;
			Latch3:
			begin
				if (fifo_empty)
					next_state = Wait4;
				else
					next_state = Latch4;
			end
			Wait4:
				if (!fifo_empty)
					next_state = Latch4;
			default:
				next_state = Idle;
		endcase
	end

	always_comb
	begin : OUTPUT_LOGIC
		rcving = 1'b0;
		w_enable = 1'b0;
		r_error = 1'b0;

		case(state)
			Start:
				rcving = 1'b1;
			First_Bit:
				rcving = 1'b1;
			Write:
			begin
				rcving = 1'b1;
				w_enable = 1'b1;
			end
			Listen:
				rcving = 1'b1;
			EOP_E:
			begin
				rcving = 1'b1;
				r_error = 1'b1;
			end
			Start_E:
			begin
				rcving = 1'b1;
				r_error = 1'b1;
			end
			E_Idle:
				r_error = 1'b1;
			EOP:
				rcving = 1'b1;
		endcase
	end

endmodule

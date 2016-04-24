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
	
	reg [15:0] next_x1;
	reg [15:0] next_y1;
	reg [15:0] next_x2;
	reg [15:0] next_y2;
	reg [15:0] next_x3;
	reg [15:0] next_y3;
	reg [7:0] next_TexNum;

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

	wire fifo_empty, fifo_full;
	reg fifo_read;
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

	always_ff @ (negedge reset, posedge clk)
	begin
		if (reset == 1'b0)
		begin
			state <= Idle;
			x1 <= '0;
			y1 <= '0;
			x2 <= '0;
			y2 <= '0;
			x3 <= '0;
			y3 <= '0;
			TexNum <= '0;
		end
		else
		begin
			state <= next_state;
			x1 <= next_x1;
			y1 <= next_y1;
			x2 <= next_x2;
			y2 <= next_y2;
			x3 <= next_x3;
			y3 <= next_y3;
			TexNum <= next_TexNum;
		end
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
		opcode_received = 1'b0;
		frame_ready = 1'b0;
		data_ready = 1'b0;
		next_x1 = x1;
		next_y1 = y1;
		next_x2 = x2;
		next_y2 = y2;
		next_x3 = x3;
		next_y3 = y3;
		next_TexNum = TexNum;

		case(state)
			Idle:
			begin
				if (opcode == 4'd1 && !fifo_empty)
					opcode_received = 1;
			end
			Latch1:
			begin
				next_TexNum = fifo_r_data[7:0];
				fifo_read = 1'b1;
			end
			Latch2:
			begin
				next_x1 = fifo_r_data[31:16];
				next_y1 = fifo_r_data[15:0];
				fifo_read = 1'b1;
			end
			Latch3:
			begin
				next_x2 = fifo_r_data[31:16];
				next_y2 = fifo_r_data[15:0];
				fifo_read = 1'b1;
			end
			Latch4:
			begin
				next_x3 = fifo_r_data[31:16];
				next_y3 = fifo_r_data[15:0];
				fifo_read = 1'b1;
				data_ready = 1'b1;
			end
			Frame:
			begin
				frame_ready = 1'b1;
				fifo_read = 1'b1;
			end
		endcase
	end

endmodule

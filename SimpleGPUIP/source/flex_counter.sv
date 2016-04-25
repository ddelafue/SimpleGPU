// $Id: $
// File name:   flex_counter.sv
// Created:     2/1/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: A counter that counts to n bits.

module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [NUM_CNT_BITS - 1: 0] rollover_val,
	output reg [NUM_CNT_BITS - 1: 0] count_out,
	output reg rollover_flag
);

	logic [NUM_CNT_BITS - 1:0] next_count_out;
	logic next_rollover_flag;

	always_comb
	begin
		for (int i = 0; i < NUM_CNT_BITS; i = i + 1) next_count_out[i] = count_out[i];
		next_rollover_flag = rollover_flag;
		if (n_rst == 1'b0)
		begin
			for (int i = 0; i < NUM_CNT_BITS; i = i + 1) next_count_out[i] = 1'b0;
			next_rollover_flag = 1'b0;
		end
		else if (clear == 1'b1)
		begin
			for (int i = 0; i < NUM_CNT_BITS; i = i + 1) next_count_out[i] = 1'b0;
			next_rollover_flag = 1'b0;
		end
		else if (count_enable == 1'b1)
		begin
			if (rollover_flag == 1'b1)
			begin
				next_count_out[0] = 1'b1;
				for (int i = 1; i < NUM_CNT_BITS; i = i + 1) next_count_out[i] = 1'b0;
				next_rollover_flag = 1'b0;
			end
			else if ((rollover_val[NUM_CNT_BITS - 1: 0] - 1) == count_out[NUM_CNT_BITS - 1:0])
			begin
				next_count_out = count_out + 1;
				next_rollover_flag = 1'b1;
			end
			else
			begin
				next_count_out = count_out + 1;
			end
		end
	end

	always_ff @ (negedge n_rst, posedge clk)
	begin
		if (n_rst == 1'b0)
		begin
			for (int i = 0; i < NUM_CNT_BITS; i = i + 1) count_out[i] <= 1'b0;
			rollover_flag <= 1'b0;
		end
		else
		begin
			count_out[NUM_CNT_BITS - 1: 0] <= next_count_out[NUM_CNT_BITS - 1: 0];
			rollover_flag <= next_rollover_flag;
		end
	end

endmodule

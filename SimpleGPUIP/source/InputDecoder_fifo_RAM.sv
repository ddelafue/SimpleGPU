// $Id: $
// File name:   InputDecoder_fifo_RAM.sv
// Created:     4/21/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: An abstracted version of RAM as a FIFO.

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

	reg [8:0] fifo_counter, read_ptr, write_ptr;

	/*
		module InputDecoderRAM
		(
				output reg [31:0] q,
				input [31:0] data,
				input [8:0] write_address, read_address,
				input we, clk
		);
	*/

	InputDecoderRAM ID (
						.q(r_data),
						.data(w_data),
						.write_address(write_ptr),
						.read_address(read_ptr),
						.we(write),
						.clk(clk)
						);

	always_comb
	begin
		if (fifo_counter == 0)
			empty = 1'b0;
		else
			empty = 1'b1;
		
		if (fifo_counter == 9'd400)
			full = 1'b1;
		else
			full = 1'b0;
	end

	always_ff @ (negedge reset, posedge clk)
	begin
		if (reset == 1'b0)
		begin
			fifo_counter <= 0;
		end
		else if ((!full && write) && (!empty && read))
			fifo_counter <= fifo_counter;
		else if (!full && write)
			fifo_counter <= fifo_counter + 1;
		else if (!empty && read)
			fifo_counter <= fifo_counter - 1;
		else
			fifo_counter <= fifo_counter;
	end

	always_ff @ (negedge reset, posedge clk)
	begin
		if (reset == 1'b0)
		begin
			write_ptr <= 0;
			read_ptr <= 0;
		end
		else
		begin
			if (!full && write)
				write_ptr <= write_ptr + 1;
			else
				write_ptr <= write_ptr;
			
			if (!empty && read)
				read_ptr <= read_ptr + 1;
			else
				read_ptr <= read_ptr;
		end
	end

endmodule

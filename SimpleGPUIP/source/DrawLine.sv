// $Id: $
// File name:   DrawLine.sv
// Created:     4/19/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: A sub-module for stepping through each pixel of a line.

module DrawLine
(
	input wire clk,
	input wire reset,
	input wire calculate,
	input wire [15:0] x1,
	input wire [15:0] y1,
	input wire [15:0] x2,
	input wire [15:0] y2,
	input wire get_pixel,
	output reg [15:0] x_o,
	output reg [15:0] y_o,
	output reg line_complete
);
//Don't need this many registers just don't feel like doing max math now
reg[15:0] delta_x;
reg[15:0] delta_y;
reg[15:0] min;
reg[15:0] max;
reg[15:0] pixels_in_group;
reg[15:0] pixels_missing;
reg[15:0] a;
wire [15:0] c1_out; // Dummy wire NOT USED AT THE MOMENT
wire clear;
wire roll;
wire roll2;
wire roll3;

/*
	module flex_counter
	#(
		parameter NUM_CNT_BITS = 4
	)
	(
		input wire clk,
		input wire n_rst,
		input wire clear,
		input wire count_enable,
		input wire [(NUM_CNT_BITS-1):0] rollover_val,
		output reg [(NUM_CNT_BITS-1):0] count_out,
		output reg rollover_flag
	);
*/

flex_counter #(16) c1 (.clk(clk),
			.n_rst(reset),
			.clear(roll),
			.count_enable(get_pixel),
			.rollover_val(max),
			.count_out(c1_out),
			.rollover_flag(roll));

flex_counter #(16) c2 (.clk(clk),
			.n_rst(reset),
			.clear(roll),
			.count_enable(get_pixel),
			.rollover_val(a),
			.count_out(),
			.rollover_flag(roll2));

flex_counter #(16) c3 (.clk(clk),
			.n_rst(reset),
			.clear(roll),
			.count_enable(!roll2),
			.rollover_val(pixels_in_group/* + 1'b1*/),
			.count_out(),
			.rollover_flag(roll3));

always_ff @ (posedge clk, negedge reset)
begin
	if (reset == 1'b0)
	begin
		x_o <= 'b0;
		y_o <= 'b0;
	end
	else
	begin
		line_complete <= 1'b0;
		if (calculate == 1'b1)
		begin
			x_o <= x1;
			y_o <= y1;
		end
		if (get_pixel == 1'b1 && roll == 1'b0)
		begin
			if(roll3 == 1'b1)
			begin
				if (delta_y > delta_x)
				begin
					if (x1 > x2)
					begin
						x_o <= x_o - 1;
					end
					else if (x1 < x2)
					begin
						x_o <= x_o + 1;
					end
				end
				else if (delta_y < delta_x)
				begin
					if (y1 > y2)
					begin
						y_o <= y_o - 1;
					end
					else if (y1 < y2)
					begin
						y_o <= y_o + 1;
					end
				end
			end
			if (delta_y > delta_x)
			begin
				if(y1 > y2)
				begin
					y_o <= y_o - 1;
				end
				else if (y1 < y2)
				begin
					y_o <= y_o + 1;
				end
			end
			else if (delta_y < delta_x)
			begin
				if(x1 > x2)
				begin
					x_o <= x_o - 1;
				end
				else if (x1 < x2)
				begin
					x_o <= x_o + 1;
				end
			end
			else if (delta_y == delta_x)
			begin
				if (x1 > x2 && y1 > y2)
				begin
					x_o <= x_o + 1;
					y_o <= y_o + 1;
				end
				else if (x1 > x2 && y1 < y2)
				begin
					x_o <= x_o - 1;
					y_o <= y_o + 1;
				end
				else if (x1 < x2 && y1 > y2)
				begin
					x_o <= x_o + 1;
					y_o <= y_o - 1;
				end
				else
				begin
					x_o <= x_o - 1;
					y_o <= y_o - 1;
				end
			end
		end
		if (roll == 1'b1)
		begin
			line_complete <= 1'b1;
		end
		else if (max == 1'b0)
		begin
			line_complete <= 1'b1;
		end
	end
end

always_comb
begin
	if (calculate == 1'b1)
	begin
		delta_x = x2 - x1;
		delta_y = y2 - y1;
		if (delta_x[15] ==  1'b1)
		begin
			delta_x = delta_x * -1;
		end
		if (delta_y[15] == 1'b1)
		begin
			delta_y = delta_y * -1;
		end
		if (delta_y > delta_x)
		begin
			min = delta_x;
			max = delta_y;
		end
		else
		begin
			min = delta_y;
			max = delta_x;
		end
		pixels_in_group = max / (min + 1);
		if (max == min)
		begin
			pixels_in_group = 1'b1;
		end
		pixels_missing = max - (min) * pixels_in_group;
		a = max / (pixels_missing + 1);
	end
end	

endmodule

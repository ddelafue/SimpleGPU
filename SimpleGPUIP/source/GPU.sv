// $Id: $
// File name:   GPU.sv
// Created:     4/25/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: The top level file for the whole GPU.

module GPU
(
	input wire clk,
	input wire reset,
	input wire [31:0] fifo_write_data,
	input wire fifo_write,
	input wire SD_waitrequest,
	output wire SD_write,
	output wire [31:0] SD_wdata,
	output wire [27:0] SD_address
);

wire op_rec;
wire frame_ready;
wire data_ready;
wire[15:0] x1;
wire[15:0] y1;
wire[15:0] x2;
wire[15:0] y2;
wire[15:0] x3;
wire[15:0] y3;
wire nxt_tri;

InputDecoder_fifo_RAM U1 (.clk(clk),
			.reset(reset),
			.write(fifo_write),
			.read(), //NOT GPU
			.w_data(fifo_write_data),
			.r_data(), //OUTPUT
			.empty(), //OUTPUT
			.full()); //OUTPUT

InputDecoder U2 (.clk(clk), //NO READ SIGNALS
		.reset(reset),
		.fifo_write(fifo_write),
		.fifo_w_data(fifo_write_data),
		.next_triangle(nxt_tri),
		.opcode_received(op_rec),
		.frame_ready(frame_ready),
		.data_ready(data_ready),
		.x1(x1),
		.y1(y1),
		.x2(x2),
		.y2(y2),
		.x3(x3),
		.y3(y3),
		.TexNum()); //OUTPUT TEXTURE CONTROLLER

Rasteriser U3 (.clk(clk),
		.reset(reset),
		.opcode_received(op_rec),
		.frame_ready(frame_ready),
		.data_ready(data_ready),
		.triangle_done(), //NO IDEA WHERE TRIANGLE DONE GOES
		.x1(x1),
		.y1(y1),
		.x2(x2),
		.y2(y2),
		.x3(x3),
		.y3(y3),
		.clear(), // OUTPUT
		.count_up(), //OUTPUT
		.next_triangle(nxt_tri),
		.load_texture(), // OUTPUT
		.get_rgba(), //OUTPUT
		.get_pixel(), //OUTPUT
		.get_line(), //OUTPUT
		.pixel_number(), //OUTPUT
		.frame_ready_o());




endmodule

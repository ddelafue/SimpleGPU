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
	output wire [27:0] SD_address,
	//DEBUG SIGNALS
	output wire[16:0] write_address,
	output wire write,
	output wire[31:0] write_data
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
wire pix_num;
wire[7:0] w_r;
wire[7:0] w_g;
wire[7:0] w_b;
wire Alpha_read;
wire Alpha_write;
wire A_frame_ready;
wire[7:0] r_r;
wire[7:0] r_g;
wire[7:0] r_b;

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
		.pixel_number(pix_num),
		.frame_ready_o());

AlphaBlender U4 (.clk(clk),
		.reset(reset),
		.pixel_number(pix_num),
		.pixel_ready(), //MAYBE RASTERISER
		.r(), //TEXTURE CONTROLLER
		.g(), //TEXTURE CONTROLLER
		.b(), //TEXTURE CONTROLLER
		.a(), //TEXTURE CONTROLLER
		.read_r(r_r),
		.read_g(r_g),
		.read_b(r_b),
		.frame_ready(frame_ready), //MAY WANT TO USE frame_ready_o
		.finished(), //NO IDEA
		.o_frame_ready(A_frame_ready), //MAY WANT TO USE frame_ready_o
		.read(Alpha_read),
		.write(Alpha_write),
		.write_r(w_r),
		.write_g(w_g),
		.write_b(w_b),
		.pixel_number_o(), //WHY?
		.finished_o()); //AGAIN WHY

OutputController U5 (.clk(clk),
			.reset(reset),
			.write_r(w_r),
			.write_g(w_g),
			.write_b(w_b),
			.M9_write(Alpha_write), //PROLLY WRITE FROM ALPHA
			.read(Alpha_read), //PROLLY READ FROM ALPHA
			.frame_ready(A_frame_ready), //NEED FROM ALPHA
			.Pixel_Number(), //TEXTURE CONTROLLER
			.read_r(r_r),
			.read_g(r_g),
			.read_b(r_b),
			.SD_write(SD_write),
			.SD_wdata(SD_wdata),
			.SD_address(SD_address),
			.waitrequest(SD_waitrequest),
			.finished()); //SOMEWHERE


endmodule

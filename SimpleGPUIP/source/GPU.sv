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
	input wire[16:0] write_address,
	input wire write,
	input wire[31:0] write_data,

	input wire mwrite,
	input wire [7:0] mr,
	input wire [7:0] mg,
	input wire [7:0] mb,
	input wire [16:0] maddress
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
wire[7:0] TexNum;
wire [18:0] pix_num;
wire [16:0] pixel_number_o;
wire finished;
wire finished2;
wire load_texture;
wire get_rgba;
wire get_pixel;
wire pixel_ready;
wire frame_ready2;
wire[7:0] r;
wire[7:0] g;
wire[7:0] b;
wire[7:0] a;
wire[7:0] w_r;
wire[7:0] w_g;
wire[7:0] w_b;

wire[7:0] w_r2;
wire[7:0] w_g2;
wire[7:0] w_b2;
wire Alpha_write2;
wire [16:0] pixel_number_o2;

wire Alpha_read;
wire Alpha_write;
wire A_frame_ready;
wire[7:0] r_r;
wire[7:0] r_g;
wire[7:0] r_b;

assign Alpha_write2 = mwrite ? 1'b1 : Alpha_write;
assign w_r2 = mwrite ? mr : w_r;
assign w_g2 = mwrite ? mg : w_g;
assign w_b2 = mwrite ? mb : w_b;
assign pixel_number_o2 = mwrite ? maddress : pixel_number_o;

	/*
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
	*/

InputDecoder U1 (
		.clk(clk), //NO READ SIGNALS
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
		.TexNum(TexNum)); //OUTPUT TEXTURE CONTROLLER

	/*
		module Rasteriser
		#(
			parameter CALC_WAIT = 14,
			parameter ALPHA_WAIT = 1,
			parameter TEXTURE_WAIT = 2,
			parameter LOG_MAX_WAIT = 4
		)
		(
			input wire clk,
			input wire reset,
			input wire opcode_received,
			input wire frame_ready,
			input wire data_ready,
			input wire finished,
			input wire [15:0] x1,
			input wire [15:0] y1,
			input wire [15:0] x2,
			input wire [15:0] y2,
			input wire [15:0] x3,
			input wire [15:0] y3,
			output reg next_triangle,
			output reg load_texture,
			output reg get_rgba,
			output reg get_pixel,
			output reg [18:0] pixel_number,
			output reg pixel_ready,
			output reg frame_ready_o
		);
	*/

Rasteriser U2 (.clk(clk),
		.reset(reset),
		.opcode_received(op_rec),
		.frame_ready(frame_ready),
		.data_ready(data_ready),
		.finished(finished), // FIXME
		.x1(x1),
		.y1(y1),
		.x2(x2),
		.y2(y2),
		.x3(x3),
		.y3(y3),
		.next_triangle(nxt_tri),
		.load_texture(load_texture), // OUTPUT
		.get_rgba(get_rgba), //OUTPUT
		.get_pixel(get_pixel), //OUTPUT
		.pixel_number(pix_num),
		.pixel_ready(pixel_ready),
		.frame_ready_o(frame_ready2));

	/*
		module TextureController
		(
			//from the Input Controller
			input wire [7:0] TexNum,
			input wire clk,
			input wire reset,
			//from the Rasteriser module 
			input wire load_texture,
			input wire get_rgba,
			//output to the Alpha Blender
			output wire [7:0] red,
			output wire [7:0] green,
			output wire [7:0] blue,
			output wire [7:0] alpha,
			//Connected to the WAM
			
			// DEBUG ONLY!!
			input wire [16:0] write_address,
			input wire write,
			input wire [31:0] write_data
		);
	*/
	
TextureController U3 (
					.TexNum(TexNum),
					.clk(clk),
					.reset(reset),
					.load_texture(load_texture),
					.get_rgba(get_rgba),
					.red(r),
					.green(g),
					.blue(b),
					.alpha(a),
					.write_address(write_address),
					.write(write),
					.write_data(write_data)
					);

	/*
		module AlphaBlender
		#(
			parameter CLKWAIT = 2
		)
		(
			input wire [16:0] pixel_number,
			input wire pixel_ready,
			input wire [7:0] r,
			input wire [7:0] g,
			input wire [7:0] b,
			input wire [7:0] a,
			input wire [7:0] read_r,
			input wire clk,
			input wire reset,
			input wire [7:0] read_g,
			input wire [7:0] read_b,
			input wire frame_ready,
			input wire finished,
			output wire o_frame_ready,
			output wire read,
			output wire write,
			output reg [7:0] write_r,
			output reg [7:0] write_g,
			output reg [7:0] write_b,
			output wire [16:0] pixel_number_o,
			output wire finished_o
		);
	*/

AlphaBlender #(.CLKWAIT(1)) U4 (
		.clk(clk),
		.reset(reset),
		.pixel_number(pix_num[16:0]),
		.pixel_ready(pixel_ready), //MAYBE RASTERISER
		.r(r), //TEXTURE CONTROLLER
		.g(g), //TEXTURE CONTROLLER
		.b(b), //TEXTURE CONTROLLER
		.a(a), //TEXTURE CONTROLLER
		.read_r(r_r),
		.read_g(r_g),
		.read_b(r_b),
		.frame_ready(frame_ready), //MAY WANT TO USE frame_ready_o
		.finished(finished2), //NO IDEA
		.o_frame_ready(A_frame_ready), //MAY WANT TO USE frame_ready_o
		.read(Alpha_read),
		.write(Alpha_write),
		.write_r(w_r),
		.write_g(w_g),
		.write_b(w_b),
		.pixel_number_o(pixel_number_o), //WHY?
		.finished_o(finished)); //AGAIN WHY

	/*
		module OutputController
		(
			input wire reset,
			input wire clk,
			//From the Alpha Blender
			input wire [7:0] write_r,
			input wire [7:0] write_g,
			input wire [7:0] write_b,
			input wire  M9_write,
			input wire read,
			input wire frame_ready,

			//From the Texture Controller
			input wire [16:0] Pixel_Number,

			//output back to Alpha Blender
			output wire [7:0] read_r,
			output wire [7:0] read_g,
			output wire [7:0] read_b,
			//output to the M9. First data written, then control signals
			//output to SD_RAM
			output reg  SD_write,
			output reg [31:0] SD_wdata,
			output reg [27:0] SD_address,
			input wire waitrequest, //wait for this in order to increment the address 
			output reg finished
		);
	*/


OutputController U5 (
			.clk(clk),
			.reset(reset),
			.write_r(w_r2),
			.write_g(w_g2),
			.write_b(w_b2),
			.read(),
			.M9_write(Alpha_write2), //PROLLY WRITE FROM ALPHA
			.frame_ready(A_frame_ready), //NEED FROM ALPHA
			.Pixel_Number(pixel_number_o2), //TEXTURE CONTROLLER
			.read_r(r_r),
			.read_g(r_g),
			.read_b(r_b),
			.SD_write(SD_write),
			.SD_wdata(SD_wdata),
			.SD_address(SD_address),
			.waitrequest(SD_waitrequest),
			.finished(finished2)); //SOMEWHERE


endmodule

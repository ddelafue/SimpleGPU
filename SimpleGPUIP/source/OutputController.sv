// $Id: $
// File name:   OutputController.sv
// Created:     4/19/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Output Controller

module OutputController
(
	//From the Alpha Blender
	input wire [7:0] write_r,
	input wire [7:0] write_g,
	input wire [7:0] write_b,
	input wire write,
	input wire read,
	input wire frame_ready,

	//From the Texture Controller
	input wire [7:0] Pixel_Number,

	//Data from the M9
	input wire [31:0] M9_rdata,

	//output back to Alpha Blender
	output wire [7:0] read_r,
	output wire [7:0] read_g,
	output wire [7:0] read_b,

	//output to the M9. First data written, then control signals
	output wire [31:0] M9_wdata,
	output wire M9_read,
	output wire M9_write,
	output wire M9_Address,
	//output to SD_RAM
	output wire SD_write
	output wire [15:0] SD_wdata,
	output wire [31:0] SD_address,

);

	



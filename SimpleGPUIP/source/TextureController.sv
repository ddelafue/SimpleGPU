// $Id: $
// File name:   TextureController.sv
// Created:     4/21/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: this is the texture controller dot s v. its neat
//
//
module TextureController
(
	//from the Input Controller
	input wire [7:0] TexNum,
	//from the Rasteriser module 
	input wire [18:0] PixNum,
	//from the RAM
	input wire clk,
	input wire [31:0] data,
	input [23:0] read_address,
	//output to the Alpha Blender
	output wire [7:0] red,
	output wire [7:0] green,
	output wire [7:0] blue,
	output wire [7:0] alpha,
	//Connected to the WAM
	input wire [31:0] q,
	output wire [6:0] read_address
	
);


typedef enum bit [2:0] {IDLE,READ,WRITE} stateType;
stateType state;
stateType nxt_state;


	

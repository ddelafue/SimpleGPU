// $Id: $
// File name:   TextureControllerRam.sv
// Created:     4/21/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: How we Access the M9 memory for our texture controller


module TextureControllerRom
	output reg [31:0] q,
	input wire [6:0] read_address,
	input clk
);

/*
	initial
	begin
	$readmemb("ram.txt", ram);
	end
*/

	reg [32:0] mem [3427839:0];

	always @ (posedge clk) begin
		q <= mem[read_address];
	end
endmodule


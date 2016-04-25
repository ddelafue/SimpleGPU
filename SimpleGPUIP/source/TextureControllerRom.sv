// $Id: $
// File name:   TextureControllerRam.sv
// Created:     4/21/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: How we Access the M9 memory for our texture controller


module TextureControllerRom
	output reg [31:0] q,
	input [16:0] read_address, write_address,
	input clk, we 


);

// FIXME NEED TO ADD WRITE SIGNALS AND RENAME TO RAM

/*
	initial
	begin
	$readmemb("ram.txt", ram);
	end
*/

	reg [31:0] mem [107119:0];

	always @ (posedge clk) begin
		if(we)
			mem[write_address] <= data;	
		q <= mem[read_address];
	end
endmodule


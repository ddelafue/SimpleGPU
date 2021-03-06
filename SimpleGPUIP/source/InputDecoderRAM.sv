// $Id: $
// File name:   InputDecoderRAM.sv
// Created:     4/21/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: This is how the Input Decoder reads and writes to the M9K
//

module InputDecoderRAM
(
	    output reg [31:0] q,
		input [31:0] data,
		input [8:0] write_address, read_address,
		input we, clk
);
	reg [31:0] mem [399:0];
	always @ (posedge clk) begin
		if (we)
			mem[write_address] = data;
		q = mem[read_address]; // q does get d in this clock cycle
	end
endmodule

// $Id: $
// File name:   OutputControllerRAM.sv
// Created:     4/21/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: This is how the Output Controller reads and writes to the M9K
//

module OutputControllerRam
(
	    output reg [23:0] q,
		input [23:0] data,
		input [6:0] write_address, read_address,
		input we, clk
);
	reg [23:0] mem [2457599:0];
	always @ (posedge clk) begin
		if (we)
			mem[write_address] <= data;
		q <= mem[read_address]; // q doesn't get d in this clock cycle
	end
endmodule

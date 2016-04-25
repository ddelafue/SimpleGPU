// $Id: $
// File name:   GPU.sv
// Created:     4/25/2016
// Author:      Jordan Huffaker
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: The top level file for the whole GPU.

module GPU
(
	input wire [31:0] fifo_write_data,
	input wire fifo_write,
	input wire SD_waitrequest,
	output wire SD_write,
	output wire [31:0] SD_wdata,
	output wire [27:0] SD_address
);

endmodule

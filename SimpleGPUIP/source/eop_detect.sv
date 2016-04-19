// $Id: $
// File name:   eop_detect.sv
// Created:     2/23/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: plz work
module eop_detect
(
	input wire d_plus,
	input wire d_minus,
	output reg eop
);

int counter = 0;
always_comb
begin
	if ((d_plus == 1'b0) && (d_minus == 1'b0))
	begin
		eop = 1'b1;
	end
	else
		eop = 1'b0;


end

endmodule


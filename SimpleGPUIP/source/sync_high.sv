// $Id: $
// File name:   synch_high.sv
// Created:     1/25/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: part 2

module sync_high
(
        input wire clk,
        input wire n_rst,
        input wire async_in,
        output reg sync_out
);

reg values;

always_ff @ (posedge clk, negedge n_rst)
begin
        if(1'b0 == n_rst)
        begin
                sync_out <= 1'b1;
		values <= 1'b1;
        end
        else
        begin
                sync_out <= values;
                values <= async_in;
        end
end
endmodule

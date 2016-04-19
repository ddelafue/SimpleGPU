// $Id: $
// File name:   edge_detect.sv
// Created:     2/23/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: let's go
module edge_detect
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	output reg d_edge
);
reg check;
reg new_input;
reg old_input;
typedef enum bit [1:0] {IDLE,COUNT} stateType;
stateType state;
stateType nxt_state;

always_ff @ (negedge n_rst, posedge clk)
begin
		if(n_rst == 1'b0)
		begin
			new_input <= 1'b1;
			old_input <= 1'b1;
			state <= IDLE;
		end
		else
		begin
			new_input <= d_plus;
			old_input <= new_input;
			state <= nxt_state;
		end
end

always_comb
begin
		nxt_state = state;
		case(state)
		IDLE:
		begin
				nxt_state = COUNT;
		end
		endcase
end

always_comb
begin
		d_edge = 1'b0;
		case(state)
		IDLE:
		begin
			d_edge = 1'b0;
		end
		COUNT:
		begin
			d_edge = (new_input^old_input);
		end
		endcase

end
		
				

endmodule

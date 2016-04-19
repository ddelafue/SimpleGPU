// $Id: $
// File name:   decode.sv
// Created:     2/23/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: decode

module decode
(
	input wire clk,
	input wire n_rst, 
	input wire d_plus,
	input wire shift_enable,
	input wire eop,
	output reg d_orig
);
reg new_sample;
reg old_sample;
reg nxt_old_sample;
typedef enum bit [1:0] {IDLE,COUNT,SHIFTCOUNT,SHIFTEOP} stateType;
stateType state;
stateType nxt_state;
always_ff @ (negedge n_rst, posedge clk)
begin
		if(n_rst == 1'b0)
		begin
			new_sample <= 1'b1;
			old_sample <= 1'b1;
			state <= IDLE;
		end
		else
		begin
			old_sample <= nxt_old_sample;
			new_sample <= d_plus;
			state <= nxt_state;
		end
end

always_comb
begin
		nxt_state = state;
		nxt_old_sample = old_sample;
		case(state)
		IDLE:
		begin
				nxt_old_sample = 1;
				if(shift_enable == 1 && eop == 1)
					nxt_state = SHIFTEOP;	
				else if(shift_enable == 1)
					nxt_state = SHIFTCOUNT;
				else
					nxt_state = COUNT;
		end
		COUNT:
		begin
				if(shift_enable == 1 && eop == 1)
					nxt_state = SHIFTEOP;	
				else if (shift_enable == 1) begin
					nxt_state = SHIFTCOUNT;
					nxt_old_sample = d_plus;
				end else
					nxt_state = COUNT;
		end
		SHIFTCOUNT:
		begin
				nxt_state = COUNT;
		end
		SHIFTEOP:
		begin
				nxt_old_sample = 1;
				nxt_state = IDLE;
		end
		endcase
end

always_comb
begin
		d_orig = 1'b0;
		case(state)
		IDLE:
		begin
			d_orig = 1'b1;
		end
		COUNT:
		begin
			d_orig = ~(old_sample ^ new_sample);
		end

		SHIFTCOUNT:
		begin
				d_orig = ~(nxt_old_sample ^ new_sample);
		end
		endcase
end

endmodule

			

				



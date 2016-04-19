// $Id: $
// File name:   rcu.sv
// Created:     2/23/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: rcu block
module rcu
(
	input wire clk,
	input wire n_rst,
	input wire d_edge,
	input wire eop,
	input wire shift_enable,
	input wire [7:0] rcv_data,
	input wire byte_received,
	output reg rcving,
	output reg w_enable,
	output reg r_error
);

typedef enum bit [4:0] {IDLE, EIDLE, S_CAP, REC_BYT, WBYT, ERROR,REC_BIT, DL, DL1 } stateType;
stateType state;
stateType nxt_state;
always_ff @ (negedge n_rst, posedge clk)
begin
	if(n_rst == 1'b0)
	begin
			state <= IDLE;
	end
	else
	begin
			state <= nxt_state;
	end
end

always_comb //state
begin
	nxt_state = state;
	rcving = 1'b0;
	w_enable = 1'b0;
	r_error = 1'b0;
	case(state)
	IDLE:
	begin
		if (d_edge == 1'b1)
			nxt_state = S_CAP; 

		rcving = 1'b0;
		w_enable = 1'b0;
		r_error = 1'b0;
	end
	EIDLE:
	begin
		if (d_edge == 1'b1)
			nxt_state = S_CAP;


		rcving = 1'b0;
		w_enable = 1'b0;
		r_error = 1'b1;
	
	end
	S_CAP:
	begin
		rcving = 1'b1;
		w_enable = 1'b0;
		r_error = 1'b0;
		if (byte_received == 1'b0)
			nxt_state = S_CAP;
		else if (byte_received == 1'b1)
		begin
			if (rcv_data == 8'b100000000)
				nxt_state = REC_BIT;
			else
				nxt_state = ERROR;
		end

	end


	REC_BIT:
	begin
		rcving = 1'b1
		if(!eop && shift_enable )
		begin
			nxt_state = REC_BYT;
		end

		if(shift_enable && eop)
		begin
			nxt_state = DLY;
		end
	end

	DL1:
	begin
		if(!d_edge)
		begin
			nxt_state = DL1;
		end
		else
		begin
			nxt_state = EIDLE;
		end
		rcving = 1'b1;
		w_enable = 1'b0;
		r_error = 1'b1;
	end


	DL:
	begin
		if(!d_edge)
		begin
			nxt_state = DL;
		end
		else
		begin
			nxt_state = IDLE;
		end
		rcving = 1'b1;
		w_enable = 1'b0;
		r_error = 1'b0;
	end


	REC_BYT:
	begin
		if (!byte_received)
			nxt_state = REC_BYT;
		else if (byte_received == 1'b1)
			nxt_state = WBYT;
		if(eop)
		begin
			next = ERROR;
		end

		rcving = 1'b1;
		w_enable = 1'b0;
		r_error = 1'b0;

	end
	WBYT:
	begin
		rcving = 1'b1;
		w_enable = 1'b1;
		r_error = 1'b0;
		nxt_state = REC_BIT;
	end

	ERROR:
	begin
		if(eop && shift_enable)
		begin
			nxt_state = DL1;
		end
		else
		begin
			next = ERROR;
		end

		rcving = 1'b1;
		w_enable = 1'b0;
		r_error = 1'b1;

	end

	endcase
end
endmodule


		


			
		
		



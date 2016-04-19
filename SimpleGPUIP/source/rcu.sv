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

typedef enum bit [4:0] {IDLE, EIDLE, S_CAP, WAIT, SCHK, REC_BYT, WBYT, CHK, ERROR, EOP1,EOP2} stateType;
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
		rcving = 1'b0;
		w_enable = 1'b0;
		if (d_edge == 1'b1)
			nxt_state = S_CAP; 
	end
	EIDLE:
	begin
		rcving = 1'b0;
		w_enable = 1'b0;
		r_error = 1'b1;
		if (d_edge == 1'b1)
			nxt_state = S_CAP;
	end
	S_CAP:
	begin
		rcving = 1'b1;
		w_enable = 1'b0;
		r_error = 1'b0;
		if (byte_received == 1'b0)
			nxt_state = S_CAP;
		else if (byte_received == 1'b1)
			nxt_state = SCHK;	
	end
	SCHK:
	begin
		rcving = 1'b1;
		w_enable = 1'b0;
		r_error = 1'b0;
		if (rcv_data == 8'b10000000)
			nxt_state = REC_BYT;
		else
			nxt_state = ERROR;
	end

	REC_BYT:
	begin
		rcving = 1'b1;
		w_enable = 1'b0;
		r_error = 1'b0;
		if (eop == 1'b1 && shift_enable == 1'b1)
			nxt_state = ERROR;
		else if (byte_received == 1'b1)
			nxt_state = WBYT;
	end
	WBYT:
	begin
		rcving = 1'b1;
		w_enable = 1'b1;
		r_error = 1'b0;
		nxt_state = CHK;
	end
	CHK:
	begin
		rcving = 1'b1;
		if(shift_enable == 1'b1 && eop == 1'b1)
			nxt_state = EOP1;
		else if (shift_enable == 1'b1)
			nxt_state = REC_BYT;
	end
			
	EOP1:
	begin
		rcving = 1'b1;
		if((eop == 1'b0) && (shift_enable == 1'b1))
			nxt_state = IDLE;
	end
	ERROR:
	begin
		rcving = 1'b1;
		r_error = 1'b1;
		nxt_state = WAIT;
	end
	WAIT:
	begin
		rcving  = 1'b1;
		r_error = 1'b1;
		if (eop == 1'b1 && shift_enable == 1'b1)
			nxt_state = EOP2;
		else
			nxt_state = WAIT;
	end
	EOP2:
	begin
		rcving = 1'b1;
		r_error = 1'b1;
		if((eop == 1'b0) && (shift_enable == 1'b1))
			nxt_state = EIDLE;
	end			
	endcase
end
endmodule


		


			
		
		



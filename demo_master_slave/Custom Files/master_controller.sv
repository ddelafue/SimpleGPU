// This module brought to you by Matthew Leiter (and Noah)! 

/* ---------------------------------- I/O DECLARATION ------*/

module master_controller(
	input wire clk,				
	input wire n_rst,			 
	input wire[8:0]res, // data we need to calcualte new_val
	input wire [35:0]corner, // data we need to calculate new_val
	input wire new_input, // tells us we have new input
	input wire [29:0] ready,
	output reg start, // controls the start of the icb blocks
	output reg [557:0] new_val,
	output reg [3:0] sectnum
	// output reg [17:0] offset
	); 

/* ----------- Internal Signals -------------------*/

reg count_enable; // needed for counter
reg clear;
/* ------------------------------- CREATE STATES -----------------*/

typedef enum bit [5:0] 
			{ 
			// state names in hurr
			RECEIVE_INPUT, START_ICB, WAIT_ICB, CHECK
			}stateList;
stateList state;
stateList nxt_state;


/* ------------------ Generate Connections for new_val (parsing input) ----------------*/

initial_calculator b_initial_calculator(.clk, 
										.n_rst,
										.corner_b(corner[17:0]),
										.res,
										.sectnum,
										.load_val(new_val[539:0])
										);

assign new_val[557:540] = corner[35:18];




/* ----------------- Generate sectnum counter -----------------*/

counter b_counter(.clk, .n_rst, .clear, .count_enable, .sectnum);



/* -------------------------------- TRANSITION LOGIC ------*/
always_comb
	begin
		nxt_state = state;
		case(state)

		RECEIVE_INPUT:
			begin
				if(new_input)
					begin
						nxt_state = START_ICB;
					end				
			end
		
		START_ICB:
			begin
				nxt_state = WAIT_ICB;
			end
		
		WAIT_ICB: 
			begin
				if(ready == 30'b111111111111111111111111111111)
					begin
						nxt_state = CHECK; 
					end
			end
		
		CHECK:
			begin
				if(sectnum == 15) 
					begin
						nxt_state = RECEIVE_INPUT;
					end
				else if(sectnum != 15)
					begin
						nxt_state = START_ICB;
					end
			end	

		endcase

	end


/* ---------------------------------- OUTPUT LOGIC ----------------*/
always_comb
	begin
		// Set default values
		start = 0;
		count_enable = 0;
		clear = 0;
		case(state)
		START_ICB:
			begin
				start = 1;
				//count_enable = 1;
			end
		CHECK: count_enable=1;
		RECEIVE_INPUT: clear = 1;

		endcase
	end

/* --------------------------------- FLIP FLOPS ------*/

always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 0)
			begin
				state <= RECEIVE_INPUT;
			end
		else

			begin
				state <= nxt_state;
			end
	end





endmodule
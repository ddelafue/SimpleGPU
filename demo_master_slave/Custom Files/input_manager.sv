// $Id: $
// File name:   input_manager.sv
// Created:     12/1/2015
// Author:      Lucas Goedde
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Input Manager for Mandelbrot Project

module input_manager
(
	input wire clk,
	input wire n_rst,
	input wire [35:0]corner_d,
	input wire [9:0]maxiter_d,
	input wire [8:0]res_d,
	input wire write,

	output wire [35:0]corner,
	output wire [9:0]maxiter,
	output wire [8:0]res,
	output reg new_input
);
	typedef enum bit [3:0] {idle,wr0,wt0,wr1,wt1,wr2,wt2,wr3,wt3,wr4,load,ready} IM_STATE;
	
	IM_STATE curr_imstate;
	IM_STATE next_imstate;
	reg load_flag;
	reg [35:0]curr_corner;
	reg [9:0]curr_maxiter;
	reg [8:0]curr_res;

	assign corner = curr_corner;
	assign maxiter = curr_maxiter;
	assign res = curr_res;

	always_ff @(posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
		begin
			curr_imstate <= idle;
			//curr_imstate <= load;
			curr_corner <= 0;
			curr_maxiter <=0;
			curr_res <= 0;
		end
		else
		begin
			curr_imstate <= next_imstate;
			if(load_flag == 1)
			begin
				curr_corner <= corner_d;
				curr_maxiter <= maxiter_d;
				curr_res <= res_d;
			end
			else
			begin
				curr_corner <= curr_corner;
				curr_maxiter <= curr_maxiter;
				curr_res <= curr_res;
			end
				
		end
	end

	always_comb 
	begin
		next_imstate = curr_imstate;
		load_flag = 0;
		new_input = 0;
		
		case(curr_imstate)
		idle:
		begin
			if(write == 1)
			begin
				next_imstate = wr0;
			end
			else
			begin
				next_imstate = idle;
			end
		end
		
		wr0:
		begin
			if(write == 0)
			begin
				next_imstate = wt0;
			end
			else
			begin
				next_imstate = wr0;
			end
		end

		wt0:
		begin
			if(write == 1)
			begin
				next_imstate = wr1;
			end
			else
			begin
				next_imstate = wt0;
			end
		end

		wr1:
		begin
			if(write == 0)
			begin
				next_imstate = wt1;
			end
			else
			begin
				next_imstate = wr1;
			end
		end

		wt1:
		begin
			if(write == 1)
			begin
				next_imstate = wr2;
			end
			else
			begin
				next_imstate = wt1;
			end
		end

		wr2:
		begin
			if(write == 0)
			begin
				next_imstate = wt2;
			end
			else
			begin
				next_imstate = wr2;
			end
		end
		
		wt2:
		begin
			if(write == 1)
			begin
				next_imstate = wr3;
			end
			else
			begin
				next_imstate = wt2;
			end
		end
		
		wr3:
		begin
			if(write == 0)
			begin
				next_imstate = wt3;
			end
			else
			begin
				next_imstate = wr3;
			end
		end

		wt3:
		begin
			if(write == 1)
			begin
				next_imstate = wr4;
			end
			else
			begin
				next_imstate = wt3;
			end
		end
		
		wr4:
		begin
			if(write == 0)
			begin
				next_imstate = load;
			end
			else
			begin
				next_imstate = wr4;
			end
		end
		load:
		begin
			next_imstate = ready;
			load_flag = 1;
		end

		ready:
		begin
			next_imstate = idle;
			new_input = 1;
		end
		endcase	
	end
endmodule

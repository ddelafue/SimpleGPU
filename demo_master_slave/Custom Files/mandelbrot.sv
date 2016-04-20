/* This module brought to you by Matt Leiter! */

module mandelbrot(
	input wire clk,			
	input wire n_rst,
	input wire buswait,
	input wire [35:0]corner_d,
	input wire [9:0]maxiter_d,
	input wire [8:0]res_d,
	input wire write, 
	input wire mode,
	output reg [31:0]addr,
	output reg [23:0]rgb_data,
	output reg wenable
	);




/* -----------Internal Signals of Mandelbrot -------- */
	
	/* Signals made in input_manager */
	wire [35:0]corner;
	wire [9:0]maxiter;
	wire [8:0]res;
	reg new_input;

	/* Signals made in icb */
	reg [29:0][9:0]count ;
	reg [29:0] ready;
	reg [29:0] done; 
	reg [299:0] bitNum; 

	/* Signals made in master_controller */
	reg start; 
	reg [557:0] new_val;
	reg [3:0] sectnum;

	/* Signals made in memory_controller */
	reg [31:0]address;
	reg [23:0]data;
	reg wen;
	reg [29:0]shake;
	genvar i;




/* -----------Creation of Blocks-------- */

master_controller b_master_controller( // inputs
									  .clk,
									  .n_rst,
									  .res,
									  .corner,
									  .new_input,
									  .ready,
									  // outputs
									  .start(start),
									  .new_val,
									  .sectnum
									 );


memory_controller b_memory_controller(	// inputs
										.clk,
										.n_rst,
										.bitNum, 
										.count,
										.maxiter,
										.buswait, 
										.done,
										.sectnum,
										.mode,
										// outputs
										.address(addr),
										.data(rgb_data), 
										.wen(wenable),
										.shake
									 ); 

input_manager b_input_manager		(	// inputs
										.clk,		
										.n_rst,
										.corner_d, 
										.res_d,
										.maxiter_d,
										.write,
										// outputs
			 							.corner,  	
			 							.maxiter, 	
			 							.res,		
			 							.new_input
							 		);

// ICBs new_val format is a_b. 0_17 is a, with other spectrums being b
generate

	for(i=0; i<=29; i=i+1) begin: MYGEN
		icb ICBX(
			.clk, 
			.n_rst,
			.shake(shake[i]),
			.start, 
			.res, 
			.maxiter,
			.newval({new_val[557 -: 18], new_val[(18*i+17) -: 18]}), 
			// outputs
			.bitNum(bitNum[(10*i+9) -: 10]),
			.count(count[i]), 
			.ready(ready[i]),
			.done(done[i]));
	end
endgenerate
endmodule



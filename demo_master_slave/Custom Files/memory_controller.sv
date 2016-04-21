// $Id: $
// File name:   MemoryCont.sv
// Created:     12/1/2015
// Author:      Emily Fredette
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Memory Controller

module memory_controller
#(	//30 instances of ICB
	parameter NUM = 30,
	parameter ASIZE = 32,
	parameter START = 'h08000000
)
(
	input wire clk,
	input wire n_rst,
	input wire[NUM-1:0] done, //indicates which ICB instances are done and ready to save to memory
	input wire[(NUM*10)-1:0] bitNum, //column
	input wire[NUM-1:0][9:0] count, //number of iterations it took to escape
	input wire[9:0] maxiter, //max number of iterations, eg 1000
	input wire [3:0] sectnum, //section number
	input wire buswait,
	input wire mode,
	output wire [ASIZE-1:0] address,
	output wire [23:0] data,
	output reg wen,
	output reg [29:0] shake
);
	//address info
	//x = bitnum
	//y = icbnum + 30*sectnum
	//localparam MULTIPLY = 10'b0001010110;
	//5 states
	typedef enum bit [2:0] {IDLE, ARB, CALC, WRITE, DONE} stateType;
	stateType state;
	stateType next_state;

	reg [4:0] curr_write_icb;
	reg [29:0] mask;
	reg [29:0] tmp_mask;
	reg [4:0] next_icb;

	reg [7:0] r;
	reg [7:0] g;
	reg [7:0] b;
	reg [7:0] nr;
	reg [7:0] ng;
	reg [7:0] nb;
	reg [9:0] temp2;
	//genvar i;
	reg [19:0] temp;
	assign data[23:0] = {b,g,r};

	reg [9:0] increment;
	assign temp2 = bitNum[(curr_write_icb*10+9) -: 10];
	//assign increment = maxiter / 10'd12; //12 colors
	//assign temp [19:0] = maxiter * 10'b0001010110;
	//assign increment [9:0]= temp[19:10];
	always_comb
	begin
		temp = maxiter * 10'b0001010110;
		increment = temp[19:10];
	end

	reg [ASIZE-1:0] address_tmp;
	assign address = address_tmp;

	always_ff @ (negedge n_rst, posedge clk)
	begin
		if(n_rst == 1'b0)
		begin
			state <= IDLE;
		end
		else
		begin
			state <= next_state;
		end
	end

	always_comb //ARB logic here
	begin
	tmp_mask[29:0] = 30'b111111111111111111111111111111;
	next_icb = 'd0;
	if (state == ARB)
	begin
		if(done[0] && mask[0])
			begin
				next_icb = 'd0;
				tmp_mask[29:0] = 30'b111111111111111111111111111110;
			end
		else if(done[1] && mask[1])
			begin
				next_icb = 'd1;
				tmp_mask[29:0] = 30'b111111111111111111111111111100;
			end
		else if(done[2] && mask[2])
			begin
				next_icb = 'd2;
				tmp_mask[29:0] = 30'b111111111111111111111111111000;
			end
		else if(done[3] && mask[3])
			begin
				next_icb = 'd3;
				tmp_mask[29:0] = 30'b111111111111111111111111110000;
			end
		else if(done[4] && mask[4])
			begin
				next_icb = 'd4;
				tmp_mask[29:0] = 30'b111111111111111111111111100000;
			end
		else if(done[5] && mask[5])
			begin
				next_icb = 'd5;
				tmp_mask[29:0] = 30'b111111111111111111111111000000;
			end
		else if(done[6] && mask[6])
			begin
				next_icb = 'd6;
				tmp_mask[29:0] = 30'b111111111111111111111110000000;
			end
		else if(done[7] && mask[7])
			begin
				next_icb = 'd7;
				tmp_mask[29:0] = 30'b111111111111111111111100000000;
			end
		else if(done[8] && mask[8])
			begin
				next_icb = 'd8;
				tmp_mask[29:0] = 30'b111111111111111111111000000000;
			end
		else if(done[9] && mask[9])
			begin
				next_icb = 'd9;
				tmp_mask[29:0] = 30'b111111111111111111110000000000;
			end
		else if(done[10] && mask[10])
			begin
				next_icb = 'd10;
				tmp_mask[29:0] = 30'b111111111111111111100000000000;
			end
		else if(done[11] && mask[11])
			begin
				next_icb = 'd11;
				tmp_mask[29:0] = 30'b111111111111111111000000000000;
			end
		else if(done[12] && mask[12])
			begin
				next_icb = 'd12;
				tmp_mask[29:0] = 30'b111111111111111110000000000000;
			end
		else if(done[13] && mask[13])
			begin
				next_icb = 'd13;
				tmp_mask[29:0] = 30'b111111111111111100000000000000;
			end
		else if(done[14] && mask[14])
			begin
				next_icb = 'd14;
				tmp_mask[29:0] = 30'b111111111111111000000000000000;
			end
		else if(done[15] && mask[15])
			begin
				next_icb = 'd15;
				tmp_mask[29:0] = 30'b111111111111110000000000000000;
			end
		else if(done[16] && mask[16])
			begin
				next_icb = 'd16;
				tmp_mask[29:0] = 30'b111111111111100000000000000000;
			end
		else if(done[17] && mask[17])
			begin
				next_icb = 'd17;
				tmp_mask[29:0] = 30'b111111111111000000000000000000;
			end
		else if(done[18] && mask[18])
			begin
				next_icb = 'd18;
				tmp_mask[29:0] = 30'b111111111110000000000000000000;
			end
		else if(done[19] && mask[19])
			begin
				next_icb = 'd19;
				tmp_mask[29:0] = 30'b111111111100000000000000000000;
			end
		else if(done[20] && mask[20])
			begin
				next_icb = 'd20;
				tmp_mask[29:0] = 30'b111111111000000000000000000000;
			end
		else if(done[21] && mask[21])
			begin
				next_icb = 'd21;
				tmp_mask[29:0] = 30'b111111110000000000000000000000;
			end
		else if(done[22] && mask[22])
			begin
				next_icb = 'd22;
				tmp_mask[29:0] = 30'b111111100000000000000000000000;
			end
		else if(done[23] && mask[23])
			begin
				next_icb = 'd23;
				tmp_mask[29:0] = 30'b111111000000000000000000000000;
			end
		else if(done[24] && mask[24])
			begin
				next_icb = 'd24;
				tmp_mask[29:0] = 30'b111110000000000000000000000000;
			end
		else if(done[25] && mask[25])
			begin
				next_icb = 'd25;
				tmp_mask[29:0] = 30'b111100000000000000000000000000;
			end
		else if(done[26] && mask[26])
			begin
				next_icb = 'd26;
				tmp_mask[29:0] = 30'b111000000000000000000000000000;
			end
		else if(done[27] && mask[27])
			begin
				next_icb = 'd27;
				tmp_mask[29:0] = 30'b110000000000000000000000000000;
			end
		else if(done[28] && mask[28])
			begin
				next_icb = 'd28;
				tmp_mask[29:0] = 30'b100000000000000000000000000000;
			end
		else if(done[29] && mask[29])
			begin
				next_icb = 'd29;
				tmp_mask[29:0] = 30'b000000000000000000000000000000;
			end
		else
			begin
				next_icb = 'd0;
				tmp_mask[29:0] = 30'b111111111111111111111111111111;
			end
	end
	end

	always_ff @ (negedge n_rst, posedge clk)
	begin
		if(n_rst == 1'b0)
		begin
			curr_write_icb[4:0] <= '0;
			mask[29:0] <= '1;
			address_tmp <= START;
		end
		else if (state == ARB)
		begin
			curr_write_icb <= next_icb;
			mask <= tmp_mask;
			//address_tmp <= START + 4 * (bitNum[(curr_write_icb+1)*10-1:curr_write_icb*10] + curr_write_icb + 30 * sectnum);
			//address_tmp <= START + 4 * (bitNum[(curr_write_icb+1)*10-1 +: 10] + curr_write_icb + 30 * 640* sectnum);
			address_tmp <= START + 4 * (temp2 + 640*(next_icb/*curr_write_icb*/ + 30 * sectnum));
		end
		else
		begin
			curr_write_icb <= curr_write_icb;
			mask <= mask;
			address_tmp <= address_tmp;
		end
	end

	always_comb
	begin
	if (mode == 1'b1) begin
		if (count[curr_write_icb][9:0] == maxiter)
		begin
			//WHITE
			nr = 'd255;
			ng = 'd255;
			nb = 'd255;
		end
		else if (count[curr_write_icb][9:0]%64 < 4)//count[curr_write_icb][9:0] < increment)
		begin
			// RED
			nr = 'd170;
			ng = 'd0;
			nb = 'd0;
		end
		else if (count[curr_write_icb][9:0]%64 < 8)//count[curr_write_icb][9:0] < increment*2)
		begin
			// BRIGHT RED
			nr = 'd255;
			ng = 'd85;
			nb = 'd85;
		end
		else if (count[curr_write_icb][9:0]%64 < 12)//count[curr_write_icb][9:0] < increment*3)
		begin
			// YELLOW
			nr = 'd255;
			ng = 'd255;
			nb = 'd85;
		end
		else if (count[curr_write_icb][9:0]%64 < 16)//count[curr_write_icb][9:0] < increment*4)
		begin
			// BRIGHT GREEN
			nr = 'd85;
			ng = 'd255;
			nb = 'd85;
		end
		else if (count[curr_write_icb][9:0]%64 < 20)//count[curr_write_icb][9:0] < increment*5)
		begin
			// GREEN
			nr = 'd0;
			ng = 'd170;
			nb = 'd0;
		end
		else if (count[curr_write_icb][9:0]%64 < 24)//count[curr_write_icb][9:0] < increment*6)
		begin
			// BRIGHT BLUE
			nr = 'd85;
			ng = 'd85;
			nb = 'd255;
		end
		else if (count[curr_write_icb][9:0]%64 < 28)//count[curr_write_icb][9:0] < increment*7)
		begin
			// BLUE
			nr = 'd0;
			ng = 'd0;
			nb = 'd170;
		end
		else if (count[curr_write_icb][9:0]%64 < 32)//count[curr_write_icb][9:0] < increment*8)
		begin
			// BRIGHT CYAN
			nr = 'd85;
			ng = 'd255;
			nb = 'd255;
		end
		else if (count[curr_write_icb][9:0]%64 < 36)//count[curr_write_icb][9:0] < increment*9)
		begin
			// CYAN
			nr = 'd0;
			ng = 'd170;
			nb = 'd170;
		end
		else if (count[curr_write_icb][9:0]%64 < 40)//count[curr_write_icb][9:0] < increment*10)
		begin
			// BRIGHT MAGENTA
			nr = 'd255;
			ng = 'd85;
			nb = 'd255;
		end
		else if (count[curr_write_icb][9:0]%64 < 44)//count[curr_write_icb][9:0] < increment*11)
		begin
			// MAGENTA
			nr = 'd170;
			ng = 'd0;
			nb = 'd170;
		end
		////////////////////////added for modulus
		else if (count[curr_write_icb][9:0]%64 < 48)//count[curr_write_icb][9:0] < increment*11)
		begin
			// PURPLE
			nr = 'd127;
			ng = 'd0;
			nb = 'd255;
		end
		else if (count[curr_write_icb][9:0]%64 < 52)//count[curr_write_icb][9:0] < increment*11)
		begin
			// PLUM
			nr = 'd51;
			ng = 'd0;
			nb = 'd102;
		end
		else if (count[curr_write_icb][9:0]%64 < 56)//count[curr_write_icb][9:0] < increment*11)
		begin
			// PINK
			nr = 'd255;
			ng = 'd71;
			nb = 'd213;
		end
		else if (count[curr_write_icb][9:0]%64 < 60)//count[curr_write_icb][9:0] < increment*11)
		begin
			// DARK PLUM
			nr = 'd137;
			ng = 'd0;
			nb = 'd105;
		end
		else
		begin
			// BLACK
			nr = 'd0;
			ng = 'd0;
			nb = 'd0;
		end
		end else begin
		//////end modulus
			if (count[curr_write_icb][9:0] < increment)
			begin
				// RED
				nr = 'd170;
				ng = 'd0;
				nb = 'd0;
			end
			else if (count[curr_write_icb][9:0] < increment*2)
			begin
				// BRIGHT RED
				nr = 'd255;
				ng = 'd85;
				nb = 'd85;
			end
			else if (count[curr_write_icb][9:0] < increment*3)
			begin
				// YELLOW
				nr = 'd255;
				ng = 'd255;
				nb = 'd85;
			end
			else if (count[curr_write_icb][9:0] < increment*4)
			begin
				// BRIGHT GREEN
				nr = 'd85;
				ng = 'd255;
				nb = 'd85;
			end
			else if (count[curr_write_icb][9:0] < increment*5)
			begin
				// GREEN
				nr = 'd0;
				ng = 'd170;
				nb = 'd0;
			end
			else if (count[curr_write_icb][9:0] < increment*6)
			begin
				// BRIGHT BLUE
				nr = 'd85;
				ng = 'd85;
				nb = 'd255;
			end
			else if (count[curr_write_icb][9:0] < increment*7)
			begin
				// BLUE
				nr = 'd0;
				ng = 'd0;
				nb = 'd170;
			end
			else if (count[curr_write_icb][9:0] < increment*8)
			begin
				// BRIGHT CYAN
				nr = 'd85;
				ng = 'd255;
				nb = 'd255;
			end
			else if (count[curr_write_icb][9:0] < increment*9)
			begin
				// CYAN
				nr = 'd0;
				ng = 'd170;
				nb = 'd170;
			end
			else if (count[curr_write_icb][9:0] < increment*10)
			begin
				// BRIGHT MAGENTA
				nr = 'd255;
				ng = 'd85;
				nb = 'd255;
			end
			else if (count[curr_write_icb][9:0] < increment*11)
			begin
				// MAGENTA
				nr = 'd170;
				ng = 'd0;
				nb = 'd170;
			end
			else
			begin
				// WHITE
				nr = 'd255;
				ng = 'd255;
				nb = 'd255;
			end	
		end
		end

		always_ff @ (negedge n_rst, posedge clk)
		begin
			if(n_rst == 1'b0)
			begin
				r[7:0] <= '0;
				g[7:0] <= '0;
				b[7:0] <= '0;
			end
			else 
			begin
				if (state == CALC)
				begin
				r[7:0] <= nr[7:0];
				g[7:0] <= ng[7:0];
				b[7:0] <= nb[7:0];
				end
				else
				begin
				r[7:0] <= r[7:0];
				g[7:0] <= g[7:0];
				b[7:0] <= b[7:0];
				end
			end
		end

		always_comb
		begin
			next_state = state;

			wen = 0;
			shake = '0;

			case(state)

			IDLE: begin

				if (done != 0)
				begin
					next_state = ARB;
				end
			end

			ARB: begin
				next_state = CALC;
				//controls ICB and mask logic
			end

			CALC: begin
				if (!buswait)
					next_state = WRITE;
			end

			WRITE: begin
				//address = 
				//data = 
				wen = 1;
				if (buswait == 0)
				begin
					next_state = DONE;
				end
			end

			DONE: begin
				shake[curr_write_icb] = 1'b1;
				if (done == '0)
				begin
					next_state = IDLE;
				end
				else //if (done != 0)
				begin
					next_state = ARB;
				end
			end
		endcase
	end
endmodule

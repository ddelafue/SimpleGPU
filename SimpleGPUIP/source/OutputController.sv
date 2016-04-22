// $Id: $
// File name:   OutputController.sv
// Created:     4/19/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Output Controller

module OutputController
(
	input wire n_rst;	
	//From the Alpha Blender
	input wire [7:0] write_r,
	input wire [7:0] write_g,
	input wire [7:0] write_b,
	input wire write,
	input wire read,
	input wire frame_ready,

	//From the Texture Controller
	input wire [16:0] Pixel_Number,

	//Data from the M9
	input wire [23:0] M9_rdata,
	output wire [23:0] M9_wdata,
	output wire [16:0] read_address, write_address,
	output wire we,



	//output back to Alpha Blender
	output wire [7:0] read_r,
	output wire [7:0] read_g,
	output wire [7:0] read_b,

	//output to the M9. First data written, then control signals
	output wire  M9_write,
	//output to SD_RAM
	output wire SD_write,
	output wire [31:0] SD_wdata,
	output wire [25:0] SD_address,
	input wire waitrequest //wait for this in order to increment the address 
);

typedef enum bit [2:0] {M9BLEND,M9SDRAM}
int current_MADDR = 0;
int current_MADDW = 0;
stateType state;
stateType nxt_state;

assign M9_write = {{write_r},{write_g},{write_b}};
RAM m9write (.q(M9_rdata), .data(M9_wdata), .write_address(write_address), .read_address(read_address), .we(M9_write), .clk(clk));


always_ff @ (negedge n_rst, posedge clk)
begin
	if(n_rst == 1'b0)
	begin
		state <= M9BLEND;
	end
	else
	begin
		state <= nxt_state;
		if((write == 1'b1) && (state == M9BLEND))
		begin
			write_address <= write_address + 1;
			read_address <= 0;
		end
		else if(read == 1'b1) && (state == M9BLEND))
		begin
			read_address <= Pixel_Number
			write_address <= write_address
		end
			
	end
end 


always_ff @ (negedge n_rst, posedge clk)
begin
	if(n_rst == 1'b0)
	begin
		state <= M9BLEND
	end
	else
	begin
	

always_comb
begin
	nxt_state = state;
	case(state)
	M9BLEND:
	begin
		if(frame_ready == 1'b1)
		begin
			nxt_state = M9SDRAM
	end
	M9SDRAM:
	begin
		nxt_state = M9SDRAM
	endcase
end


always_comb
begin
	//initialize values here. idk what these will be yet tho//
	case(state)
	M9BLEND:
	begin
		if (write == 1'b1)
		begin
			M9_write = 1'b1;
		end
		else if (read == 1'b1)
		begin
			M9_write = 1'b0;
		end
	M9SDRAM:
	begin

		
		
		
		








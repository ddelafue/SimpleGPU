// $Id: $
// File name:   OutputController.sv
// Created:     4/19/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Output Controller

module OutputController
(
	input wire n_rst,	
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
int sd_m9_read_pixel = 0;
stateType state;
stateType nxt_state;
wire next_SD_address;
wire [16:0] next_write_address;
wire [16:0] next_read_address;
wire [16:0] SD_read_address = 17'b00000000000000000;
wire [16:0] backward_m9;
wire [7:0] nothing = 8'b00000000
wire [16:0] pixel_count = 17b'00000000000000000;
wire [16:0] next_pixel_count = 17b'00000000000000000;
wire [16:0] sdram_count = 17b'00000000000000000;
wire [16:0] next_sdram_count = 17b'00000000000000000;
assign M9_write = {{write_r},{write_g},{write_b}};
RAM m9write (.q(M9_rdata), .data(M9_wdata), .write_address(write_address), .read_address(read_address), .we(M9_write), .clk(clk));
assign read_r = M9_rdata[7:0];
assign read_g = M9_rdata[15:8];
assign read_b = M9_rdata[24:16];
assign backward_m9 = M9_rdata[23:0]; //Is this how you get the data backwards?
assign SD_wdata = {{nothing},{backward_m9}};
int firsttime = 0;

always_ff @ (negedge n_rst, posedge clk)
begin
	if(n_rst == 1'b0)
	begin
		state <= M9BLEND;
	end
	else
	begin
		state <= nxt_state;
		read_address <= next_read_address;
		write_address <= next_write_address;
		pixel_count = next_pixel_count;
		if(	
	end
end 


	

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

	end
	M9SDRAM:
	begin
		nxt_state = M9SDRAM
	end
	endcase
end


always_comb
begin
	next_write_address = write_address;
	next_pixel_count = pixel_count;
	next_SD_address = SD_address;
	next_read_address = read_address;
	case(state)
	M9BLEND:
	begin
		if (write == 1'b1)
		begin
			M9_write = 1'b1;
			next_write_address = Pixel_Number;
			next_pixel_count = pixel_count + 1;
		end
		else if (read == 1'b1)
		begin
			M9_write = 1'b0;
			next_read_address = Pixel_Number;
		end
	M9SDRAM:
	begin
		if(waitrequest == 1'b1)
		begin
			if(firsttime == 0)
			begin
				M9_write = 1'b0;
				SD_write = 1'b1;
				read_address = 17'b00000000000000000;
				firsttime == 1;
				next_read_address = read_address + 1;
				next_SD_address = SD_address +4;

			end
			else
			begin
				SD_write = 1'b1;
				next_read_address = read_address + 1;
				next_SD_address = SD_address +4;
			end
		end
		else if(waitrequest == 1'b0)
		begin
			if(firsttime == 0)
			begin
				M9_write = 1'b0;
				SD_write = 1'b0
				read_address = 17'b00000000000000000;
				firsttime == 1;
				next_read_address = read_address + 1;

			end

			SD_write = 1'b0;
		end
		
		
		
		








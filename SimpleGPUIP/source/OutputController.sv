// $Id: $
// File name:   OutputController.sv
// Created:     4/19/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Output Controller

module OutputController
(
	input wire reset,
	input wire clk,
	//From the Alpha Blender
	input wire [7:0] write_r,
	input wire [7:0] write_g,
	input wire [7:0] write_b,
	input wire  M9_write,
	input wire read,
	input wire frame_ready,

	//From the Texture Controller
	input wire [16:0] Pixel_Number,

	



	//output back to Alpha Blender
	output wire [7:0] read_r,
	output wire [7:0] read_g,
	output wire [7:0] read_b,
	//output to the M9. First data written, then control signals
	//output to SD_RAM
	output reg  SD_write,
	output reg [31:0] SD_wdata,
	output reg [25:0] SD_address,
	input wire waitrequest, //wait for this in order to increment the address 
	output reg finished
);

typedef enum bit [2:0] {M9BLEND,M9SDRAM,END} stateType;
stateType state;
stateType nxt_state;
reg [16:0] read_address;
reg [16:0] write_address;
reg complete;
wire [23:0] M9_wdata;
reg next_complete;
reg  nope;
reg next_nope;
reg [23:0] M9_rdata;
reg next_finished;
reg [25:0] next_SD_address;
reg [16:0] next_write_address;
reg [16:0] next_read_address;
wire [16:0] backward_m9;
wire [7:0] nothing; //set in ff to 0
reg [16:0] pixel_count;
reg [16:0] next_pixel_count;
reg [18:0] sdram_count;
reg [18:0] next_sdram_count;
wire [31:0] all_black_everything;
assign M9_wdata = {{write_r},{write_g},{write_b}};
OutputControllerRAM m9write (.q(M9_rdata), .data(M9_wdata), .write_address(write_address), .read_address(read_address), .we(M9_write), .clk(clk));
assign read_r = M9_rdata[7:0];
assign read_g = M9_rdata[15:8];
assign read_b = M9_rdata[23:16];
assign backward_m9 ={{M9_rdata[16:23]}, {M9_rdata[8:15]},{M9_rdata[0:7]}} ;
//assign SD_wdata = {{nothing},{backward_m9}};
reg firsttime;

always_ff @ (negedge reset, posedge clk)
begin
	if(reset == 1'b0)
	begin
		state <= M9BLEND;
		read_address <= 17'b0000000000000000;
		write_address <= 17'b0000000000000000;
		SD_address <= 26'b00000000000000000000000000;
		sdram_count <= 19'd0;
		firsttime <= 1'b0;
		SD_write <= 1'b0;
	end
	else
	begin
		state <= nxt_state;
		if(state == M9BLEND)
		begin
			read_address <= next_read_address;
		end
		else if (state == M9SDRAM)
		begin
			if(firsttime == 1'b0)
			begin
				read_address <= 17'b00000000000000000;
				firsttime <= 1'b1;
			end
			else
			begin
				read_address <= next_read_address;
			end
		end
		write_address <= next_write_address;
		pixel_count <= next_pixel_count;
		sdram_count <= next_sdram_count;
		SD_address <= next_SD_address;
		complete <= next_complete;
		finished <= next_finished;
		nope <= next_nope;
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
			nxt_state = M9SDRAM;
		end

	end
	M9SDRAM:
	begin
		if(sdram_count == 19'b1001011000000000000)
		begin
			nxt_state = END;
		end
	end	
	endcase
end


always_comb
begin
	next_write_address = write_address;
	next_pixel_count = pixel_count;
	next_SD_address = SD_address;
	next_read_address = read_address;
	next_complete = complete;
	next_finished = finished;
	next_nope = nope;
	case(state)
	M9BLEND:
	begin
		if (M9_write == 1'b1)
		begin
			next_write_address = Pixel_Number;
			next_pixel_count = pixel_count + 1;
		end
		else if (read == 1'b1)
		begin
			next_read_address = Pixel_Number;
		end
	end
	M9SDRAM:
	begin
		if(waitrequest == 1'b1)
		begin
			if(firsttime == 1'b0)
			begin
				SD_write = 1'b1;
				next_SD_address = SD_address +4;

			end
			else
			begin
				SD_write = 1'b1;
				next_read_address = read_address + 1;
				next_SD_address = SD_address +4;
				if(sdram_count < 19'b0011001000000000000)
				begin
					next_sdram_count = sdram_count + 1;
					SD_wdata = {{nothing},{backward_m9}};
				end
				else if (sdram_count < 19'b1001011000000000000)
					SD_wdata = all_black_everything;
					next_sdram_count = sdram_count + 1; 
			end
		end
		else if(waitrequest == 1'b0)
		begin
			if(firsttime == 0)
			begin
				SD_write = 1'b0;

			end

			SD_write = 1'b0;
		end
	end
	END:
	begin
		if(complete == 1'b0 && nope == 1'b0)
		begin
			next_finished = 1'b1;
			next_complete = 1'b1;
			next_nope = 1'b1;
		end
		else if(complete == 1'b1)
		begin
			next_finished = 1'b0;
			next_complete = 1'b0;
		end
	end	

	endcase
end


		
		
		






endmodule

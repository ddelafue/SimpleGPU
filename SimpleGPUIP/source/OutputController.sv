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
	output reg [27:0] SD_address,
	input wire waitrequest, //wait for this in order to increment the address 
	output reg finished
);

typedef enum bit [3:0] {M9BLEND,M9PREP,WAIT,M9DATA,M9PREP2,WAIT2,M9DATA2,WAIT3,FINISHED} stateType;
stateType state;
stateType nxt_state;
reg [16:0] read_address;
reg complete;
wire [23:0] M9_wdata;
reg next_complete;
reg  nope;
reg next_nope;
reg [23:0] M9_rdata;
reg next_finished;
reg [27:0] next_SD_address;
reg [16:0] next_read_address;
reg [31:0] next_SD_wdata;
reg next_SD_write;
wire [23:0] backward_m9;
reg [16:0] pixel_count;
reg [18:0] sdram_count;
reg [18:0] next_sdram_count;

reg [16:0] M9_address;

assign M9_wdata = {{write_r},{write_g},{write_b}};
OutputControllerRAM m9write (.q(M9_rdata), .data(M9_wdata), .write_address(Pixel_Number), .read_address(M9_address), .we(M9_write), .clk(clk));
assign read_r = M9_rdata[23:16];
assign read_g = M9_rdata[15:8];
assign read_b = M9_rdata[7:0];
assign backward_m9 ={{M9_rdata[7:0]}, {M9_rdata[15:8]},{M9_rdata[23:16]}};
//assign SD_wdata = {{8'd0},{backward_m9}};

always_ff @ (negedge reset, posedge clk)
begin
	if(reset == 1'b0)
	begin
		state <= M9BLEND;
		read_address <= 17'b0000000000000000;
		SD_address <= 28'b1000000000000000000000000000;
		sdram_count <= 19'd0;
		SD_write <= 1'b0;
		SD_wdata <= 32'd0;
	end
	else
	begin
		state <= nxt_state;
		read_address <= next_read_address;
		sdram_count <= next_sdram_count;
		SD_address <= next_SD_address;
		finished <= next_finished;
		nope <= next_nope;
		SD_wdata <= next_SD_wdata;
		SD_write <= next_SD_write;
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
			nxt_state = M9PREP;
		end
	end
	M9PREP:
	begin
		nxt_state = WAIT;
	end
	WAIT:
	begin
		nxt_state = M9DATA;
	end
	M9DATA:
	begin
		nxt_state = M9PREP2;
	end
	M9PREP2:
	begin
		if(sdram_count == 19'd307199)
		begin
			nxt_state = WAIT3;
		end
		else
		begin
			nxt_state = WAIT2;
		end
	end
	WAIT2:
	begin
		nxt_state = M9DATA2;
	end
	M9DATA2:
	begin
		if(waitrequest == 1'b0)
		begin
			nxt_state = M9PREP2;
		end
	end
	WAIT3:
	begin
		if(waitrequest == 1'b0)
		begin
			nxt_state = FINISHED;
		end
	end
	FINISHED:
	begin
		nxt_state = M9BLEND;
	end	
	endcase
end


always_comb
begin
	next_SD_address = SD_address;
	next_read_address = read_address;
	next_complete = complete;
	next_finished = 1'b0;
	next_nope = nope;
	next_SD_write = SD_write;
	next_sdram_count = sdram_count;
	next_SD_wdata = SD_wdata;
	M9_address = read_address;
	case(state)
	M9BLEND:
	begin
		M9_address = Pixel_Number;
	end
	M9PREP:
	begin
		next_SD_address = 28'h8000000; // WTF?!?! THIS MORE THAN 26 BITS
		next_sdram_count = '0;
		next_read_address = '0;
	end
	M9DATA:
	begin
		next_SD_wdata = {{backward_m9},{8'd0}};
		next_SD_write = 1'b1;
	end
	M9PREP2:
	begin
		next_read_address = read_address + 1;
		next_sdram_count = sdram_count + 1;
	end
	WAIT2:
	begin
		if(waitrequest == 1'b0)
		begin
			next_SD_write = 1'b0;
		end
	end
	M9DATA2:
	begin
		if(waitrequest == 1'b0)
		begin
			next_SD_address = SD_address + 4;
			next_SD_write = 1'b1;
			if(sdram_count < 19'b0011001000000000000)
			begin
				next_SD_wdata = {{backward_m9},{8'd0}};
			end
			else if (sdram_count < 19'b1001011000000000000)
			begin
				next_SD_wdata = 32'd0;
			end
		end
	end
	WAIT3:
	begin
		next_SD_write = 1'b0;
		M9_address = Pixel_Number;
	end
	FINISHED:
	begin
		next_finished = 1'b1;
		M9_address = Pixel_Number;
	end
	endcase
end


		
		
		






endmodule

// $Id: $
// File name:   TextureController.sv
// Created:     4/21/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: this is the texture controller dot s v. its neat
//
//
module TextureController
#(
	parameter TEX_1_START = 17'd0;
	parameter TEX_2_START = 17'd50;
	parameter TEX_3_START = 17'd80;
	parameter TEX_4_START = 17'd120;
	parameter TEX_5_START = 17'd170;
	parameter TEX_6_START = 17'd220;
	parameter TEX_7_START = 17'd260;
	parameter TEX_8_START = 17'd300;
	parameter TEX_9_START = 17'd400;
	parameter TEX_10_START = 17'd440;
	parameter TEX_11_START = 17'd490;
	parameter TEX_12_START = 17'd510;
	parameter TEX_13_START = 17'd580;
	parameter TEX_14_START = 17'd630;
	parameter TEX_15_START = 17'd670;
	parameter TEX_16_START = 17'd700;
	parameter TEX_17_START = 17'd730;
	parameter TEX_18_START = 17'd790;
	parameter TEX_19_START = 17'd820;
	parameter TEX_20_START = 17'd870;
	parameter TEX_21_START = 17'd900;
	parameter TEX_22_START = 17'd950;
	parameter TEX_23_START = 17'd1000;
	parameter TEX_24_START = 17'd1050;
	parameter TEX_25_START = 17'd1110;
	parameter TEX_26_START = 17'd1180;
	parameter TEX_27_START = 17'd1230;
	parameter TEX_28_START = 17'd1290;
	parameter TEX_29_START = 17'd1350;
	parameter TEX_30_START = 17'd1400;
	parameter TEX_31_START = 17'd1470;
	parameter TEX_32_START = 17'd1520;
	parameter TEX_33_START = 17'd1580;
	parameter TEX_34_START = 17'd1620;
	parameter TEX_35_START = 17'd1680;
	parameter TEX_36_START = 17'd1730;
	parameter TEX_37_START = 17'd1800;
	parameter TEX_38_START = 17'd1830;
	parameter TEX_39_START = 17'd1890;
	parameter TEX_40_START = 17'd1940;
	parameter TEX_41_START = 17'd2000;
	parameter TEX_42_START = 17'd2040;
	parameter TEX_43_START = 17'd2140;
	parameter TEX_44_START = 17'd2180;
	parameter TEX_45_START = 17'd2230;
	parameter TEX_46_START = 17'd2290;
	parameter TEX_47_START = 17'd2330;
	parameter TEX_48_START = 17'd2380;
	parameter TEX_49_START = 17'd2420;
	parameter TEX_50_START = 17'd2500;


)
(
	//from the Input Controller
	input wire [7:0] TexNum,
	input wire clk,
	input wire reset,
	//from the Rasteriser module 
	input wire [18:0] PixNum,
	input wire load_texture;
	input wire get_rgba;
	//output to the Alpha Blender
	output wire [7:0] red,
	output wire [7:0] green,
	output wire [7:0] blue,
	output wire [7:0] alpha,
	//Connected to the WAM
	
	// DEBUG ONLY!!
	input wire [16:0] write_address,
	input wire write,
	input wire [31:0] write_data
);


typedef enum bit [2:0] {IDLE,LOAD,PIXEL} stateType;
stateType state;
stateType nxt_state;
wire [31:0] read_data;
reg [31:0] nxt_read_data; //rgba it all
reg [16:0] nxt_read_address;
reg [16:0] read_address;
TextureControllerRAM U1 (.q(read_data), .read_address(read_address),.write_address(write_address), .clk(clk), .we(write)); // FIXME ADD WRITE SIGNALS!
assign red = read_data[7:0];
assign green = read_data[15:8];
assign blue = read_data[23:16];
assign alpha = read_data[31:23];

always_ff @ (posedge clk, negedge restart)
begin
	if(restart == 1'b0)
	begin
		read_address <= 17'd0;
	end
	else
	begin
		state <= nxt_state;
		read_address <= nxt_read_address;
	end
end

always_comb
begin : NEXT_STATE_LOGIC
	nxt_state = state;
	case(state)
	begin
	IDLE:
	begin
		if(load_texture == 1'b1)
		begin
			nxt_state = LOAD;
		end
		else if(get_rgba == 1'b1)
		begin
			nxt_state = PIXEL
		end
	end
	LOAD:
	begin
		nxt_state = IDLE;
	end
	PIXEL:
	begin
		nxt_state = IDLE;
	end
	endcase
end

always_comb
begin : OUTPUT_LOGIC
	nxt_read_address = read_address;
	case(state)
	begin
	LOAD:
	begin
		if(TexNum == 8'd1)
		begin
			nxt_read_address = TEX_1_START;
		end
		else if(TexNum == 8'd2)
		begin
			nxt_read_address = TEX_2_START;
		end
		else if(TexNum == 8'd3)
		begin
			nxt_read_address = TEX_3_START;
		end
		else if(TexNum == 8'd4)
		begin
			nxt_read_address = TEX_4_START;
		end
		else if(TexNum == 8'd5)
		begin
			nxt_read_address = TEX_5_START;
		end
		else if(TexNum == 8'd6)
		begin
			nxt_read_address = TEX_6_START;
		end
		else if(TexNum == 8'd7)
		begin
			nxt_read_address = TEX_7_START;
		end
		else if(TexNum == 8'd8)
		begin
			nxt_read_address = TEX_8_START;
		end
		else if(TexNum == 8'd9)
		begin
			nxt_read_address = TEX_9_START;
		end
		else if(TexNum == 8'd10)
		begin
			nxt_read_address = TEX_10_START;
		end
		else if(TexNum == 8'd11)
		begin
			nxt_read_address = TEX_11_START;
		end
		else if(TexNum == 8'd12)
		begin
			nxt_read_address = TEX_12_START;
		end
		else if(TexNum == 8'd13)
		begin
			nxt_read_address = TEX_13_START;
		end
		else if(TexNum == 8'd14)
		begin
			nxt_read_address = TEX_14_START;
		end
		else if(TexNum == 8'd15)
		begin
			nxt_read_address = TEX_15_START;
		end
		else if(TexNum == 8'd16)
		begin
			nxt_read_address = TEX_16_START;
		end
		else if(TexNum == 8'd17)
		begin
			nxt_read_address = TEX_17_START;
		end
		else if(TexNum == 8'd18)
		begin
			nxt_read_address = TEX_18_START;
		end
		else if(TexNum == 8'd19)
		begin
			nxt_read_address = TEX_19_START;
		end
		else if(TexNum == 8'd20)
		begin
			nxt_read_address = TEX_20_START;
		end
		else if(TexNum == 8'd21)
		begin
			nxt_read_address = TEX_21_START;
		end
		else if(TexNum == 8'd22)
		begin
			nxt_read_address = TEX_22_START;
		end
		else if(TexNum == 8'd23)
		begin
			nxt_read_address = TEX_23_START;
		end
		else if(TexNum == 8'd24)
		begin
			nxt_read_address = TEX_24_START;
		end
		else if(TexNum == 8'd25)
		begin
			nxt_read_address = TEX_25_START;
		end
		else if(TexNum == 8'd26)
		begin
			nxt_read_address = TEX_26_START;
		end
		else if(TexNum == 8'd27)
		begin
			nxt_read_address = TEX_27_START;
		end
		else if(TexNum == 8'd28)
		begin
			nxt_read_address = TEX_28_START;
		end
		else if(TexNum == 8'd29)
		begin
			nxt_read_address = TEX_29_START;
		end
		else if(TexNum == 8'd30)
		begin
			nxt_read_address = TEX_30_START;
		end
		else if(TexNum == 8'd31)
		begin
			nxt_read_address = TEX_31_START;
		end
		else if(TexNum == 8'd32)
		begin
			nxt_read_address = TEX_32_START;
		end
		else if(TexNum == 8'd33)
		begin
			nxt_read_address = TEX_33_START;
		end
		else if(TexNum == 8'd34)
		begin
			nxt_read_address = TEX_34_START;
		end
		else if(TexNum == 8'd35)
		begin
			nxt_read_address = TEX_35_START;
		end
		else if(TexNum == 8'd36)
		begin
			nxt_read_address = TEX_36_START;
		end
		else if(TexNum == 8'd37)
		begin
			nxt_read_address = TEX_37_START;
		end
		else if(TexNum == 8'd38)
		begin
			nxt_read_address = TEX_38_START;
		end
		else if(TexNum == 8'd39)
		begin
			nxt_read_address = TEX_39_START;
		end
		else if(TexNum == 8'd40)
		begin
			nxt_read_address = TEX_40_START;
		end
		else if(TexNum == 8'd41)
		begin
			nxt_read_address = TEX_41_START;
		end
		else if(TexNum == 8'd42)
		begin
			nxt_read_address = TEX_42_START;
		end
		else if(TexNum == 8'd43)
		begin
			nxt_read_address = TEX_43_START;
		end
		else if(TexNum == 8'd44)
		begin
			nxt_read_address = TEX_44_START;
		end
		else if(TexNum == 8'd45)
		begin
			nxt_read_address = TEX_45_START;
		end
		else if(TexNum == 8'd46)
		begin
			nxt_read_address = TEX_46_START;
		end
		else if(TexNum == 8'd47)
		begin
			nxt_read_address = TEX_47_START;
		end
		else if(TexNum == 8'd48)
		begin
			nxt_read_address = TEX_48_START;
		end
		else if(TexNum == 8'd49)
		begin
			nxt_read_address = TEX_49_START;
		end
		else if(TexNum == 8'd50)
		begin
			nxt_read_address = TEX_50_START;
		end
	end
	PIXEL:
	begin
		nxt_read_address = read_address + 1;
	end
	endcase
end

endmodule

			
		




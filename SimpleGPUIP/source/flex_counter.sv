// $Id: $
// File name:   flex_counter.sv
// Created:     2/1/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: lmao
module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [(NUM_CNT_BITS-1):0] rollover_val,
	output reg [(NUM_CNT_BITS-1):0] count_out,
	output reg rollover_flag
);

int i = 0;
int j = 0;
always_ff @ (posedge clk, negedge n_rst)
begin
		if (n_rst == 1'b0)
		begin
				i = 0;
				while (i <= NUM_CNT_BITS - 1)
				begin
						count_out[i] <= 1'b0;
						i = i + 1;
				end
				rollover_flag <= 1'b0;			
		end

		else if (clear == 1'b1)
		begin
				i = 0;
				while (i <= NUM_CNT_BITS - 1)
				begin
						count_out[i] <= 1'b0;
						i = i + 1;
				end
				rollover_flag <= 1'b0;
		end
		
		else if(count_enable == 1)
		begin
				if(rollover_flag == 1)
				begin
						j = 0;
						while ( j <= NUM_CNT_BITS - 1)
						begin
								if(j == 0)
								begin
										count_out[j] <= 1'b1;
								end
								else
								begin
									count_out[j] <= 1'b0;
								end
								j = j + 1;
						end
						rollover_flag <= 0;

				end
				else if (count_out[(NUM_CNT_BITS - 1):0] == rollover_val[(NUM_CNT_BITS - 1): 0] - 1 )
				begin
								rollover_flag <= 1;
								count_out <= count_out + 1;
				end
				else 
				begin
						count_out <= count_out + 1;
						rollover_flag <= rollover_flag;
				end
		end
end
endmodule

								

				

	




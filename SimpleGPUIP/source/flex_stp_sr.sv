// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/31/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: first part of postlab
`timescale 1ns / 10ps
module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input serial_in,
	output reg [(NUM_BITS - 1):0] parallel_out
);	

int i = (NUM_BITS-1);
int j = 0;
int k = 0;
always_ff @ (posedge clk, negedge n_rst)
begin
if (1'b0 == n_rst)
	begin
		k = 0;
		while(k <= (NUM_BITS - 1) )
		begin
			parallel_out[k] <= 1'b1;
			k = k +1;
		end
	end
else
	begin
		if (SHIFT_MSB == 1)
		begin
			if(shift_enable == 1)
			begin
				i = NUM_BITS - 1;
			 	while (i >=  0)
			 	begin
					if (i == 0)
					begin
			 			parallel_out[i] <= serial_in;
					end
					else
					begin
						parallel_out[i] <= parallel_out[i-1];
					end
					i = i - 1;
			 	end
			end
		end
		else if (SHIFT_MSB == 0)
		begin
			if(shift_enable == 1)
                	begin
			 	j = 0;
                         	while (j <= (NUM_BITS -1))
                         	begin
                                	if (j == (NUM_BITS - 1))
                                	begin
                                        	parallel_out[j] <= serial_in;
                                	end
                                	else
                                	begin
                                        	parallel_out[j] <= parallel_out[j+1];
                                	end
                                	j = j + 1;	
			 	end
			end
		end
	end
end

endmodule
					
		
		


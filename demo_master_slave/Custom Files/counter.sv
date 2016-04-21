module counter(
	input wire clk,				
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	output wire [3:0]sectnum
	);

reg[3:0] sectnum_current;
reg[3:0] sectnum_next;


always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 1'b0)
			begin
				sectnum_current <= 0; 
			end
		else
			begin
				sectnum_current <= sectnum_next;
			end
	end

always_comb
	begin
		if (clear) sectnum_next = 0;
		else if(count_enable)
			begin
				sectnum_next = sectnum_current + 1'b1;
			end
		else
			begin
				sectnum_next = sectnum_current;
			end
	end

assign sectnum = sectnum_current;

endmodule
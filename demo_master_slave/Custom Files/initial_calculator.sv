module initial_calculator
(
	input wire clk,
	input wire n_rst,
	input wire [17:0] corner_b,
	input wire [8:0] res,
	input wire [3:0] sectnum,
	output wire [539:0] load_val
);

wire [17:0] offset;
//reg [17:0]temp;
genvar i;

assign offset = 5'd30 * sectnum;

generate
	for (i=0; i<30; i=i+1) begin: MYGEN2
		assign load_val[18*(i+1)-1 -: 18] = corner_b - res * (i + offset);
	end
endgenerate
endmodule 
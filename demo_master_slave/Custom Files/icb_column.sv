module icb_column
(
	input wire clk,
	input wire n_rst,
	input wire start,
	input wire load,
	output reg [9:0] bitNum,
	output wire last
);

reg [9:0] nbitNum;

always_comb
begin : NextCount
	nbitNum=bitNum;
	if (start) 		nbitNum = 0;
	else if (load) begin
		if (!last)	nbitNum = bitNum + 1;
	end
end

always_ff @ (posedge clk, negedge n_rst)
begin : Counter
	if (!n_rst) 	bitNum <= 0;
	else 		bitNum <= nbitNum;
end

assign last = (bitNum==640);

endmodule

module icb_multiplier
(
	input wire [17:0] tza,
	input wire [17:0] tzb,
	output wire [17:0] resa,
	output wire [17:0] resb,
	output wire [17:0] resc
);

wire [35:0] resulta, resultb, resultc;

assign resulta = tza * tza;
assign resultb = tzb * tzb;
assign resultc = tza * tzb;
assign resa = resulta[33:16];
assign resb = resultb[33:16];
assign resc = resultc[33:16];

endmodule

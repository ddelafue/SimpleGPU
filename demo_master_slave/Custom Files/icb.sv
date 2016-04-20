module icb
(
	input wire clk,
	input wire n_rst,
	input wire shake,
	input wire start,
	input wire [8:0] res,
	input wire [35:0] newval,
	input wire [9:0] maxiter,
	output wire [9:0] count,
	output wire [9:0] bitNum,
	output wire done,
	output wire ready
);

reg load, escape;
reg [17:0] resa,resb,resc;
reg [17:0] tza,tzb;

icb_calculator CALCULATOR
(
	.clk(clk),
	.n_rst(n_rst),
	.newval(newval),
	.res(res),
	.maxiter(maxiter),
	.load(load),
	.start(start),
	.resa(resa),
	.resb(resb),
	.resc(resc),
	.tza(tza),
	.tzb(tzb),
	.escape(escape),
	.count(count)
);

icb_column COLUMN
(
	.clk(clk),
	.n_rst(n_rst),
	.start(start),
	.load(load),
	.bitNum(bitNum),
	.last(last)
);

icb_controller CONTROLLER
(
	.clk(clk),
	.n_rst(n_rst),
	.escape(escape),
	.shake(shake),
	.start(start),
	.last(last),
	.pix_ready(done),
	.load(load),
	.ready(ready)
);

icb_multiplier MULTIPLIER
(
	.tza(tza),
	.tzb(tzb),
	.resa(resa),
	.resb(resb),
	.resc(resc)
);

endmodule

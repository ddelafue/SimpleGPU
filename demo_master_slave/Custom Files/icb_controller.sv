module icb_controller
(
	input wire clk,
	input wire n_rst,
	input wire escape,
	input wire shake,
	input wire start,
	input wire last,
	output reg pix_ready,
	output reg load,
	output reg ready
);

typedef enum logic [2:0] {IDLE,LOAD,WAIT,READY,CHECK}state;
state curr, next;

always_comb
begin : NextState
	next=curr;
	case (curr)
		IDLE:	if (start)	next=LOAD;
		LOAD:			next=WAIT;
		WAIT:	if (escape)	next=READY;
		READY:	if (shake)	next=CHECK;
		CHECK:
		begin
			if (last)	next=IDLE;
			else		next=LOAD;
		end
	endcase
end

always_ff @ (posedge clk, negedge n_rst)
begin : State
	if (!n_rst) 	curr<=IDLE;
	else		curr<=next;
end

always_comb
begin : Output
	load=0;
	pix_ready=0;
	ready=0;
	if (curr==LOAD) 	load=1;
	else if (curr==READY) 	pix_ready=1;
	else if (curr==IDLE)	ready=1;
end

endmodule

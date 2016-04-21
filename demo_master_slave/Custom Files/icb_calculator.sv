module icb_calculator
(
	input wire clk,
	input wire n_rst,
	input wire [35:0] newval,
	input wire [8:0] res,
	input wire [9:0] maxiter,
	input wire load,
	input wire start,
	input wire [17:0] resa,
	input wire [17:0] resb,
	input wire [17:0] resc,
	output wire [17:0] tza,
	output wire [17:0] tzb,
	output reg escape,
	output reg [9:0] count
);

reg [17:0] ca, nca, cb, ncb;
reg [18:0] za, nza, zb, nzb;
reg [18:0] tempa, tempb;
reg [17:0] Zvala, Zvalb;
reg [17:0] nZvala, nZvalb;
reg [17:0] tempresc;
reg [9:0] ncount;

assign tza = za[17:0];
assign tzb = zb[17:0];

always_comb
begin : Znext
	//nza=za;
	//nzb=zb;
	tempa = (resa - resb) + ca;
	tempresc = resc<<1;
	tempb = '0;
	if (!load)
	begin
		if (!escape)
		begin
			//nza = resa - resb + ca;
			if (tempa[18]) nza = {1'b1,~tempa[17:0]};
			else nza = tempa;
			if (resc[17]) nzb = 19'b1111111111111111111;
			else if (za[18]^zb[18])
			begin
				tempb = cb - tempresc;
				if (tempb[18]) nzb = {1'b1,~tempb[17:0]};
				else nzb = tempb;
			end else begin
				tempb = '0;
				nzb = tempresc + cb;
			end
			//nzb = (resc<<1) + cb;
		end
		//Need an else here, MADE SHIT UP NOAH PLEASE FIX IT
		else
		begin
			//I am assuming we just hold these values after we have escaped...
			nza = za;
			nzb = zb;
			tempb = '0;
		end
	end else
	begin
		nza = {1'b0,Zvala};
		nzb = {1'b0,Zvalb};
		tempb = '0;
	end
end

always_comb
begin : Cnext
	if (!load)
	begin
		nca = ca;
		ncb = cb;
	end else
	begin
		nca = Zvala;
		ncb = Zvalb;
	end
end

always_comb
begin : NextCount
	ncount = count;
	escape=1'b0;
	if (load)					ncount = '0;
	else if (!za[17]&&!zb[17]&&(count!=maxiter))	ncount = count + 1'b1;
	else						escape=1'b1;
end

always_comb
begin : NextZval
	nZvala=Zvala;
	nZvalb=Zvalb;
	if (start)
	begin
		nZvala=newval[35:18];
		nZvalb=newval[17:0];
	end
	else if (load)
	begin
		nZvala=Zvala+res;
	end
end

always_ff @ (posedge clk, negedge n_rst)
begin : Values
	if (!n_rst)
	begin
		Zvala<='0;
		Zvalb<='0;
		ca<='0;
		cb<='0;
		za<='0;
		zb<='0;
		count<='0;
	end else
	begin
		Zvala<=nZvala;
		Zvalb<=nZvalb;
		ca<=nca;
		cb<=ncb;
		za<=nza;
		zb<=nzb;
		count<=ncount;
	end
end

endmodule
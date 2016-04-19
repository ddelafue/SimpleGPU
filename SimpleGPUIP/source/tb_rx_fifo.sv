// $Id: $
// File name:   tb_rx_fifo.sv
// Created:     2/22/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: jesus loves the little children
`timescale 1 ns / 100 ps
module tb_rx_fifo 
();
	reg clk = 1;
	reg n_rst;
	reg r_enable;
	reg w_enable;
	reg [7:0] w_data;
	reg [7:0] r_data;
	reg empty;
	reg full;
//	reg [7:0] data;
//	reg [7:0] data2;
	integer i = 0;
	integer j = 8;

//Clock
always
begin
	#5 clk = 0;
	#5 clk = 1; 
end

initial 
begin
	n_rst = 0;
	r_enable = 1;
	w_enable = 0;
	w_data = 8'b00000000;
	r_enable = 0;
	#10;
	n_rst = 1;
	w_data = 8'b11111111;
	w_enable = 1;
	#10;
	if(r_data != 8'b11111111)
	begin
		$error("fuck you");
	end
	#10;
	for(i = 0; i < j; i ++)
	begin
		w_enable = 1;
		w_data = 8'b11111111;
		#10;
		w_enable = 0;
		#10;
	end
	for(i = 0; i < j; i ++)
	begin
		w_enable = 1;
		w_data = 8'b00000000;
		#10;
		w_enable = 0;
		#10;
	end


end
			

rx_fifo A1 (.clk(clk),.n_rst(n_rst),.r_enable(r_enable),.w_enable(w_enable),.w_data(w_data),.r_data(r_data),.empty(empty),.full(full));


endmodule



	


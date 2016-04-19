/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Mar  1 00:52:01 2016
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   values;

  DFFSR values_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(values)
         );
  DFFSR sync_out_reg ( .D(values), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


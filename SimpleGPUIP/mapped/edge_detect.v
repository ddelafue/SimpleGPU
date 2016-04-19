/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Mar  1 00:50:44 2016
/////////////////////////////////////////////////////////////


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   new_input, old_input, \state[0] , n6;

  DFFSR \state_reg[0]  ( .D(1'b1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \state[0] ) );
  DFFSR new_input_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_input) );
  DFFSR old_input_reg ( .D(new_input), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_input) );
  AND2X1 U9 ( .A(\state[0] ), .B(n6), .Y(d_edge) );
  XOR2X1 U10 ( .A(old_input), .B(new_input), .Y(n6) );
endmodule


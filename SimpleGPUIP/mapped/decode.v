/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Mar  1 00:50:20 2016
/////////////////////////////////////////////////////////////


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   new_sample, old_sample, nxt_old_sample, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25;
  wire   [1:0] state;
  wire   [1:0] nxt_state;

  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR new_sample_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(nxt_old_sample), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(old_sample) );
  NOR2X1 U22 ( .A(state[1]), .B(n16), .Y(nxt_state[1]) );
  MUX2X1 U23 ( .B(n17), .A(state[0]), .S(state[1]), .Y(nxt_state[0]) );
  OR2X1 U24 ( .A(n18), .B(n19), .Y(nxt_old_sample) );
  OAI21X1 U25 ( .A(n17), .B(n20), .C(n21), .Y(n19) );
  MUX2X1 U26 ( .B(n22), .A(n23), .S(state[0]), .Y(n18) );
  NAND2X1 U27 ( .A(d_plus), .B(n17), .Y(n23) );
  NOR2X1 U28 ( .A(eop), .B(n16), .Y(n17) );
  INVX1 U29 ( .A(shift_enable), .Y(n16) );
  AND2X1 U30 ( .A(n20), .B(state[1]), .Y(n22) );
  INVX1 U31 ( .A(old_sample), .Y(n20) );
  OAI22X1 U32 ( .A(state[1]), .B(state[0]), .C(n24), .D(n25), .Y(d_orig) );
  XOR2X1 U33 ( .A(old_sample), .B(new_sample), .Y(n25) );
  INVX1 U34 ( .A(n21), .Y(n24) );
  NAND2X1 U35 ( .A(state[0]), .B(state[1]), .Y(n21) );
endmodule


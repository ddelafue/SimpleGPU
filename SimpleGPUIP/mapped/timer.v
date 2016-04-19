/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Mar  1 00:53:57 2016
/////////////////////////////////////////////////////////////


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n39, n40, n41, n42, n43, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n44;

  DFFSR rollover_flag_reg ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[0]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OAI22X1 U7 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n43) );
  NAND3X1 U9 ( .A(n5), .B(n6), .C(n12), .Y(n4) );
  MUX2X1 U10 ( .B(n13), .A(n14), .S(n15), .Y(n12) );
  NOR2X1 U11 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n14) );
  OAI21X1 U12 ( .A(n16), .B(n17), .C(n18), .Y(n13) );
  AND2X1 U13 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n16) );
  XOR2X1 U14 ( .A(n19), .B(count_out[3]), .Y(n5) );
  OAI21X1 U15 ( .A(rollover_val[2]), .B(n20), .C(rollover_val[3]), .Y(n19) );
  INVX1 U16 ( .A(n15), .Y(n20) );
  NAND3X1 U17 ( .A(n21), .B(n22), .C(n23), .Y(n3) );
  XOR2X1 U18 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n23) );
  NAND3X1 U19 ( .A(rollover_val[0]), .B(n17), .C(rollover_val[1]), .Y(n22) );
  OAI21X1 U20 ( .A(n18), .B(n17), .C(n15), .Y(n21) );
  NOR2X1 U21 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n15) );
  INVX1 U22 ( .A(count_out[1]), .Y(n17) );
  XOR2X1 U23 ( .A(n24), .B(rollover_val[2]), .Y(n18) );
  OAI21X1 U24 ( .A(n25), .B(n1), .C(n26), .Y(n42) );
  OAI21X1 U25 ( .A(rollover_flag), .B(n25), .C(n27), .Y(n26) );
  INVX1 U26 ( .A(count_out[0]), .Y(n25) );
  MUX2X1 U27 ( .B(n28), .A(n29), .S(count_out[1]), .Y(n41) );
  NAND2X1 U28 ( .A(n6), .B(count_out[0]), .Y(n28) );
  INVX1 U29 ( .A(n30), .Y(n40) );
  MUX2X1 U30 ( .B(n31), .A(n32), .S(count_out[2]), .Y(n30) );
  MUX2X1 U31 ( .B(n33), .A(n34), .S(count_out[3]), .Y(n39) );
  AOI21X1 U32 ( .A(n6), .B(n24), .C(n32), .Y(n34) );
  OAI21X1 U33 ( .A(count_out[1]), .B(n35), .C(n29), .Y(n32) );
  INVX1 U34 ( .A(n36), .Y(n29) );
  OAI21X1 U35 ( .A(count_out[0]), .B(n35), .C(n1), .Y(n36) );
  NAND2X1 U36 ( .A(n37), .B(n38), .Y(n1) );
  INVX1 U37 ( .A(count_out[2]), .Y(n24) );
  NAND2X1 U38 ( .A(n31), .B(count_out[2]), .Y(n33) );
  INVX1 U39 ( .A(n44), .Y(n31) );
  NAND3X1 U40 ( .A(count_out[0]), .B(count_out[1]), .C(n6), .Y(n44) );
  INVX1 U41 ( .A(n35), .Y(n6) );
  NAND2X1 U42 ( .A(n27), .B(n2), .Y(n35) );
  INVX1 U43 ( .A(rollover_flag), .Y(n2) );
  INVX1 U44 ( .A(n37), .Y(n27) );
  NAND2X1 U45 ( .A(count_enable), .B(n38), .Y(n37) );
  INVX1 U46 ( .A(clear), .Y(n38) );
endmodule


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n44, n45, n46, n47, n48, n49;

  DFFSR rollover_flag_reg ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[0]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n47), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OAI22X1 U7 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n45) );
  NAND3X1 U9 ( .A(n5), .B(n6), .C(n12), .Y(n4) );
  MUX2X1 U10 ( .B(n13), .A(n14), .S(n15), .Y(n12) );
  NOR2X1 U11 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n14) );
  OAI21X1 U12 ( .A(n16), .B(n17), .C(n18), .Y(n13) );
  AND2X1 U13 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n16) );
  XOR2X1 U14 ( .A(n19), .B(count_out[3]), .Y(n5) );
  OAI21X1 U15 ( .A(rollover_val[2]), .B(n20), .C(rollover_val[3]), .Y(n19) );
  INVX1 U16 ( .A(n15), .Y(n20) );
  NAND3X1 U17 ( .A(n21), .B(n22), .C(n23), .Y(n3) );
  XOR2X1 U18 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n23) );
  NAND3X1 U19 ( .A(rollover_val[0]), .B(n17), .C(rollover_val[1]), .Y(n22) );
  OAI21X1 U20 ( .A(n18), .B(n17), .C(n15), .Y(n21) );
  NOR2X1 U21 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n15) );
  INVX1 U22 ( .A(count_out[1]), .Y(n17) );
  XOR2X1 U23 ( .A(n24), .B(rollover_val[2]), .Y(n18) );
  OAI21X1 U24 ( .A(n25), .B(n1), .C(n26), .Y(n46) );
  OAI21X1 U25 ( .A(rollover_flag), .B(n25), .C(n27), .Y(n26) );
  INVX1 U26 ( .A(count_out[0]), .Y(n25) );
  MUX2X1 U27 ( .B(n28), .A(n29), .S(count_out[1]), .Y(n47) );
  NAND2X1 U28 ( .A(n6), .B(count_out[0]), .Y(n28) );
  INVX1 U29 ( .A(n30), .Y(n48) );
  MUX2X1 U30 ( .B(n31), .A(n32), .S(count_out[2]), .Y(n30) );
  MUX2X1 U31 ( .B(n33), .A(n34), .S(count_out[3]), .Y(n49) );
  AOI21X1 U32 ( .A(n6), .B(n24), .C(n32), .Y(n34) );
  OAI21X1 U33 ( .A(count_out[1]), .B(n35), .C(n29), .Y(n32) );
  INVX1 U34 ( .A(n36), .Y(n29) );
  OAI21X1 U35 ( .A(count_out[0]), .B(n35), .C(n1), .Y(n36) );
  NAND2X1 U36 ( .A(n37), .B(n38), .Y(n1) );
  INVX1 U37 ( .A(count_out[2]), .Y(n24) );
  NAND2X1 U38 ( .A(n31), .B(count_out[2]), .Y(n33) );
  INVX1 U39 ( .A(n44), .Y(n31) );
  NAND3X1 U40 ( .A(count_out[0]), .B(count_out[1]), .C(n6), .Y(n44) );
  INVX1 U41 ( .A(n35), .Y(n6) );
  NAND2X1 U42 ( .A(n27), .B(n2), .Y(n35) );
  INVX1 U43 ( .A(rollover_flag), .Y(n2) );
  INVX1 U44 ( .A(n37), .Y(n27) );
  NAND2X1 U45 ( .A(count_enable), .B(n38), .Y(n37) );
  INVX1 U46 ( .A(clear), .Y(n38) );
endmodule


module timer ( clk, n_rst, d_edge, rcving, shift_enable, byte_received );
  input clk, n_rst, d_edge, rcving;
  output shift_enable, byte_received;
  wire   fullbyte, _0_net_, n6, n7, n8, n9;
  wire   [3:0] igot;
  assign byte_received = fullbyte;

  flex_counter_1 a0 ( .clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(
        rcving), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0}), .count_out(igot) );
  flex_counter_0 a1 ( .clk(clk), .n_rst(n_rst), .clear(_0_net_), 
        .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0}), 
        .rollover_flag(fullbyte) );
  INVX1 U9 ( .A(n6), .Y(shift_enable) );
  NAND3X1 U10 ( .A(igot[1]), .B(n7), .C(n8), .Y(n6) );
  NOR2X1 U11 ( .A(igot[3]), .B(igot[2]), .Y(n8) );
  INVX1 U12 ( .A(igot[0]), .Y(n7) );
  NAND2X1 U13 ( .A(rcving), .B(n9), .Y(_0_net_) );
  INVX1 U14 ( .A(fullbyte), .Y(n9) );
endmodule


// $Id: $
// File name:   usb_receiver.sv
// Created:     2/29/2016
// Author:      Diego De La Fuente
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: everything

module usb_receiver
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire d_minus,
	input wire r_enable,
	output reg [7:0] r_data,
	output reg empty,
	output reg full,
	output reg rcving,
	output reg r_error
);
reg dhigh;
reg dlow;
reg dedge;
reg eoper;
reg senable;
reg brec;
reg dorg;
reg wena;
reg [7:0] rcvd;
sync_high sync (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(dhigh));
sync_low synl (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(dlow));
edge_detect ebrah (.clk(clk), .n_rst(n_rst), .d_plus(dhigh), .d_edge(dedge));
eop_detect eop (.d_plus(dhigh), .d_minus(dlow), .eop(eoper));

timer tmr (.clk(clk), .n_rst(n_rst), .d_edge(dedge), .rcving(rcving), .shift_enable(senable), .byte_received(brec));

shift_register sreg (.clk(clk), .n_rst(n_rst), .shift_enable(senable), .d_orig(dorg), .rcv_data(rcvd));

rcu rc (.clk(clk), .n_rst(n_rst), .d_edge(dedge), .eop(eoper), .shift_enable(senable), .rcv_data(rcvd), .byte_received(brec), .rcving(rcving), .w_enable(wena), .r_error(r_error));

decode dbro (.clk(clk), .n_rst(n_rst), .d_plus(dhigh), .shift_enable(senable), .eop(eoper), .d_orig(dorg));

rx_fifo no (.clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(wena), .w_data(rcvd), .r_data(r_data), .empty(empty), .full(full));

endmodule






module top(
input d_in,
input [15:0]data_in,
input clk,
input reset_n,
output [15:0] data_out
);
wire q_out;
fsm_10_mealy F1 (reset_n,d_in,clk,q_out);
pipo_16_bit P1 (clk,data_in,q_out,reset_n,data_out);
endmodule
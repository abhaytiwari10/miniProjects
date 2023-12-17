`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 11:40:18
// Design Name: 
// Module Name: fifo_16x8_bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_16x8_bit(
input [7:0] data_in,
input wr_en,
input wr_clk,
input rd_en,
input rd_clk,
input reset_in,
output reg [7:0] data_out,
output  fifo_full,
output fifo_empty );
reg [7:0] memory [0:16];
reg [3:0] wr_ptr = 'b0;
reg [3:0] rd_ptr = 'b0;
 assign fifo_empty = (wr_ptr == 4'b0000) && (rd_ptr == 4'b0000);
 assign fifo_full = (wr_ptr == 4'b1111) && (rd_ptr == 4'b0000);

always @(posedge wr_clk, negedge reset_in)
begin
if(!reset_in)
memory [wr_ptr] <= 'b0;
else if (wr_en && !fifo_full)
begin
memory[wr_ptr] <= data_in;
wr_ptr <= wr_ptr + 1;
end
end


always @(posedge rd_clk, negedge reset_in)
begin
if(!reset_in)
data_out <= 'bz;
else if (rd_en && !fifo_empty)
begin
data_out <= memory[rd_ptr];
rd_ptr <= rd_ptr + 1'b1;
end
end
 
endmodule

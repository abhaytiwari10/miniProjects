`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 11:42:43
// Design Name: 
// Module Name: pipo_16_bit
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


module pipo_16_bit(
 input clk,
     input [15:0] d_in,
     input En,
     input reset_n,
     output reg [15:0] q_out
    );
   
always @ (posedge clk, negedge reset_n)
begin
if(En)
begin
    if (!reset_n)
        begin
             q_out <= 'b0;
        end
    else
        begin
             q_out<=d_in;
        end 
end
else
q_out<=1'b0;     
end
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2023 05:11:08
// Design Name: 
// Module Name: RAM_16x8_SP
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


module RAM_16x8_SP(
input [3:0] ad_in,
input cs,
input w_en,
input op_en,
input clk,
input reset_n,
inout [7:0] data_io
    );
    reg [7:0] temp;
    reg [7:0] memory[0:16];
    always @ (posedge clk, negedge reset_n)
    begin
    if(!reset_n)
    memory[ad_in] <= 'b0;
    else if(cs & w_en)
    memory[ad_in] <= data_io;
    end
    always @ (posedge clk, negedge reset_n)
    begin
    if(!reset_n)
    temp = 'bz;
    else if( cs & !w_en)
    temp = memory[ad_in];
    end
    assign data_io = (cs & op_en & !w_en) ? temp : 'bz;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2023 07:32:19
// Design Name: 
// Module Name: RAM_16x16_DP
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


module RAM_16x16_DP(
input [3:0] ad_in0,
input cs0,
input w_en0,
input op_en0,
input [3:0] ad_in1,
input cs1,
input w_en1,
input op_en1,
input clk,
input reset_n,
inout [15:0] io_data0,
inout [15:0] io_data1
);
    reg [15:0] temp0;
    reg [15:0] temp1;
    reg [15:0] memory[0:16];
    always @ (posedge clk, negedge reset_n)
    begin
    if(!reset_n)
    memory[ad_in0] <= 'b0;
    else if(cs0 & w_en0)
    memory[ad_in0] <= io_data0;
    end
    always @ (posedge clk, negedge reset_n)
    begin
    if(!reset_n)
    temp0 = 'bz;
    else if( cs0 & !w_en0)
    temp0 = memory[ad_in0];
    end
     always @ (posedge clk, negedge reset_n)
    begin
    if(!reset_n)
    memory[ad_in0] <= 'b0;
    else if(cs1 & w_en1)
    memory[ad_in1] <= io_data1;
    end
    always @ (posedge clk, negedge reset_n)
    begin
    if(!reset_n)
    temp1 = 'bz;
    else if( cs1 & !w_en1)
    temp1 = memory[ad_in1];
    end
    assign io_data0 = (cs0 & op_en0 & !w_en0) ? temp0 : 'bz;
    assign io_data1 = (cs1 & op_en1 & !w_en1) ? temp0 : 'bz;
endmodule

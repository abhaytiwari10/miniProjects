`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2023 11:24:32
// Design Name: 
// Module Name: sequence_101_detector
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


module sequence_101_detector(
    input reset_n,
    input d_in,
    input clk,
    output reg y_out
    );
    parameter s0=2'b00;
    parameter s1=2'b01;
    parameter s2=2'b10;
    reg [1:0] present_state,next_state;

    
    always @ (posedge clk, negedge reset_n)
begin
    if(!reset_n)
       present_state <= s0;
            else
        present_state <= next_state; 
    end
            always @ (present_state,d_in)
    begin
                    case(present_state)
         s0:if(d_in)
                     next_state=s1;
            else
                    next_state=s0;
          s1:if(!d_in)
                    next_state=s2;
            else
                next_state=s1;
            s2:if(d_in)
                    next_state=s1;
                else
                    next_state=s0;
       
                    default:next_state=s0;
                    endcase
                        end
  always @ (present_state,d_in)
   begin
   case(present_state)
   s0:y_out=0;
   s1:y_out=0;
   s2:begin
   if(d_in == 1'b1)
   y_out=1'b1;
   else
   y_out=1'b0;
   end           
   default:y_out='b0;
   endcase
   end
    endmodule

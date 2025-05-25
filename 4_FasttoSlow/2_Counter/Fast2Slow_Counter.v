`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2025 15:11:10
// Design Name: 
// Module Name: Fast2Slow_Counter
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


module Fast2Slow_Counter(
     input wire clk1,
     input wire clk2,
     input wire reset,
     output reg [3:0] count_1,
     output reg [3:0] count_2
 );
     
     always@(posedge clk1 or posedge reset) begin
         if(reset) begin
             count_1 <= 4'd0;
         end else begin
             count_1 <= count_1;
         end
     end
     
     always@(posedge clk2 or posedge reset) begin
         if(reset) begin
             count_2 <= 4'd0;     
         end else begin
             count_2 <= count_1;
         end
     end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 23.05.2025 11:56:53
// Design Name: 
// Module Name: Fast2slow
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


module Fast2slow(
    input  wire clk1 ,
    input  wire clk2 ,
    input  wire in   ,
    input  wire reset,
    output reg  out
);
      reg in1;
      //100MHz 
      always@(posedge clk1 or posedge reset) begin
          if(reset) begin
              in1 <= 1'b0;
          end else begin
              in1 <= in;
          end
      end
      //50MHz
      always@(posedge clk2 or posedge reset)begin
          if(reset) begin
              out <= 1'b0;
          end else begin
              out <= in1;
          end
      end
endmodule
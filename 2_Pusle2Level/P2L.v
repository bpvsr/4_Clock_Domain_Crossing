`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 22.05.2025 16:59:12
// Design Name: 
// Module Name: P2L
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

module P2L(
    input  wire clk1 ,
    input  wire in   ,
    input  wire reset,
    output reg  out
);
  always@(posedge clk1 or posedge reset)begin
      if(reset) begin
          out <= 1'b0;
      end else begin
          out <= out ^ in;
      end
  end
endmodule
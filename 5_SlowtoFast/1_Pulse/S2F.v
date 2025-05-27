`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 27.05.2025 16:48:04
// Design Name: 
// Module Name: S2F
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


module S2F(
    input  wire clk1 ,
    input  wire clk2 ,
    input  wire in   , 
    input  wire reset,
    output reg  out
);
  
    reg in1;
    always@(posedge clk1 or posedge reset)begin
        if(reset) begin
            in1 <= 1'b0;
        end else begin
            in1 <= in;
        end
    end
  
    always@(posedge clk2 or posedge reset) begin
        if(reset) begin
            out <= 1'b0;
        end else begin
            out <= in1;
        end
    end 
endmodule
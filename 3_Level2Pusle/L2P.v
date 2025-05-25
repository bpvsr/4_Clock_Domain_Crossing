`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 22.05.2025 17:31:45
// Design Name: 
// Module Name: L2P
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


module L2P(
  	 input  wire clk  ,
     input  wire d    ,
     input  wire reset,
     output wire pulse
    );
    reg q;
    always@(posedge clk or posedge reset) begin
        if(reset)begin
            q <= 1'b0;
        end else begin
            q <= d;    
        end
    end

    assign pulse = q ^ d;
endmodule

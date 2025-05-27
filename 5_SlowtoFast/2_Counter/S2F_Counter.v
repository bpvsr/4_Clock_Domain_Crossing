`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 17:05:26
// Design Name: 
// Module Name: S2F_Counter
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


module S2F_Counter(
    input  wire clk1        ,
    input  wire clk2        ,
    input  wire reset       ,
    output reg [3:0] count_1,
    output reg [3:0] count_2
);

    always@(posedge clk1 or posedge reset) begin
        if(reset)begin
            count_1 <= 4'd0; 
        end else begin
            count_1 <= count_1 + 1'b1;
        end
    end
  
    always@(posedge clk2 or posedge reset) begin
        if(reset) begin
            count_2 <= 4'b0;
        end else begin
            count_2 <= count_1;
        end
    end
  
  
endmodule
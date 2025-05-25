`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 23.05.2025 15:18:45
// Design Name: 
// Module Name: tb_F2S_Counter
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


module tb_F2S_Counter();
     reg clk1;
     reg clk2;
     reg reset;
     wire [3:0] count_1;
     wire [3:0] count_2;
     
     Fast2Slow_Counter DUT(clk1,clk2,reset,count_1,count_2);
     
     initial begin
         clk1 = 1'b0;
         forever #5 clk1 = ~clk1;
     end

     initial begin
         clk2 = 1'b0;
         forever #10 clk2 = ~clk2;
     end 
     
     initial begin
         @(posedge clk1) reset <= 1'b1;
         @(posedge clk1) reset <= 1'b0;
         #300 $finish;
     end
     
endmodule

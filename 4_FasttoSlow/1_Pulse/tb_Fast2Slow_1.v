`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 23.05.2025 12:19:29
// Design Name: 
// Module Name: tb_Fast2Slow
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

module test_Fast2Slow();
      
      reg clk1;
      reg clk2;
      reg in;
      reg reset;
      wire out;
      
      Fast2slow DUT(clk1,clk2,in,reset,out);
      //1.5*100/50 ~~3 Clock cycle
      initial
        begin
          clk1 = 1'b0;
          forever #5 clk1 = ~clk1;  //100MHz
        end
      
      initial
        begin
          #8 clk2 = 1'b0;
          forever #10 clk2 = ~clk2;  //50MHz
        end  
      
      initial
        begin
          @(posedge clk1) reset <= 1'b1;
          @(posedge clk1) reset <= 1'b0;in<= 1'b0;
          @(posedge clk1) reset <= 1'b0;in<= 1'b0;
          @(posedge clk1) reset <= 1'b0;in<= 1'b1;
          @(posedge clk1) reset <= 1'b0;in<= 1'b0;
          @(posedge clk1) reset <= 1'b0;in<= 1'b0;
          @(posedge clk1) reset <= 1'b0;in<= 1'b0;
          @(posedge clk1) reset <= 1'b0;in<= 1'b0;
          #100 $finish;
        end
      
      initial
        begin
          $dumpfile("test.vcd");
          $dumpvars(2);
        end
      
endmodule

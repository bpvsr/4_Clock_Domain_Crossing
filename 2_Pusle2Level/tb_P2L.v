`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 22.05.2025 17:01:49
// Design Name: 
// Module Name: tb_P2L
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


module tb_P2L();
  
  reg clk1;
  reg in;
  reg reset;
  wire out;
  
  P2L DUT(
      clk1 ,
      in   ,
      reset,
      out  
  );
  
    initial begin
        clk1 = 1'b0;
        forever #5 clk1 = ~clk1;
    end
  
    initial begin
      @(posedge clk1) reset <= 1'b1;
      @(posedge clk1) reset <= 1'b0;in<= 1'b0;
      @(posedge clk1) reset <= 1'b0;in<= 1'b0;
      @(posedge clk1) reset <= 1'b0;in<= 1'b1;
      @(posedge clk1) reset <= 1'b0;in<= 1'b0;
      @(posedge clk1) reset <= 1'b0;in<= 1'b0;
      @(posedge clk1) reset <= 1'b0;in<= 1'b1;
      @(posedge clk1) reset <= 1'b0;in<= 1'b0;
      #100 $finish;
    end
  
  initial
    begin
      $dumpfile("test.vcd");
      $dumpvars(1);
    end
  
endmodule
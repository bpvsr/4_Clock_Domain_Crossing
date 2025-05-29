`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 16:54:43
// Design Name: 
// Module Name: tb_S2F
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


module tb_S2F();

    reg  clk1 ;
    reg  clk2 ;
    reg  in   ;
    reg  reset;
    wire out  ;
  
    S2F DUT(clk1,clk2,in,reset,out);
  
    initial begin
        clk1 = 1'b0;
        forever #10 clk1 = ~clk1;  //50MHz
    end
    // 1.5*10ns / 20ns =~ 1 Cycle
    initial begin
        clk2 = 1'b0;
        forever #5 clk2 = ~clk2;  //100MHz
    end  
  
    initial begin
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
  
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(2);
    end
  
endmodule

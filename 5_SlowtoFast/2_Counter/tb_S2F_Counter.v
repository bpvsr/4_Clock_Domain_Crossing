`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 17:09:30
// Design Name: 
// Module Name: tb_S2F_Counter
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


module tb_S2F_Counter();
  
    reg clk1 ;
    reg clk2 ;
    reg reset;
    wire [3:0] count_2,count_1;

    S2F_Counter DUT(clk1,clk2,reset,count_1,count_2);

    initial begin
        clk1 = 1'b0;
        forever #10 clk1 = ~clk1;  //50MHz
    end

    initial begin
        clk2 = 1'b0;
        forever #5 clk2 = ~clk2;  //100MHz
    end  

    initial begin
        @(posedge clk1) reset <= 1'b1;
        @(posedge clk1) reset <= 1'b0;
        #500 $finish;
     end

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(1);
    end

endmodule
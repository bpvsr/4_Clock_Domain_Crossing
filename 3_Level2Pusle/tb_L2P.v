`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 22.05.2025 17:34:06
// Design Name: 
// Module Name: tb_L2P
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


module tb_L2P();
 
    reg clk;
    reg d;
    reg reset;
    wire pulse;
 
 
    L2P DUT(clk,d,reset,pulse);
 
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
 
    initial begin
        @(posedge clk) reset <= 1'b1;      
        repeat(20)begin
            @(posedge clk) reset <= 1'b0; d <= 1'b1;
        end
        repeat(5) begin
            @(posedge clk) reset <= 1'b0;d <= 1'b0;
        end
        repeat(10) begin
            @(posedge clk) d <= 1'b0;      
        end
        $finish;
    end
 
    initial
     begin
       $dumpfile("test.vcd");
       $dumpvars(1);
     end
endmodule
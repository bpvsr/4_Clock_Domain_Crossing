`timescale 1ns / 1ps
module multi_clk_fanin(
    input clk1,
    input clk2,
    input clk3,
    input in1,
    input in2,
    output reg out
);
    reg in1_d;
    always@(posedge clk1) begin
        in1_d <= in1;    
    end
    reg in2_d,in_d1;
    always@(posedge clk2) begin
        in2_d <= in2;    
    end 
    assign in_d = in1_d & in2_d;
    always@(posedge clk3) begin
        in_d1 <= in_d;
        out   <= in_d1;
    end   
endmodule
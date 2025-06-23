`timescale 1ns / 1ps
module Comb_logic_sync(
    input clk1,
    input clk2,
    input in1,
    input in2,
    input din,
    output reg out
);
    reg q1;
    always@(posedge clk1) begin
        q1 <= din;
    end
    wire q2;
    assign q2 = q1 && in1 && in2;
    reg q3;
    always@(posedge clk2) begin
        q3 <= q2;
        out<= q3; 
    end 
endmodule
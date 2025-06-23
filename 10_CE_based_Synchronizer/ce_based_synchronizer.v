`timescale 1ns / 1ps
module ce_based_sync(
    input clk1,
    input clk2,
    input din,
    output reg out
);
    
    reg d1,d2;
    always@(posedge clk1) begin
        d1 <= din;
        d2 <= d1;
    end
    reg d3,d4,d5;
    always@(posedge clk2) begin
        d3 <= din;
        d4 <= d3;
        d5 <= d4; 
    end
    
    wire out1;
    assign out1 = ~(d4 ^ d5);
    always@(posedge clk2) begin
        if(out1)
            out <= d2;
    end
    
endmodule
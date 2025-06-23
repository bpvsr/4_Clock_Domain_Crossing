`timescale 1ns / 1ps
module tb();

        reg clk1;
        reg clk2;
        reg [1:0]d;
        wire [1:0]out;
        
        cdc1 DUT(clk1,clk2,d,out);
        
        initial
        begin
            clk1 = 1'b0;
            forever #5 clk1 = ~clk1;
        end
        
        initial
        begin
            clk2 = 1'b0;
            forever #10 clk2 = ~clk2;
        end
        
        initial
        begin
            @(posedge clk1) d <= 2'b01;
            @(posedge clk1) d <= 2'b01;
            @(posedge clk1) d <= 2'b01;
            @(posedge clk1) d <= 2'b00;
            @(posedge clk1) d <= 2'b00;
            @(posedge clk1) d <= 2'b00;
            @(posedge clk1) d <= 2'b00;
            @(posedge clk1) d <= 2'b10;
            @(posedge clk1) d <= 2'b10;
            @(posedge clk1) d <= 2'b10;
            @(posedge clk1) d <= 2'b00;
            @(posedge clk1) d <= 2'b00;
            @(posedge clk1) d <= 2'b00;
            $finish;
        end
endmodule
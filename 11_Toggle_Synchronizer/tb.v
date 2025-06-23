`timescale 1ns / 1ps
module toggle_sync_tb();
    reg clk1,clk2;
    reg reset;
    reg in;
    wire out;
    
    toggle_synchronizer DUT(
    clk1,
    clk2,
    in,
    reset,
    out);
    
    initial
    begin
        clk1 = 1'b0;
        forever #5 clk1 = ~clk1;
    end
    
    initial
    begin
        #2 clk2 = 1'b0;
        
        forever #10 clk2 = ~clk2;
    end
    
    initial
    begin
        @(posedge clk1) reset <= 1'b1;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b1;
        //@(posedge clk1) reset <= 1'b0;in <= 1'b1;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        #50 $finish;
    end
endmodule
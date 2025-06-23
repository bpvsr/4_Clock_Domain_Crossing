`timescale 1ns / 1ps
module tb_handshake();
        reg  clk1;
        reg  clk2;
        reg  reset;
        reg  in;
        wire  out;
        wire  busy;


    Hand_Shake_Pule_Synchronizer DUT(
    clk1,
    clk2,
    reset,
    in,
    out,
    busy);
    
    initial
    begin
        clk1 = 1'b0;
        forever #10 clk1 = ~clk1;    
    end
    
    initial
    begin
        clk2 = 1'b0;
        forever #5 clk2 = ~clk2;
    end
    
    initial
    begin
        @(posedge clk1) reset <= 1'b1;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        @(posedge clk1) reset <= 1'b0;in <= 1'b1;
        @(posedge clk1) reset <= 1'b0;in <= 1'b0;
        repeat(25) 
            @(posedge clk1) reset <= 1'b0;in <= busy ? in : 1'b0;
        $finish;
    end
endmodule

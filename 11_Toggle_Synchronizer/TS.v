`timescale 1ns / 1ps
module toggle_synchronizer(
    input clk1,
    input clk2,
    input in,
    input reset,
    output out
);
    reg q1;
    always@(posedge clk1 or posedge reset) begin
        if(reset)
            q1 <= 1'b0;
        else 
            q1 <= in ? ~q1 : q1;
    end
    reg q3,q4,q5;
    always@(posedge clk2) begin
        q3 <= q1;
        q4 <= q3;
        q5 <= q4;
    end
    assign out = q4 ^ q5;
endmodule
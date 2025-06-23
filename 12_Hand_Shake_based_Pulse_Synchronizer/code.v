`timescale 1ns / 1ps
module Hand_Shake_Pule_Synchronizer(
    input clk1,
    input clk2,
    input reset,
    input in,
    output out,
    output busy
);
    
    reg q1,q5,q6;
    reg q2,q3,q4;
    always@(posedge clk1 or posedge reset) begin
        if(reset) begin
            q1 <= 1'b0;
            q5 <= 1'b0;
            q6 <= 1'b0;    
        end else begin
            q1 <= (busy ? 1'b0 : (in ? 1'b1 : q1));
            q5 <= q3;
            q6 <= q5;            
        end
    end
/*    always@*
    begin
        if(reset)
            busy = 1'b0;
        else 
            busy = q1 | q6;
    end*/
    assign busy = q1 | q6;
    always@(posedge clk2) begin
        q2 <= q1;
        q3 <= q2;
        q4 <= q3;
    end 
    assign out = ~q4 & q3;
endmodule
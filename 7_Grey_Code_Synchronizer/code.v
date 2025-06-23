`timescale 1ns / 1ps
module cdc1(
    input wire clk1,
    input wire clk2,
    input wire [1:0]d,
    output wire [1:0]out
);
    reg [1:0]q;
    wire [1:0]g;
    assign g[1] = d[1];
    assign g[0] = d[0] ^ d[1];
    always@(posedge clk1) begin
            q <= g;
    end
    reg [1:0] out1,out2;
    always@(posedge clk2) begin
        out1 <= q;
        out2  <= out1;
    end
    assign out[1] = out2[1];
    assign out[0] = out2[1] ^ out2[0];
endmodule
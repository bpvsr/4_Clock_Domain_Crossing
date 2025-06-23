
`timescale 1ns / 1ps
module cdc_mux(
    input clk1,
    input clk2,
    input din,
    input sel,
    output reg out
);
    reg q1;
    reg sel_d1;
    always@(posedge clk1) begin
        q1    <= din;
        sel_d1<= sel;
    end
    
    reg sel_d2,sel_d3;
    wire d_in1;
    always@(posedge clk2) begin
        sel_d2 <= sel_d1;
        sel_d3 <= sel_d2;
        out    <= d_in1;
    end
    
       MUXF7 MUXF7_inst (
       .O(d_in1),   // Output of MUX to general routing
       .I1(q1),     // Input (tie to LUT6 O6 pin)
       .I0(out),    // Input (tie to LUT6 O6 pin)
       .S(sel_d3)   // Input select to MUX
    );
endmodule
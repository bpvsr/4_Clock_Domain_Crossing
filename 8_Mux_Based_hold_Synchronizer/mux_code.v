`timescale 1ns / 1ps
module cdc_mux(
    input clk1,
    input clk2,
    input [3:0] din,
    input sel,
    output reg [3:0] out
);
    reg [3:0] q1;
    reg sel_d1;
    always@(posedge clk1) begin
        q1    <= din;
        sel_d1<= sel;
    end
    
    reg sel_d2,sel_d3;
    wire [3:0] d_in1;
    always@(posedge clk2) begin
        sel_d2 <= sel_d1;
        sel_d3 <= sel_d2;
        out    <= d_in1;
    end
    
   MUXF7 MUXF7_inst0 (
       .O(d_in1[0]),   // Output of MUX to general routing
       .I0(out[0]),     // Input (tie to LUT6 O6 pin)
       .I1(q1[0]),    // Input (tie to LUT6 O6 pin)
       .S(sel_d3)   // Input select to MUX
    );
    
   MUXF7 MUXF7_inst1 (
    .O(d_in1[1]),   // Output of MUX to general routing
    .I0(out[1]),     // Input (tie to LUT6 O6 pin)
    .I1(q1[1]),    // Input (tie to LUT6 O6 pin)
    .S(sel_d3)   // Input select to MUX
 );
 
 MUXF7 MUXF7_inst2 (
  .O(d_in1[2]),   // Output of MUX to general routing
  .I0(out[2]),     // Input (tie to LUT6 O6 pin)
  .I1(q1[2]),    // Input (tie to LUT6 O6 pin)
  .S(sel_d3)   // Input select to MUX
);

   MUXF7 MUXF7_inst3 (
 .O(d_in1[3]),   // Output of MUX to general routing
 .I0(out[3]),     // Input (tie to LUT6 O6 pin)
 .I1(q1[3]),    // Input (tie to LUT6 O6 pin)
 .S(sel_d3)   // Input select to MUX
);
endmodule

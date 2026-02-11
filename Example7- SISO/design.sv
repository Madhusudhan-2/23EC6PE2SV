//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : siso
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : SISO used for basic functional coverage example.
//------------------------------------------------------------------------------

module siso(input clk, si, output so);
 logic [3:0] q;
 assign so = q[3];
 always_ff @(posedge clk) q<= {q[2:0], si};
endmodule

//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : dff
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : DFF used for basic functional coverage example.
//------------------------------------------------------------------------------

module dff(input clk, rst , d, output reg q);
 always_ff @(posedge clk or posedge rst)
  if(rst) q<= 0; else q<=d;
endmodule

//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : Counter
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : 4-bit Counter used for basic functional coverage example.
//------------------------------------------------------------------------------


module counter(input clk, rst , output logic [3:0] count);
 always_ff @(posedge clk)
  if(rst) count<= 0; else count<=count + 1;
endmodule

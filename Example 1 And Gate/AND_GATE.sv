//------------------------------------------------------------------------------
//File       : AND_GATE.sv
//Author     : Madhusudhan C/1BM23EC134
//Created    : 2026-01-29
//Module     : AND_GATE
//Project    : SystemVerilog and Verification (23EC6PE2SV),
//Faculty    : Prof. Ajaykumar Devarapalli
//Description: Basic AND Gate functional Coverage
//------------------------------------------------------------------------------
module and_gate(input logic a, b, output logic y);
  assign y = a & b;
endmodule 

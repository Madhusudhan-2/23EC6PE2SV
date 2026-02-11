//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : mux2to1 
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : MUX used for basic functional coverage example.
//------------------------------------------------------------------------------

module mux2to1(input logic [7:0] a, b, input logic sel , output logic [7:0] y);
 assign y= sel ? b : a;
endmodule

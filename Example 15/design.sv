//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : design_dummy
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Generator Driver used for basic functional coverage example.
//------------------------------------------------------------------------------


module simple_adder (
    input  logic clk,
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [8:0] sum
);

    always_ff @(posedge clk)
        sum <= a + b;

endmodule


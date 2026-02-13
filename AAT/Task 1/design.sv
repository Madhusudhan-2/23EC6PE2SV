//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : alu
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description :  alu used for basic functional coverage example.
//------------------------------------------------------------------------------

module alu (
    input  logic [3:0] a, b,
    input  logic [1:0] op,
    output logic [7:0] y
);
    always_comb begin
        case (op)
            2'b00: y = a + b;
            2'b01: y = a - b;
            2'b10: y = a * b;   // MUL
            2'b11: y = a / b;
        endcase
    end
endmodule

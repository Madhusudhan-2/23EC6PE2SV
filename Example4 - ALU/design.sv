//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : alu 
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : ALU used for basic functional coverage example.
//------------------------------------------------------------------------------

typedef enum logic [1:0] {
  ADD = 2'b00,
  SUB = 2'b01,
  AND = 2'b10,
  OR  = 2'b11
} opcode_e;

module alu (
  input  logic [7:0] a, b,
  input  opcode_e    op,
  output logic [7:0] y
);

  always_comb begin
    case (op)
      ADD: y = a + b;
      SUB: y = a - b;
      AND: y = a & b;
      OR : y = a | b;
      default: y = '0;
    endcase
  end 
endmodule

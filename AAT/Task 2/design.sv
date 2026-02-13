//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : clock59
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description :  digital clock used for basic functional coverage example.
//------------------------------------------------------------------------------

module clock59 (
    input  logic clk, rst,
    output logic [5:0] sec
);
    always_ff @(posedge clk or posedge rst)
        if (rst) sec <= 0;
        else if (sec == 59) sec <= 0;
        else sec <= sec + 1;
endmodule
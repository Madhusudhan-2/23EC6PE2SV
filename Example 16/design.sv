//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : handshake
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : SVA Temporal Sequence used for basic functional coverage example.
//------------------------------------------------------------------------------


module handshake (
    input  logic clk,
    input  logic req,
    output logic ack
);

    always_ff @(posedge clk)
        ack <= req;   // ack follows req next cycle

endmodule

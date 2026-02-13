//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : dual_port_ram
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Dual Port Ram used for basic functional coverage example.
//------------------------------------------------------------------------------

module dual_port_ram (
    input  logic clk,
    input  logic we,
    input  logic [7:0] addr_a,
    input  logic [7:0] addr_b,
    input  logic [7:0] din,
    output logic [7:0] dout
);

    logic [7:0] mem [0:255];

    always_ff @(posedge clk) begin
        if(we)
            mem[addr_a] <= din;

        dout <= mem[addr_b];
    end

endmodule
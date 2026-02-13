//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : fifo
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : FIFO used for basic functional coverage example.
//------------------------------------------------------------------------------

//======================================
// FIFO DESIGN
//======================================

module fifo (
    input  logic        clk,
    input  logic        rst,
    input  logic        wr,
    input  logic        rd,
    input  logic [7:0]  din,
    output logic [7:0]  dout,
    output logic        full,
    output logic        empty
);

    logic [7:0] mem [0:15];
    logic [4:0] wr_ptr, rd_ptr;
    logic [4:0] count;

    assign full  = (count == 16);
    assign empty = (count == 0);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count  <= 0;
        end
        else begin
            // WRITE
            if (wr && !full) begin
                mem[wr_ptr[3:0]] <= din;
                wr_ptr <= wr_ptr + 1;
                count  <= count + 1;
            end

            // READ
            if (rd && !empty) begin
                dout <= mem[rd_ptr[3:0]];
                rd_ptr <= rd_ptr + 1;
                count  <= count - 1;
            end
        end
    end

endmodule
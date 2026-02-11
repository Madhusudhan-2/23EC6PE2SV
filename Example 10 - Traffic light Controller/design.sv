//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : traffic
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description :  Traffic controller used for basic functional coverage example.
//------------------------------------------------------------------------------
//================= DESIGN =================
typedef enum logic [1:0] {RED, GREEN, YELLOW} light_t;

module traffic (
    input  logic   clk,
    input  logic   rst,
    output light_t color
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            color <= RED;
        else begin
            case (color)
                RED:    color <= GREEN;
                GREEN:  color <= YELLOW;
                YELLOW: color <= RED;
            endcase
        end
    end

endmodule

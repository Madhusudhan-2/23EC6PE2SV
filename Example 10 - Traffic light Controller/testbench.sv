//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description :  Traffic controller used for basic functional coverage example.
//------------------------------------------------------------------------------
//================= TESTBENCH =================
module tb;

    logic clk;
    logic rst;
    light_t color;

    // DUT
    traffic dut (
        .clk(clk),
        .rst(rst),
        .color(color)
    );

    // Clock generation (10 time units)
    always #5 clk = ~clk;

    // Coverage group with sequence bins
    covergroup cg_light @(posedge clk);
        cp_color : coverpoint color {
            bins cycle = (RED => GREEN => YELLOW => RED);
        }
    endgroup

    cg_light cg;

    initial begin
        clk = 0;
        rst = 1;

        cg = new();

        // Reset for 2 cycles
        #12 rst = 0;

        // Let the traffic light run
        repeat (10) @(posedge clk);

        $display("Simulation completed");
        $finish;
    end

    // Waveform dump
    initial begin
        $dumpfile("traffic.vcd");
        $dumpvars(0, tb);
    end

endmodule
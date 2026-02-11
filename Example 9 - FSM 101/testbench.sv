//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description :  FSM Sequence Detector (101) used for basic functional coverage example.
//------------------------------------------------------------------------------
//================= TESTBENCH =================
module tb;

    logic clk;
    logic rst;
    logic in;
    logic out;

    // DUT instantiation
    fsm_101 dut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Clock generation (10 time units)
    always #5 clk = ~clk;

    // Coverage group (white-box)
    covergroup cg_fsm @(posedge clk);
        cp_state : coverpoint dut.state;
    endgroup

    cg_fsm cg;

    // Stimulus
    initial begin
        clk = 0;
        rst = 1;
        in  = 0;

        cg = new();

        // Reset
        #12 rst = 0;

        // Input sequence: 1 0 1 0 1 1 0 1
        repeat (2) @(posedge clk);
        in = 1;
        @(posedge clk);
        in = 0;
        @(posedge clk);
        in = 1;
        @(posedge clk);
        in = 0;
        @(posedge clk);
        in = 1;
        @(posedge clk);
        in = 1;
        @(posedge clk);
        in = 0;
        @(posedge clk);
        in = 1;

        // Finish
        #20;
        $display("Simulation finished");
        $finish;
    end

    // Waveform dump
    initial begin
        $dumpfile("fsm_101.vcd");
        $dumpvars(0, tb);
    end

endmodule

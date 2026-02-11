//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description :  Arbiter used for basic functional coverage example.
//------------------------------------------------------------------------------
//================= TESTBENCH =================
module tb;

    logic clk;
    logic rst;
    logic [3:0] req;
    logic [3:0] gnt;

    // DUT
    arbiter dut (
        .clk(clk),
        .rst(rst),
        .req(req),
        .gnt(gnt)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Assertion: never allow multiple grants
    assert property (@(posedge clk) $onehot0(gnt))
        else $error("Protocol Violation: Multiple Grants!");

    initial begin
        clk = 0;
        rst = 1;
        req = 4'b0000;

        // Apply reset
        #12 rst = 0;

        // Single requests
        @(posedge clk) req = 4'b0001;
        @(posedge clk) req = 4'b0010;
        @(posedge clk) req = 4'b0100;
        @(posedge clk) req = 4'b1000;

        // Multiple requests (arbiter still gives only one grant)
        @(posedge clk) req = 4'b1011;
        @(posedge clk) req = 4'b0110;

        // No request
        @(posedge clk) req = 4'b0000;

        #20;
        $display("Simulation completed");
        $finish;
    end

    // Waveform dump
    initial begin
        $dumpfile("arbiter.vcd");
        $dumpvars(0, tb);
    end

endmodule
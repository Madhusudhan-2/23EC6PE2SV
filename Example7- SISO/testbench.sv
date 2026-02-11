//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple test bench to SISO used for basic functional coverage example.
//-----------------------------------------------------------------------
-------


// --- TESTBENCH ---
module tb;
  logic clk=0, si, so;
  siso dut (.*);
  always #5 clk = ~clk;
  logic [3:0] q_ref;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    repeat (20) begin
      si = $urandom();
      q_ref = {q_ref [2:0], si}; // Predict Expected
      @(posedge clk); #1;
    end
    $finish;
  end
endmodule

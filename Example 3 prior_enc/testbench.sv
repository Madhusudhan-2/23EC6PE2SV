//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple test bench for Priority Encoder used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

  logic [3:0] in;
  logic [1:0] out;
  logic       valid;

  // DUT instantiation
  priority_enc dut(.*);
   

  // Optional functional coverage
  covergroup cg_enc;
    cp_in : coverpoint in {
      bins b0 = {1};  // 0001
      bins b1 = {2};  // 0010
      bins b2 = {4};  // 0100
      bins b3 = {8};  // 1000
      bins others = default;
    }
  endgroup

  cg_enc cg = new();

  // Waveform dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

  // Stimulus + self-check
  initial begin
    repeat (50) begin
      in = $urandom_range(0, 15);
      #1;
      cg.sample();
      #4;
    end

    $display("Coverage = %0.2f %%", cg.get_inst_coverage());
  end

endmodule


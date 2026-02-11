//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple test bench to ALU used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

  logic [7:0] a, b, y;
  opcode_e   op;

  alu dut (.*);

  covergroup cg_alu;
    cp_op : coverpoint op;
  endgroup

  cg_alu cg = new();

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    repeat (50) begin
      a  = $urandom();
      b  = $urandom();
      op = opcode_e'($urandom_range(0,3)); // enum randomization
      #5;
      cg.sample();
    end
    $display( "Coverage: %0.2f %%" , cg.get_inst_coverage());
   
  end
endmodule

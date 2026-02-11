//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple test bench to DFF used for basic functional coverage example.
//------------------------------------------------------------------------------

class packet;
 rand bit d, rst;
 // Weight distribution: 0 gets 90 weight, 1 gets 10 weight
 constraint c1 { rst dist {0:=90, 1:=10}; }
endclass

module tb;
 logic clk=0, rst , d, q;
 dff dut(.*);
 always #5 clk= ~ clk;
 
  covergroup cg @(posedge clk); // Sample on Clock Edge
   cross_rst_d: cross rst , d;
  endgroup
  cg c_inst =new();
  packet pkt =new();

 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, tb);
  repeat(100) begin
   pkt.randomize();
   rst<=pkt.rst; d<=pkt.d;
   @(posedge clk);
  end
   $display ( "Coverage: %0.2f %%" , c_inst . get_inst_coverage ());
  $finish ;
 end
endmodule

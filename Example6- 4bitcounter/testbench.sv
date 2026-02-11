//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple test bench 4-bit Counter used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;
 logic clk=0, rst; logic [3:0] count;
 counter dut(.*);
 always #5 clk= ~clk;

covergroup cg_count @(posedge clk);
  cp_val : coverpoint count {
    bins zero = {0};
    bins max  = {15};
    bins roll = (15 => 0); // retyped ASCII arrow
  }
endgroup
cg_count cg = new();
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, tb);
  rst = 1;
  #20 rst = 0;
  repeat (40) @(posedge clk);
  $display("Coverage = %0.2f %%", cg.get_inst_coverage());
  $finish;
end
endmodule

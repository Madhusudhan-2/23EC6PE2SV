//------------------------------------------------------------------------------
//File       : AND_GATE.sv
//Author     : Madhusudhan C/1BM23EC134
//Created    : 2026-01-29
//Module     : AND_GATE
//Project    : SystemVerilog and Verification (23EC6PE2SV),
//Faculty    : Prof. Ajaykumar Devarapalli
//Description: Basic AND Gate functional Coverage
//------------------------------------------------------------------------------

module tb;
   logic a, b, y;
   and_gate dut(.*);
  
   covergroup cg_and;
      cp_a: coverpoint a;
      cp_b: coverpoint b;
      cross_ab: cross cp_a, cp_b;
   endgroup
  
   cg_and cg=new();
  
   initial begin
     $dumpfile("dump.vcd");
     $dumpvars(0, tb);
     
     repeat(20) begin
      a=$urandom(); // Randomize 0 or 1
      b=$urandom();
      #5; // Wait for gate delay
      cg.sample(); // Tell coverage tool to record values
    end
     $display("Final Coverage = %0.2f%%", cg.get_inst_coverage());
   end
endmodule

//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb 
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple test bench to MUX used for basic functional coverage example.
//------------------------------------------------------------------------------

class Transaction;
  rand bit [7:0] a, b;
  rand bit sel ;
endclass

module tb;
 logic [7:0] a, b, y;
 logic sel ;
  mux2to1 dut(.*);

 covergroup cg_mux;
  cp_sel : coverpoint sel ; // We must see Sel=0 and Sel=1
 endgroup
 cg_mux cg=new();
 Transaction tr =new();

 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, tb);
  repeat(20) begin
   tr.randomize(); // Generate random values
   a= tr.a; b= tr.b; sel = tr.sel ;
   #5; cg.sample();
  
   // Self-Check
    if(y !== (sel ? b : a)) $error("Mismatch!") ;
  end
   $display("Coverage=%0.2f %%", cg.get_inst_coverage());
 end
endmodule

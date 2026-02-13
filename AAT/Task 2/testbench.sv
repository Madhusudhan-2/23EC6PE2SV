//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : digital clock used for basic functional coverage example.
//------------------------------------------------------------------------------
module tb;
    logic clk=0, rst;
    logic [5:0] sec;

    clock59 dut(clk,rst,sec);
    always #5 clk = ~clk;

    initial begin
        rst = 1; #10 rst = 0;
        repeat(65) @(posedge clk)
            $display("Seconds = %0d", sec);
        $finish;
    end

  initial begin
        $dumpfile("vending.vcd");
        $dumpvars(0, tb);
  end
endmodule
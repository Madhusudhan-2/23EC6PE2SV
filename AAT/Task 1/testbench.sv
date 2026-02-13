//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description :  alu used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;
    logic [3:0] a, b;
    logic [1:0] op;
    logic [7:0] y;

    alu dut(a,b,op,y);

    initial begin
        repeat (10) begin
            a  = $urandom_range(1,9);
            b  = $urandom_range(1,9);
            op = $urandom_range(0,3);
            #1 $display("a=%0d b=%0d op=%0d y=%0d",a,b,op,y);
        end
        $finish;
    end
  initial begin
        $dumpfile("vending.vcd");
        $dumpvars(0, tb);
  end
endmodule

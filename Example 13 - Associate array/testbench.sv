//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Associate arrays used for functional coverage example.
//------------------------------------------------------------------------------

//================= TESTBENCH =================
module tb;

    // Associative array: key = address, value = data
    int mem[int];
    int addr;

    initial begin
        // Write random data to random addresses
        repeat (10) begin
            addr = $urandom_range(0, 100000);
            mem[addr] = $urandom();
        end

        // Read and display stored memory locations
        $display("---- Stored Memory Contents ----");
        foreach (mem[idx]) begin
            $display("Addr = %0d , Data = %0h", idx, mem[idx]);
        end
      
        
        $finish;
    end
  initial begin
    $dumpfile("dummy.vcd");
    $dumpvars(0, tb);
    end
endmodule
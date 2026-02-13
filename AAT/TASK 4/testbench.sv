//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Dual port Ram used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

    logic clk=0,we;
    logic [7:0] addr_a,addr_b,din,dout;

    dual_port_ram dut(clk,we,addr_a,addr_b,din,dout);

    byte ref_model [byte];

    always #5 clk=~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        repeat(10) begin
            @(posedge clk);
            we=1;
            addr_a=$urandom_range(0,255);
            din=$urandom_range(0,255);
            ref_model[addr_a]=din;
        end

        we=0;

        repeat(10) begin
            @(posedge clk);
            addr_b=$urandom_range(0,255);
            #1;
            if(ref_model.exists(addr_b) && dout==ref_model[addr_b])
                $display("PASS Addr=%0d Data=%0d",addr_b,dout);
            else
                $display("FAIL Addr=%0d Data=%0d",addr_b,dout);
        end

        $finish;
    end

endmodule
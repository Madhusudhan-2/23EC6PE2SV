//------------------------------------------------------------------------------
// File        : tesbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description :Generator Driver used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

    logic clk=0;
    always #5 clk = ~clk;

    logic [7:0] a,b;
    logic [8:0] sum;

    simple_adder dut(clk,a,b,sum);

    mailbox mb = new();

    // Transaction
    class transaction;
        rand bit [7:0] a,b;
    endclass

    // Generator
    class generator;
        mailbox mb;
        function new(mailbox mb);
            this.mb = mb;
        endfunction

        task run();
            transaction t;
            repeat(5) begin
                t = new();
                t.randomize();
                mb.put(t);
                $display("Generated a=%0d b=%0d", t.a, t.b);
            end
        endtask
    endclass

    // Driver
    class driver;
        mailbox mb;
        function new(mailbox mb);
            this.mb = mb;
        endfunction

        task run();
            transaction t;
            repeat(5) begin
                mb.get(t);
                @(posedge clk);
                a = t.a;
                b = t.b;
                $display("Driven a=%0d b=%0d sum=%0d", a,b,sum);
            end
        endtask
    endclass

    generator gen;
    driver drv;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb);

        gen = new(mb);
        drv = new(mb);

        fork
            gen.run();
            drv.run();
        join

        #20;
        $finish;
    end

endmodule

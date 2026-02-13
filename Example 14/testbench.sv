//------------------------------------------------------------------------------
// File        : tesbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : OOP Polymerism used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

    logic clk = 0;
    always #5 clk = ~clk;

    logic [7:0] result;

    // Base class
    class Operation;
        virtual function int compute(int a, int b);
            return 0;
        endfunction
    endclass

    // Derived class - ADD
    class Add extends Operation;
        function int compute(int a, int b);
            return a + b;
        endfunction
    endclass

    // Derived class - MUL
    class Mul extends Operation;
        function int compute(int a, int b);
            return a * b;
        endfunction
    endclass

    Operation op;   // base handle
    Add add_obj;
    Mul mul_obj;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb);

        // Create ADD object
        add_obj = new();
        op = add_obj;   // polymorphism
        @(posedge clk);
        result = op.compute(5,3);
        $display("ADD Result = %0d", result);

        // Create MUL object
        mul_obj = new();
        op = mul_obj;   // polymorphism
        @(posedge clk);
        result = op.compute(5,3);
        $display("MUL Result = %0d", result);

        #20;
        $finish;
    end
endmodule
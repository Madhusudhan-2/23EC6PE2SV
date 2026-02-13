//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : FIFO used for basic functional coverage example.
//------------------------------------------------------------------------------

//======================================
// INTERFACE
//======================================

interface fifo_if (input logic clk);
    logic rst;
    logic wr;
    logic rd;
    logic [7:0] din;
    logic [7:0] dout;
    logic full;
    logic empty;
endinterface


//======================================
// TESTBENCH
//======================================

module tb;

    logic clk = 0;
    always #5 clk = ~clk;

    // Instantiate Interface
    fifo_if vif(clk);

    // Connect DUT using interface signals
    fifo dut (
        .clk   (clk),
        .rst   (vif.rst),
        .wr    (vif.wr),
        .rd    (vif.rd),
        .din   (vif.din),
        .dout  (vif.dout),
        .full  (vif.full),
        .empty (vif.empty)
    );

    //==================================
    // Functional Coverage
    //==================================
    covergroup fifo_cg @(posedge clk);
        coverpoint vif.wr;
        coverpoint vif.rd;
        coverpoint vif.full;
        coverpoint vif.empty;

        cross vif.wr, vif.full;   // Write when full
        cross vif.rd, vif.empty;  // Read when empty
    endgroup

    fifo_cg cg = new();

    //==================================
    // Stimulus
    //==================================
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        vif.rst = 1;
        vif.wr  = 0;
        vif.rd  = 0;
        vif.din = 0;

        repeat(2) @(posedge clk);
        vif.rst = 0;

        // WRITE 18 times (overflow attempt)
        repeat(18) begin
            @(posedge clk);
            vif.wr  = 1;
            vif.din = $urandom_range(0,255);
        end

        @(posedge clk);
        vif.wr = 0;

        // READ 18 times (underflow attempt)
        repeat(18) begin
            @(posedge clk);
            vif.rd = 1;
        end

        @(posedge clk);
        vif.rd = 0;

        repeat(5) @(posedge clk);

        $display("Final Coverage = %0.2f %%", cg.get_inst_coverage());
        $finish;
    end

    // Monitor
    always @(posedge clk) begin
        $display("WR=%0b RD=%0b FULL=%0b EMPTY=%0b COUNT?",
                 vif.wr, vif.rd, vif.full, vif.empty);
    end

endmodule
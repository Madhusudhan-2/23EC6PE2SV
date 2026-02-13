//------------------------------------------------------------------------------
// File        : tesbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : SVA Temporal sequence used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

    logic clk=0;
    always #5 clk = ~clk;

    logic req;
    logic ack;

    handshake dut(clk,req,ack);

    // SVA Property
    property req_ack;
        @(posedge clk)
        req |-> ##1 ack;
    endproperty

    assert property(req_ack)
        else $error("ACK not received after REQ!");

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb);

        req=0;

        @(posedge clk);
        req=1;

        @(posedge clk);
        req=0;

        #20;
        $finish;
    end

endmodule

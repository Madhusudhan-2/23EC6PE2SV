//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : 8 Byte packet used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

    logic clk = 0;
    always #5 clk = ~clk;

    logic [7:0] len_sig;

    class EthPacket;

        rand byte payload[];
        rand int unsigned len;

        constraint length_c {
            len inside {[4:8]};
        }

        constraint size_c {
            payload.size() == len;
        }

    endclass

    EthPacket pkt;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        pkt = new();

        repeat(5) begin
            @(posedge clk);   // 🔥 TIME ADVANCES
            pkt.randomize();
            len_sig = pkt.len;   // move class value to signal
            $display("Len=%0d Payload=%p", pkt.len, pkt.payload);
        end

        #20;
        $finish;
    end

endmodule

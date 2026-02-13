//------------------------------------------------------------------------------
// File        : testbench.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : tb
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : ATM FSM used for basic functional coverage example.
//------------------------------------------------------------------------------

`timescale 1ns/1ps

module tb;

    reg clk;
    reg rst;
    reg card_inserted;
    reg pin_correct;
    reg balance_ok;
    wire dispense_cash;

    // Instantiate ATM
    atm_fsm uut (
        .clk(clk),
        .rst(rst),
        .card_inserted(card_inserted),
        .pin_correct(pin_correct),
        .balance_ok(balance_ok),
        .dispense_cash(dispense_cash)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Dump waves
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        clk = 0;
        rst = 1;
        card_inserted = 0;
        pin_correct = 0;
        balance_ok = 0;

        #10 rst = 0;                // Release reset

        #10 card_inserted = 1;      // Insert card
        #10 pin_correct = 1;        // Enter correct PIN
        #10 balance_ok = 1;         // Balance sufficient

        #20;

        // Reset everything
        card_inserted = 0;
        pin_correct = 0;
        balance_ok = 0;

        #20 $finish;
    end

endmodule

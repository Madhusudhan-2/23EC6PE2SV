//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Madhusudhan C / 1BM23EC134
// Created     : 2026-01-31
// Module      : atm
// Project     : System Verilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : ATM FSM used for basic functional coverage example.
//------------------------------------------------------------------------------

module atm_fsm(
    input clk,
    input rst,
    input card_inserted,
    input pin_correct,
    input balance_ok,
    output reg dispense_cash
);

    // State declaration
    typedef enum reg [2:0] {
        IDLE,
        CARD,
        PIN,
        CHECK_BAL,
        DISPENSE
    } state_t;

    state_t state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:
                if (card_inserted)
                    next_state = CARD;
                else
                    next_state = IDLE;

            CARD:
                next_state = PIN;

            PIN:
                if (pin_correct)
                    next_state = CHECK_BAL;
                else
                    next_state = PIN;

            CHECK_BAL:
                if (balance_ok)
                    next_state = DISPENSE;
                else
                    next_state = IDLE;

            DISPENSE:
                next_state = IDLE;

            default:
                next_state = IDLE;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        if (state == DISPENSE)
            dispense_cash = 1;
        else
            dispense_cash = 0;
    end

endmodule

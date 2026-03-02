
//======================================================
// Interface for Digital Clock
//======================================================

interface clock_if (input logic clk);

    logic rst;
    logic [5:0] seconds;
    logic [5:0] minutes;

    // Modport for DUT
    modport DUT (
        input clk,
        input rst,
        output seconds,
        output minutes
    );

    // Modport for TB
    modport TB (
        input seconds,
        input minutes,
        output rst
    );

endinterface



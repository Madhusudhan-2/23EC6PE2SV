
//======================================================
// Top Module
//======================================================

module top;

    logic clk;
    clock_if intf(clk);

    digital_clock u_clock (
        .clk(clk),
        .rst(intf.rst),
        .seconds(intf.seconds),
        .minutes(intf.minutes)
    );

endmodule 

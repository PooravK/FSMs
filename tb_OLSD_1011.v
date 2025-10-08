`timescale 1ns/1ps

module tb_OLSD_1011();
    reg clk;
    reg in;
    reg clear;
    wire out;

    OLSD_1011 uut (
        .clk(clk),
        .in(in),
        .clear(clear),
        .out(out)
    );

    initial clk = 1'b0;
    
    always #5 clk = ~clk;

    initial begin //Test input: 10110101011
        $dumpfile("waveform1011.vcd");
        $dumpvars(0, tb_OLSD_1011);

        clear = 1'b1; in = 1'b0; #10;

        clear = 1'b0; #10;

        in = 1'b1; #10;
        in = 1'b0; #10;
        in = 1'b1; #10;
        in = 1'b1; #10;

        in = 1'b0; #10;
        in = 1'b1; #10;

        in = 1'b0; #10;

        in = 1'b1; #10;
        in = 1'b0; #10;
        in = 1'b1; #10;
        in = 1'b1; #10;

        clear = 1'b1; #10;

        $finish;
    end
endmodule
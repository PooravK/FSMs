`timescale 1ns/1ps

module tb_moore_SD();
    reg clk;
    reg in;
    reg clear;
    wire out;

    moore_SD uut (
        .clk(clk),
        .in(in),
        .clear(clear),
        .out(out)
    );

    initial clk = 1'b0;
    
    always #5 clk = ~clk;

    initial begin //Test input: 1011001011
        $dumpfile("waveform1011.vcd");
        $dumpvars(0, tb_moore_SD);

        clear = 1'b1; in = 1'b0; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);

        clear = 1'b0; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);

        in = 1'b1; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);
        in = 1'b0; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);
        in = 1'b1; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);
        in = 1'b1; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);

        in = 1'b0; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);
        in = 1'b0; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);

        in = 1'b1; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);
        in = 1'b0; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);
        in = 1'b1; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);
        in = 1'b1; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);

        clear = 1'b1; #10;
        $display("CLEAR = %b || IN = %b || OUT = %b", clear, in, out);

        $finish;
    end
endmodule
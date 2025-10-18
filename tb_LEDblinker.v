`timescale 1ns/1ps

module tb_LEDblinker();
    reg clk;
    reg clear;
    wire led_out;

    LEDblinker uut (
        .clk(clk),
        .clear(clear),
        .led_out(led_out)
        );

        initial clk = 1'b0;

        always #5 clk = ~clk;

        initial begin
            $dumpfile("LEDwaveform.vcd");
            $dumpvars(0, tb_LEDblinker);

            clear = 1'b1;
            #20;

            clear = 1'b0;
            #40;
            //LED turns on

            #40; //LED turns off

            clear = 1'b1;
            #20; 
            $finish;
        end
endmodule
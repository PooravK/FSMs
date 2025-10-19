`timescale 1ns/1ps

module tb_TLcontroller();
    reg clk;
    reg clear;
    wire RED_NS;
    wire YELLOW_NS;
    wire GREEN_NS;
    wire RED_WE;
    wire YELLOW_WE;
    wire GREEN_WE;

    TLcontroller uut (
        .clk(clk),
        .clear(clear),
        .RED_NS(RED_NS),
        .YELLOW_NS(YELLOW_NS),
        .GREEN_NS(GREEN_NS),
        .RED_WE(RED_WE),
        .YELLOW_WE(YELLOW_WE),
        .GREEN_WE(GREEN_WE)
        );

        initial clk = 1'b0;

        always #5 clk = ~clk;

        initial begin
            $dumpfile("controller_waveform.vcd");
            $dumpvars(0, tb_TLcontroller);

            clear = 1'b1;
            #20;

            clear = 1'b0;
            #760;

            #760;

            clear = 1'b1;
            #20;

            $finish;
        end
endmodule;
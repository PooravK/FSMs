`timescale 1ns/1ps

module tb_tlc_oneway();
    reg clk;
    reg clear;
    wire RED_out;
    wire YELLOW_out;
    wire GREEN_out;

    tlc_oneway uut (
        .clk(clk),
        .clear(clear),
        .RED_out(RED_out),
        .YELLOW_out(YELLOW_out),
        .GREEN_out(GREEN_out)
        );

        initial clk = 1'b0;

        always #5 clk = ~clk;

        initial begin
            $dumpfile("oneway_waveform.vcd");
            $dumpvars(0, tb_tlc_oneway);

            clear = 1'b1;
            #20;

            clear = 1'b0;
            
            #200;

            clear = 1'b1;
            #20;

            $finish;
        end
endmodule;
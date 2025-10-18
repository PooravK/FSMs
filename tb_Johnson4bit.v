`timescale 1ns/1ps

module tb_Johnson4bit();
    reg clk;
    reg clear;
    reg en;
    reg count_mode;
    wire [3:0]q_out;

    Johnson4bit uut (
        .clk(clk),
        .clear(clear),
        .en(en),
        .count_mode(count_mode),
        .q_out(q_out)
        );

        initial clk = 1'b0;

        always #5 clk = ~clk;

        initial begin
            $dumpfile("counter_waveform.vcd");
            $dumpvars(0, tb_Johnson4bit);

            clear = 1'b1;
            en = 1'b0;
            count_mode = 1'b0;
            #10;

            clear = 1'b0;
            en = 1'b1;
            count_mode = 1'b1;
            #80; //Counter ko chalne do, 8 total states hai, 10 ns ek clock cycle hai, to total 80 ns wait krna hoga

            en = 1'b0;
            #20;

            en = 1'b1;
            count_mode = 1'b0;
            #80;

            clear = 1'b1;
            #20;

            clear = 1'b0;
            en = 1'b0;
            #20;

            $finish;
        end
endmodule
// Will blink LED on and OFF every 0.5 seconds that is 24,999,999

module LEDblinker(
    input clk, clear,
    output reg led_out
    );

    parameter MAX_COUNT = 24_999_999;

    reg [$clog2(MAX_COUNT + 1)-1:0]counter_flag;

    always @(posedge clk or posedge clear)begin
        if (clear)begin
            counter_flag <= 0;
            led_out <= 1'b0;
        end else begin
            if (counter_flag == MAX_COUNT)begin
                led_out <= ~led_out;
                counter_flag <= 0;
            end else begin
                led_out <= led_out;
                counter_flag <= counter_flag + 1;
            end
        end
    end
endmodule


// clog2 is a built in function of verilog that automatically calculates the total amount of bits needed to store a particular value
// But clog2 would suppose give 8 for both 7 and 8
// That is the reason I did MAX_COUNT + 1
// Since this gives a totaL OF 25 BITS i ALSO DID -1 because we are starting from 0
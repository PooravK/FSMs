module Johnson4bit(
    input clk, clear, en, count_mode,
    output reg [3:0] q_out
    );
    always @(posedge clk or posedge clear)begin
        if (clear) begin
            q_out <= 4'b0;
        end else begin
            if (en) begin
                if (count_mode)begin
                    q_out <= {q_out[2:0], ~q_out[3]};
                end else begin
                    q_out <= {~q_out[0], q_out[3:1]};
                end
            end else begin
                q_out <= q_out;
            end
        end
    end
endmodule;


// Notable problem faced:

//When I tried to feed Q3 to D0 instead of my current down counting style, it got forever stuck at 0000
// It kept puttng 000 and 0 together, so the counter did not proceed and got stuck in a single state
//The current down counting method is the correct way, instead of shifting left and adding Q3 to D0    
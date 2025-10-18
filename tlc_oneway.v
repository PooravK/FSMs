//RED: 4 ns
//YELLOW: 2 ns
//GREEN: 4 ns

module tlc_oneway(
    input clear, clk,
    output reg RED_out, YELLOW_out, GREEN_out
    );

    reg [1:0] current_state;
    reg [7:0] timer;

    parameter RED = 2'b00;
    parameter YELLOW = 2'b01;
    parameter GREEN = 2'b10;

    always @(*)begin
        case (current_state)
            RED: begin
                RED_out = 1'b1;
                YELLOW_out = 1'b0;
                GREEN_out = 1'b0;
            end
            YELLOW: begin
                RED_out = 1'b0;
                YELLOW_out = 1'b1;
                GREEN_out = 1'b0;
            end
            GREEN: begin
                RED_out = 1'b0;
                YELLOW_out = 1'b0;
                GREEN_out = 1'b1;
            end
            default: begin
                RED_out = 1'b0;
                YELLOW_out = 1'b0;
                GREEN_out = 1'b0;
            end
        endcase
    end

    always @(posedge clk or posedge clear)begin
        if (clear) begin
            current_state <= RED;
            timer <= 8'b0;
        end else begin
            case (current_state)
                RED: begin
                    if (timer == 8'd3)begin
                        current_state <= GREEN;
                        timer <= 8'd0;
                    end else begin
                        timer <= timer + 1;
                    end
                end
                YELLOW: begin
                    if (timer == 8'd1)begin
                        current_state <= RED;
                        timer <= 8'd0;
                    end else begin
                        timer <= timer + 1;
                    end
                end
                GREEN: begin
                    if (timer == 8'd3)begin
                        current_state <= YELLOW;
                        timer <= 8'd0;
                    end else begin
                        timer <= timer + 1;
                    end
                end
            endcase
        end
    end
endmodule;
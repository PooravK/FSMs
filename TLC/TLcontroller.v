module TLcontroller(
    input clk, clear,
    output reg RED_NS, YELLOW_NS, GREEN_NS, RED_WE, YELLOW_WE, GREEN_WE
    );

    reg [2:0]current_state;
    reg [32:0]timer;

    parameter NS_MOVE = 3'b000;
    parameter NS_WAIT = 3'b001;
    parameter NS_ALL_RED = 3'b010;
    parameter WE_MOVE = 3'b011;
    parameter WE_WAIT = 3'b100;
    parameter WE_ALL_RED = 3'b101;

    always @(*)begin
        case (current_state)
            NS_MOVE: begin
                RED_NS =  1'b0;
                YELLOW_NS =  1'b0;
                GREEN_NS =  1'b1;
                RED_WE =  1'b1;
                YELLOW_WE = 1'b0;
                GREEN_WE = 1'b0;
            end
            NS_WAIT: begin
                RED_NS = 1'b0;
                YELLOW_NS = 1'b1;
                GREEN_NS = 1'b0;
                RED_WE = 1'b1;
                YELLOW_WE = 1'b0;
                GREEN_WE = 1'b0;
            end
            NS_ALL_RED: begin
                RED_NS = 1'b1;
                YELLOW_NS = 1'b0;
                GREEN_NS = 1'b0;
                RED_WE = 1'b1;
                YELLOW_WE = 1'b0;
                GREEN_WE = 1'b0;
            end
            WE_MOVE: begin
                RED_NS = 1'b1;
                YELLOW_NS = 1'b0;
                GREEN_NS = 1'b0;
                RED_WE = 1'b0;
                YELLOW_WE = 1'b0;
                GREEN_WE = 1'b1;
            end
            WE_WAIT: begin
                RED_NS = 1'b1;
                YELLOW_NS = 1'b0;
                GREEN_NS = 1'b0;
                RED_WE = 1'b0;
                YELLOW_WE = 1'b1;
                GREEN_WE = 1'b0;
            end
            WE_ALL_RED: begin
                RED_NS = 1'b1;
                YELLOW_NS = 1'b0;
                GREEN_NS = 1'b0;
                RED_WE = 1'b1;
                YELLOW_WE = 1'b0;
                GREEN_WE = 1'b0;
            end
            default: begin
                RED_NS = 1'b1;
                YELLOW_NS = 1'b0;
                GREEN_NS = 1'b0;
                RED_WE = 1'b1;
                YELLOW_WE = 1'b0;
                GREEN_WE = 1'b0;
            end
        endcase
    end

    always @(posedge clk or posedge clear)begin
        if (clear)begin
            current_state <= NS_ALL_RED;
            timer <= 0;
        end else begin
            case (current_state)
                NS_MOVE: begin
                    if (timer == 29) begin
                        current_state <= NS_WAIT;
                        timer <= 0;
                    end else begin
                        timer <= timer + 1;
                    end
                end
                NS_WAIT: begin
                    if (timer == 3) begin
                        current_state <= NS_ALL_RED;
                        timer <= 0;
                    end else begin
                        timer <= timer + 1;
                    end
                end
                NS_ALL_RED: begin
                    if (timer == 3)begin
                        current_state <= WE_MOVE;
                        timer <= 0;
                    end else begin
                        timer <= timer + 1;
                    end
                end
                WE_MOVE: begin
                    if (timer == 29)begin
                        current_state <= WE_WAIT;
                        timer <= 0;
                    end else begin
                        timer <= timer + 1;
                    end
                end
                WE_WAIT: begin
                    if (timer == 3)begin
                        current_state <= WE_ALL_RED;
                        timer <= 0;
                    end else begin
                        timer <= timer + 1;
                    end
                end
                WE_ALL_RED: begin
                    if (timer == 3)begin
                        current_state <= NS_MOVE;
                        timer <= 0;
                    end else begin
                        timer <= timer + 1;
                    end
                end
            endcase
        end
    end
endmodule
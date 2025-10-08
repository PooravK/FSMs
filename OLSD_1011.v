module OLSD_1011(
    input clk, clear, in,
    output reg out
    );

    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;

    reg [2:0]currentState;
    reg [2:0]nextState;

    always @(posedge clk or posedge clear)begin
        if (clear)begin
            currentState <= S0;
        end else begin
            currentState <= nextState;
        end
    end

    always @(*)begin
        case (currentState)
            S0: nextState = (in == 1)?S1:S0;
            S1: nextState = (in == 1)?S1:S2;
            S2: nextState = (in == 1)?S3:S0;
            S3: nextState = (in == 1)?S4:S2;
            S4: nextState = (in == 1)?S1:S2;
        endcase
    end

    always @(*)begin
        if (currentState == S4)begin
            out = 1'b1;
        end else begin
            out = 1'b0;
        end
    end
    
endmodule
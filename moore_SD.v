module moore_SD(
    input clk, clear, in,
    output reg out
    );

    parameter S0 = 3'b000; // Initial
    parameter S1 = 3'b001; // 1
    parameter S2 = 3'b010; // 10
    parameter S3 = 3'b011; // 101
    parameter S4 = 3'b100; // 1011

    reg [2:0]currentState;
    reg [2:0]nextState;

    // Block to handle State transitions
    always @(posedge clk or posedge clear)begin
        if (clear)begin
            currentState <= S0;
        end else begin
            currentState <= nextState;
        end
    end

    // Block to determne next state based on current state and input
    always @(*)begin
        case (currentState)
            S0: nextState = (in == 1'b1)? S1: S0;  
            S1: nextState = (in == 1'b1)? S1: S2; 
            S2: nextState = (in == 1'b1)? S3: S0;  
            S3: nextState = (in == 1'b1)? S4: S0;  
            S4: nextState = (in == 1'b1)? S1: S0;
            default: nextState = S0; 
        endcase
    end

    // Block to determine the moore output which depends only on the current state
    always @(*)begin
        if (currentState == S4)begin
            out = 1'b1;
        end else begin
            out = 1'b0;
        end
    end

endmodule
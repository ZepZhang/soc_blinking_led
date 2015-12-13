module blinker (
    input clk,
    input [3:0] delay,
    output reg [9:0] led,
    input reset,
    input pause
);

reg [23:0] count = 24'b0;
reg [4:0] pos = 5'b00000;
reg running = 1'b1;

always @(pos) begin
    case (pos)
        5'b00000: led <= 10'b0000000001;
        5'b00001: led <= 10'b0000000010;
        5'b00010: led <= 10'b0000000100;
        5'b00011: led <= 10'b0000001000;
        5'b00100: led <= 10'b0000010000;
        5'b00101: led <= 10'b0000100000;
		  5'b00110: led <= 10'b0001000000;
		  5'b00111: led <= 10'b0010000000;
		  5'b01000: led <= 10'b0100000000;
		  5'b01001: led <= 10'b1000000000;
        5'b01010: led <= 10'b0100000000;
        5'b01011: led <= 10'b0010000000;
        5'b01100: led <= 10'b0001000000;
        5'b01101: led <= 10'b0000100000;
        5'b01110: led <= 10'b0000010000;
		  5'b01111: led <= 10'b0000001000;
		  5'b10000: led <= 10'b0000000100;
		  5'b10001: led <= 10'b0000000010;
        default: led <= 10'b0;
    endcase
end

always @(posedge clk) begin
    if (reset) begin
        count <= 24'b0;
        pos <= 5'b00000;
        running <= 1'b1;
    end else if (pause) begin
        running <= !running;
    end else if (running) begin
        if (count == 24'b0) begin
            count <= {delay, 20'b0};
            if (pos == 5'b10001)
                pos <= 5'b00000;
            else
                pos <= pos + 1'b1;
        end else begin
            count <= count - 1'b1;
        end
    end
end

endmodule

module traffic_light(
input clk,
input reset,
output reg [2:0] lights // R G Y → lights = 100, 010, 001
);


// State encoding
typedef enum reg [1:0] {
RED = 2'b00,
GREEN = 2'b01,
YELLOW = 2'b10
} state_t;


state_t current_state, next_state;


// Light duration counters
integer count;
parameter RED_TIME = 5;
parameter GREEN_TIME = 5;
parameter YELLOW_TIME = 2;


// State transition logic
always @(posedge clk or posedge reset) begin
if (reset) begin
current_state <= RED;
count <= 0;
end else begin
current_state <= next_state;
end
end


// Next state logic + timer
always @(*) begin
next_state = current_state;


case (current_state)
RED: begin
lights = 3'b100;
if (count >= RED_TIME)
next_state = GREEN;
end


GREEN: begin
lights = 3'b010;
if (count >= GREEN_TIME)
next_state = YELLOW;
end


YELLOW: begin
lights = 3'b001;
if (count >= YELLOW_TIME)
next_state = RED;
end
endcase
end


// Timer logic
always @(posedge clk or posedge reset) begin
if (reset)
count <= 0;
else begin
case (current_state)
RED: count <= (count >= RED_TIME) ? 0 : count + 1;
GREEN: count <= (count >= GREEN_TIME) ? 0 : count + 1;
YELLOW: count <= (count >= YELLOW_TIME) ? 0 : count + 1;
endcase
end
end


endmodule

`timescale 1ns/1ps


module traffic_light_tb;


reg clk;
reg reset;
wire [2:0] lights;


// Instantiate DUT
traffic_light uut(
.clk(clk),
.reset(reset),
.lights(lights)
);


// Clock generation: 10 ns period
always #5 clk = ~clk;


initial begin
$dumpfile("wave.vcd");
$dumpvars(0, traffic_light_tb);


clk = 0;
reset = 1; #10;
reset = 0;


// Run long enough to see cycles
#200;
$finish;
end


endmodule

`timescale 1ns/1ps
module p1 ();
logic clk, reset, en;
logic [4:0] psc,count;
logic tick;
counter
dut0(.clk(clk),.reset(reset),.en(en),.psc(psc),.tick(tick),.count(count)
);
initial begin
psc = 5'b10000;
end
initial begin
reset = 0; en = 0; #10; en = 1; reset = 1;
end
always begin
clk = 0; #5;
clk = 1; #5;
end
initial begin
#1000; $stop;
end
endmodule

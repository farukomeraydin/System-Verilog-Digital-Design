`timescale 1ns/1ps
module p2 ();
logic clk, reset, en;
logic [4:0] psc;
logic tick,done;
logic [15:0] reload,new_count;
reverse_counter
dut1(.clk(clk),.reset(reset),.reload(reload),.done(done),.new_count(
new_count),.en(en),.tick(tick),.psc(psc));
initial begin
psc = 5'b00101;
reload = 16'h0010;
end
initial begin
en = 0; reset = 0; #5; en = 1; reset = 1;
end
always begin
clk = 0;#3; clk = 1; #3;
end
initial begin
#3000; $stop;
end
endmodule

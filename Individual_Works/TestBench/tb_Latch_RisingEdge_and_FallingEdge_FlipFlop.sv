`timescale 1ns/1ps
module tb_devre ();
logic d, clk;
logic q1, q2, q3;
 p_flip_flop uut0(.clk(clk),.d(d),.q(q1));
 n_flip_flop uut1(.clk(clk),.d(d),.q(q2));
 latch uut2(.clk(clk),.d(d),.q(q3));

always begin
clk = 0; #10;
clk = 1; #10;
end 
 initial begin
 d = 0; #7; d = 1; #5; d = 0; #2;
 d = 1; #4; d = 0; #3; d = 1; #3;
 d = 0; #2; d = 1; #2; d = 0; #4;
 d = 1; #2; d = 0; #2; d = 1; #6;
 d = 0; #10;
 $stop; // stop the simulation
end
endmodule

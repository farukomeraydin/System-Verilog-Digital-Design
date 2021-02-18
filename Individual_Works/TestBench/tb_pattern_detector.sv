module tb1();
logic clk,reset,a,y;
Pattern_Detector uut0(.A(a),.Y(y),.clk(clk),.reset(reset));
always begin
clk = 0;#10;
clk = 1;#10;
end
initial begin
reset = 1;#5;
reset = 0;
a = 0;#100;
a = 1;
end
initial begin
#1500; $stop;
end
endmodule

module tb2 ();
logic clk,reset,y,mesgul,baslat;
logic [4:0] D;
Siralayici uut0(.clk(clk),.reset(reset),.y(y),.mesgul(mesgul),.baslat(baslat),.d(D));
initial begin
D = 5'b11001;
end
always begin
clk = 0; #3;
clk = 1; #3;
end
initial begin
baslat = 0;#5;
baslat = 1;#5;
baslat = 0;
end
initial begin
reset = 1;#3;
reset = 0;
end
initial begin
#1500;
$stop;
end
endmodule

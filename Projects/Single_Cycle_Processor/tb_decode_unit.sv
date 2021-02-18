`timescale 1ns/1ps
module tb_Urey_Aydin();
logic clk,reset,we;
logic pc_update;
logic [31:0] pc_new;
logic [31:0] pc;
always begin
clk = 0;#5;
clk = 1;#5;
end
initial begin
pc_new = 32'd5;
pc_update = 0; #50;
pc_update = 1; #50;
pc_update = 0; #50;
pc_update = 1; #50;
we = 0;
$stop; #200;
end
initial begin
reset = 0; #5;
reset = 1;
end
hafiza umm (.clk(clk),.reset(reset),.we(we),.addr(pc));
module hafiza (
input logic clk,reset,
input logic we,
input logic [31:0] waddr,addr,
input logic [15:0] din,
output logic [31:0] komut
);
logic [0:63] mem [0:31];
initial begin
$readmemb("fib20.mem",mem);
end
Urey_Aydin ddt(.clk(clk),.reset(reset),.komut(komut));
assign addr = {2'b0,pc[29:0]};
assign komut = mem[addr/4];
endmodule
endmodule

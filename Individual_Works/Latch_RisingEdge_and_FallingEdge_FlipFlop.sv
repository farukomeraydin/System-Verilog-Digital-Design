module latch(
input logic clk,
input logic d,
output logic q
);
always_latch
if(clk)
q <=d;
endmodule
module n_flip_flop(
input logic clk,
input logic d, 
output logic q
);
always_ff @(negedge clk)
q <=d;
endmodule
module p_flip_flop(
input logic clk,
input logic d,
output logic q
);
always@(posedge clk)
q <=d;
endmodule

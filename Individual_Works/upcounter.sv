module counter (
input logic clk, reset,en,
input logic [4:0] psc,
output logic tick,
output logic [4:0] count
);
always_ff @(posedge clk, negedge reset)
if (!reset)
count <= {5{1'b0}};
else if (en)
count <= count + 1'b1;
assign tick = (count==psc)? 1:0;
endmodule

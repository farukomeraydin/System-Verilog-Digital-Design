`timescale 1ns/1ps
module mux2 (
 input logic [7:0] a,b,
 input logic s,
 output logic [7:0] x
);
assign x = s ? a : b;
endmodule 
module mux4(
 input logic [7:0] a,b,c,d,
 input logic s0,s1,
 output logic [7:0] y
);
logic [7:0] n1,n2;
mux2 inst0(.a(a), .b(b), .s(s0), .x(n1));
mux2 inst1(.a(c), .b(d), .s(s0), .x(n2));
mux2 inst2(.a(n1), .b(n2), .s(s1), .x(y));
endmodule

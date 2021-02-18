`timescale 1ns/1ps
module tb_mux4 ();
//Ba?lanacak giri?-ç?k??lar
 logic [7:0] a,b,c,d;
 logic s0, s1;

 logic [7:0] y;
// test edece?imiz devreyi ba?layal?m
mux4 dut0(.a(a), .b(b), .c(c), .d(d), .s0(s0), .s1(s1),.y(y));
 initial begin
 a = {8'b00000001}; #10;
 b = {8'b00000010}; #10;
 c = {8'b00000100}; #10;
 d = {8'b00001000}; #10;
 s0 = 0; #10;
 s1 = 1; #10;

 $stop;
 end
endmodule

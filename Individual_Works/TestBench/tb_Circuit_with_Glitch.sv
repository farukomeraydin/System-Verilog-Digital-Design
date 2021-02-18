`timescale 1ns/1ps
module tb_glitch_devresi();
//Bağlanacak giriş-çıkışlar
 logic a,b,c,d;
 logic x;
// test edeceğimiz devreyi bağlayalım
glitch_devresi dut0(a, b, c, d, x);
 initial begin
 a = 0; b = 0; c = 0; d = 0; #10; //a,b,c ve d'yi gönder 10 ns bekle
 b = 1; #10; //a = 0 b = 1 c = 0 d = 0
 a = 1; #10; //a = 1 b = 1 c = 0 d = 0
 c = 1; #10; //a = 1 b = 1 c = 1 d = 0
 d = 1; #10; //a = 1 b = 1 c = 1 d = 1
 a = 0; #10; //a = 0 b = 1 c = 1 d = 1
 b = 0; #10; //a = 0 b = 0 c = 1 d = 1
 c = 0; #10; //a = 0 b = 0 c = 0 d = 1
 a = 1; #10; //a = 1 b = 0 c = 0 d = 1
 b = 1; #10; //a = 1 b = 1 c = 0 d = 1
 a = 0; #10; //a = 0 b = 1 c = 0 d = 1
d = 0; b = 0; a = 1; #10; //a = 1 b = 0 c = 0 d = 0
 c = 1; #10; //a = 1 b = 0 c = 1 d = 0
 d = 1; #10; //a = 1 b = 0 c = 1 d = 1
a = 0; b = 1; d = 0; #10; //a = 0 b = 1 c = 1 d = 0
 b = 0; #10; //a = 0 b = 0 c = 1 d = 0
 $stop;
 end
endmodule

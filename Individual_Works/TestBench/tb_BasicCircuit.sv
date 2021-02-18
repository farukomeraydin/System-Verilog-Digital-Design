`timescale 1ns/1ps
module tb_ilk_devrem ();
//Bağlanacak giriş-çıkışlar
 logic a,b;
 logic y;
// test edeceğimiz devreyi bağlayalım
ilk_devrem dut0(a, b, y);
 initial begin
 a = 0; b = 0; #10; //a ve b'yi gönder 10 ns bekle
 b = 1; #10;
 a = 1; #10;
 b = 0; #10;
 $stop;
 end
endmodule

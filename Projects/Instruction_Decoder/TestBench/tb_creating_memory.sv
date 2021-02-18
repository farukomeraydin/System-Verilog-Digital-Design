`timescale 1ns/1ps
module tb_memory ();
logic clk;
logic [4:0] rs1;
logic [4:0] rs2;
logic [31:0] rs1_data;
logic [31:0] rs2_data;
memory dut0(clk, rs1, rs2, rs1_data, rs2_data);
always begin
clk <= 0; #5; clk <= 1; #5;
end
// sadece oku
initial begin
 rs1 = 5'b00000; # 10;
 rs1 = 5'b00001; # 10;
 rs1 = 5'b00010; # 10;
 rs1 = 5'b00011; # 10;
 rs1 = 5'b00100; # 10;
 rs1 = 5'b00101; # 10;
 rs1 = 5'b00110; # 10;
 rs1 = 5'b00111; # 100;
 $stop;
end

initial begin
 rs2 = 5'b00000; # 10;
 rs2 = 5'b00001; # 10;
 rs2 = 5'b00010; # 10;
 rs2 = 5'b00011; # 10;
 rs2 = 5'b00100; # 10;
 rs2 = 5'b00101; # 10;
 rs2 = 5'b00110; # 10;
 rs2 = 5'b00111; # 100;
 $stop;
 end
endmodule

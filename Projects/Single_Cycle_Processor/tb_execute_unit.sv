module tb_execute ();
logic [31:0] rs1_data,rs2_data;
logic [31:0] imm;
logic [6:0] opcode;
logic [3:0] func;
logic [31:0] sonuc;
logic pc_update;
logic we;
logic hata;
Execute
ass00(.rs1_data(rs1_data),.rs2_data(rs2_data),.imm(imm),.opcode(opcode),.func(func),.sonuc(sonuc),.pc_update(
pc_update),.we(we),.hata(hata));
initial begin
rs1_data = 32'd7;#3;
rs2_data = 32'd4;#3;
imm = 32'd64;
opcode = 7'b0000001; #100;
opcode = 7'b0000011; #100;
opcode = 7'b0000111; #100;
opcode = 7'b0001111; #100;
$stop; #1500;
end
always begin
func = 4'b0000; #10;
func = 4'b1000; #10;
func = 4'b0111; #10;
func = 4'b0110; #10;
func = 4'b0100; #10;
func = 4'b0101; #10;
end
endmodule

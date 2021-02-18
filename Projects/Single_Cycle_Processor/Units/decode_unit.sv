module Urey_Aydin(
input logic clk,reset,
input logic [31:0] komut,
output logic [31:0]pc ,
output logic hata
);
logic [31:0] rs1_data,rs2_data;
logic [31:0] imm;
logic [6:0] opcode;
logic [3:0] func ;
logic [31:0] sonuc ;
logic pc_update;
logic [31:0] pc_new;
logic we;
logic hata_decode, hata_execute;
fetch uut(.clk(clk),.reset(reset),.pc(pc),.pc_update(pc_update),.pc_new(pc_new));
decode uud
(.clk(clk),.reset(reset),.komut(komut),.rs1_data(rs1_data),.rs2_data(rs2_data),.imm(imm),.opcode(opcode),.func(f
unc),.we(we),.rd_data(sonuc), .hata(hata_decode)); // decode ünitemiz
execute uum
(.rs1_data(rs1_data),.rs2_data(rs2_data),.imm(imm),.opcode(opcode),.func(func),.pc_update(pc_update),.we(we)
,.sonuc(sonuc),.hata(hata_execute), .pc_new(pc_new));
assign hata = hata_decode | hata_execute;
endmodule

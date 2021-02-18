module tb_p3();
logic clk,reset;
logic we;
logic [31:0] rd_data;
logic [31:0] komut;
logic [6:0] opcode;
logic [3:0] aluop;
logic [4:0] rs1;
logic [4:0] rs2;
logic [31:0] rs1_data;
logic [31:0] rs2_data;
logic [4:0] rd;
logic [31:0] imm;
logic hata;
p3
uut0(.clk(clk),.reset(reset),.we(we),.komut(komut),.opcode(opcode),.aluop(aluop),.rs1(rs1),.rs2(rs2),.rs1_data(rs1
_data),.rs2_data(rs2_data),.rd(rd),.rd_data(rd_data),.imm(imm),.hata(hata));
always begin
clk = 0; #5;
clk = 1; #5;
end
initial begin
komut = 32'hFB01;
end
initial begin
we = 1;#5;
reset = 1;#5;
end
initial begin
#1500; $stop;
end
endmodule

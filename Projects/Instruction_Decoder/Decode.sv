module p1 (
input logic clk, reset, // problem2 icin gerekli olacaklar
input logic [31:0] komut,
output logic [6:0] opcode,
output logic [3:0] aluop,
output logic [4:0] rs1,
output logic [4:0] rs2,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data,
output logic [4:0] rd,
output logic [31:0] imm,
output logic hata
);
// problem2 icin gerekli olacaklar
logic [31:0] komutreg;
logic [3:0] aluopreg;
logic [6:0] opcodereg;
logic [4:0] rs1reg;
logic [4:0] rs2reg;
logic [31:0] rs1_datareg;
logic [31:0] rs2_datareg;
logic [4:0] rdreg;
logic [31:0] immreg;
logic hatareg;
generate
always_ff @(posedge clk) begin
komutreg <= komut;
opcode <= opcodereg;
rs1 <= rs1reg;
rs2 <= rs2reg;
rs1_data <= rs1_datareg;
rs2_data <= rs2_datareg;
rd <= rdreg;
imm <= immreg;
hata <= hatareg;
aluop <= aluopreg;
end
endgenerate
assign opcodereg = komutreg[6:0] ;//opcode her tip için ortak bölgede
assign rs1_datareg = 32'b0;
assign rs2_datareg = 32'b0;
always @ ("*")
begin
hatareg = 0;
 if(opcodereg == 7'b0000001) //R TİPİ
 begin
 rs1reg = komutreg[19:15];
 rs2reg = komutreg[24:20];
 rdreg = komutreg[11:7] ;
 aluopreg = {komutreg[30],komutreg[14],komutreg[13],komutreg[12]};
 immreg = 32'b0;
 end
 else if(opcodereg == 7'b0000011) //I TİPİ
 begin
 rs1reg = komutreg[19:15];
 rdreg = komutreg[11:7] ;
 aluopreg = {1'b0,komutreg[14],komutreg[13],komutreg[12] };
 immreg = {20'b0 , komutreg[31:20] };
 rs2reg = 5'b0;//diğer değişkenler 0
 end
 else if(opcodereg == 7'b0000111) //U TİPİ
 begin
 rdreg = komutreg[11:7] ;
 immreg = {12'b0 , komutreg[31:12] };
 rs1reg = 5'b0;//diğer değişkenler 0
 rs2reg = 5'b0;
 aluopreg = 4'b0;
 end

 else if(opcodereg == 7'b0001111) //B TİPİ
 begin
 rs1reg = komutreg[19:15];
 rs2reg = komutreg[24:20];
 aluopreg = {1'b0,komutreg[14],komutreg[13],komutreg[12]};
 immreg = {19'b0,komutreg[31:25],komutreg[11:7],1'b0};
 rdreg = 5'b0;//diğer değişkenler 0

 end

 else
 begin

 hatareg = 1;
 rs1reg = komutreg[19:15];
 rs2reg = komutreg[24:20];
 aluopreg = {1'b0,komutreg[14],komutreg[13],komutreg[12]};
 immreg = {19'b0,komutreg[31:25],komutreg[11:7],1'b0};
 rdreg = 5'b0;

 end
end
endmodule

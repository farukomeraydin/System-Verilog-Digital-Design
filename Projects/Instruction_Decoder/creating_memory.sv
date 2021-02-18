module memory
(
 input logic clk ,
 input logic [4:0] rs1,
 input logic [4:0] rs2,
 output logic [31:0] rs1_data,
 output logic [31:0] rs2_data
);
logic [31:0] mem [0:31];
logic [4:0] rs1reg;
logic [4:0] rs2reg;
logic [31:0] rs1_datareg;
logic [31:0] rs2_datareg;
generate
 always_ff @(posedge clk) begin
 rs1reg <= rs1;
 rs2reg <= rs2;
 rs1_data <= rs1_datareg;
 rs2_data <= rs2_datareg;
 end
 endgenerate
initial begin
 $readmemh("reg_image.mem", mem);
end
assign rs1_datareg = mem[rs1reg];
assign rs2_datareg = mem[rs2reg];
endmodule

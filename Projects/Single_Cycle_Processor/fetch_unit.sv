module fetch (
input logic clk,reset,
input logic pc_update,
input logic [31:0] pc_new,
output logic [31:0] pc
);
logic [31:0] pcreg;
always_ff @ (negedge reset,posedge clk) begin
pc <= pcreg;
if (!reset)
pcreg <= 0;
else if (pc_update)
pcreg <= pc_new;
else
pcreg <= pcreg + 32'd4;
end
endmodule

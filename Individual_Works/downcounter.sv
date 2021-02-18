module reverse_counter (
input logic clk,reset,en,
input logic [4:0]psc,
input logic [15:0] reload,
output logic done,tick,
output logic [15:0] new_count
);
counter udd(.clk(clk),.reset(reset),.en(en),.psc(psc),.tick(tick));
always_ff@(posedge clk,negedge reset,posedge en,negedge
new_count)
begin
done <= 0;
if(!reset)
new_count <=0;
else if (en)
 if(tick)
 new_count <= new_count-1;
else if (!new_count) begin
done <= 1;
new_count <= reload;
end
end
endmodule

module Siralayici (
input logic clk,reset,baslat,
input logic [4:0] d,
output logic mesgul,y
);
typedef enum {S0,S1,S2,S3,S4,S5,S6,S7} statetype;
statetype state,nextstate;
always_ff @(posedge clk)
if (reset)
state <= S0;
else
state<= nextstate;
always_comb begin
case(state)
S0: if (baslat)
nextstate = S1;
else
nextstate = S0;
S1: if (!baslat)
nextstate = S2;
else
nextstate = S1;
S2: if(!baslat)
nextstate = S3;
else nextstate = S2;
S3: if(!baslat)
nextstate = S4;
else nextstate = S3;
S4: if(!baslat)
nextstate = S5;
else nextstate = S4;
S5: if(!baslat)
nextstate = S6;
else nextstate = S5;
S6: if(!baslat)
nextstate = S7;
else nextstate = S6;
S7: if(!baslat)
nextstate = S0;
else nextstate = S7;
default: nextstate = S0;
endcase
end
always_comb begin
if (state==S0)begin
mesgul = 0;
y = 1;
end
else if (state ==S1)begin
mesgul = 1;
y = 0;
end
else if (state==S2)begin
mesgul = 1;
y = d[0];
end
else if (state==S3)begin
mesgul = 1;
y = d[1];
end
else if (state==S4)begin
mesgul = 1;
y = d[2];
end
else if (state==S5)begin
mesgul = 1;
y = d[3];
end
else if (state==S6)begin
mesgul = 1;
y = d[4];
end
else
begin
mesgul = 1;
y = 1;
end
end
endmodule

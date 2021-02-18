module Pattern_Detector(
input logic clk,reset,A,
output logic Y
);
typedef enum {S0,S1,S2,S3,S4,S5,S6,S7,S8} statetype;
statetype state,nextstate;
always_ff @(posedge clk)
if(reset)
state<= S0;
else state<=nextstate;
always_comb begin
case (state)
S0: if(A) nextstate = S1;
else
nextstate = S5;
S1: if(A) nextstate = S2;
else
nextstate = S5;
S2: if(A) nextstate = S3;
else
nextstate = S5;
S3: if(A) nextstate = S4;
else
nextstate = S5;
S4: if(A) nextstate = S4;
else
nextstate = S5;
S5: if(!A) nextstate = S6;
else
nextstate = S1;
S6: if(!A) nextstate = S7;
else
nextstate = S1;
S7: if(!A) nextstate = S8;
else
nextstate = S1;
S8: if(!A) nextstate = S8;
else
nextstate = S1;
default : nextstate= S0;
endcase
end
always_comb begin
if (state==S4||state==S8)
assign Y = 1;
else
assign Y = 0;
end
endmodule

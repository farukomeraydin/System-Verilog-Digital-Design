module half_adder(
input logic A,B,
output logic S,Cout
);
assign S = A^B;
assign Cout = A&B;
endmodule
module full_adder(
input logic a,b,cin,
output logic s,cout
);
logic w1, w2,w3;
half_adder(.A(a),.B(b),.S(w1),.Cout(w2));
half_adder(.A(cin),.B(w1),.S(s),.Cout(w3));
assign cout = w2 | w3;
endmodule
module ripple_carry(
input logic a,b,cin,
output logic cout,
output logic [4:0] sum
);
logic w1,w2,w3,w4;
full_adder(.a(a),.b(b),.cin(cin),.s(sum[0]),.cout(w1));
full_adder(.a(a),.b(b),.cin(w1),.s(sum[1]),.cout(w2));
full_adder(.a(a),.b(b),.cin(w2),.s(sum[2]),.cout(w3));
full_adder(.a(a),.b(b),.cin(w3),.s(sum[3]),.cout(w4));
full_adder(.a(a),.b(b),.cin(w4),.s(sum[4]),.cout(cout));
endmodule

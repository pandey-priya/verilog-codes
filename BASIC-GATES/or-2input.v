module or_gate(
input a,b,
output reg  y);
    always @(a,b)
    y = a |b;
endmodule

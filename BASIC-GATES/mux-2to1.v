//2-to-1 mux, which takes 2 inputs and a single output based on select line
module mux_2to1(
input a,b,sel,
output y);

    assign y = sel ?b:a;

endmodule

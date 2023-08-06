module half_adder(input a,b, output so,co);
  assign so = a ^ b;
  assign co = a & b;
endmodule

module full_adder(input a,b,cin, output so,co);
  assign so = a ^ b ^ cin;
  assign co = (a & b)|(b & cin)|(a & cin);
endmodule 

module array_multiplier(input [3:0]A,B, output [7:0]Z);
  reg signed P[4][4];
  wire [10:0]C; //carry of HA/FA
  wire [5:0]S; //sum of HA/FA
  genvar g;
  generate
    for(g=0; g<4; g++) begin
      and a0(P[g][0], A[g], B[0]);
      and a1(P[g][1], A[g], B[1]);
      and a2(P[g][2], A[g], B[2]);
      and a3(P[g][3], A[g], B[3]);
    end
  endgenerate

  assign Z[0] = P[0][0];

  //row 0
  half_adder h0(P[0][1], P[1][0], Z[1], C[0]);
  half_adder h1(P[1][1], P[2][0], S[0], C[1]);
  half_adder h2(P[2][1], S[1], C[2]);

  //row 1
  full_adder f0(P[0][2], C[0], S[0], Z[2], C[3]);
  full_adder f1(P[1][2], C[1], S[1], S[2], C[4]);
  full_adder f2(P[2][2], C[2], P[3][1], S[3], C[5]);

  // row 2
  full_adder f3(P[0][3], C[3], S[2], Z[3], C[6]);
  full_adder f4(P[1][3], C[4], S[3], S[4], C[7]);
  full_adder f5(P[2][3], C[5], P[3][2], S[5], C[8]);

  // row 3
  half_adder h3(C[6], S[4], Z[4], C[9]);
  full_adder f6(C[9], C[7], S[5], Z[5], C[10]);
  full_adder f7(C[10], C[8], P[3][3], Z[6], Z[7]);

endmodule
  
  

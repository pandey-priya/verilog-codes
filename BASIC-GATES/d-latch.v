module d_latch(
input en,d,
output reg q);

   always@(en,d)
   begin
      if(en)
      q <= d;
   end

endmodule

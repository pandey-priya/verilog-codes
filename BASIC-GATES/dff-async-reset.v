module d_ff (
input clk,d,rst_n,
output reg q);

   //Here is reset is Asynchronous, You have include in sensitivity list
  
   always@(posedge clk ,negedge rst_n)
   begin
      if(!rst_n)
         q <= 1'b0;
      else
         q <= d;
   end

endmodule

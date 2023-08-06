module tb_mux_4to1;

   reg I0,I1,I2,I3,SEL0,SEL1;
   wire Y;
  
   mux_4to1 MUX (.i0(I0),.i1(I1),.i2(I2),.i3(I3),.sel0(SEL0),.sel1(SEL1),.y(Y));
  
   initial begin
       I0 =1'b0;
       I1= 1'b0;
       I2 =1'b0;
       I3 =1'b0;
       SEL0 =1'b0;
       SEL1 =1'b0;
       #45 $finish;
   end
  
   always #2 I0 = ~I0;
   always #4 I1 =~I1;
   always #6 I2 =~I1;
   always #8 I3 =~I1;
   always #3 SEL0 = ~SEL0;
   always #3 SEL1 = ~SEL1;
  
   always @(Y)
   $display( "time =%0t INPUT VALUES: \t I0=%b I1 =%b I2 =%b I3 =%b SEL0 =%b SEL1 =%b \t output value Y =%b ",$time,I0,I1,I2,I3,SEL0,SEL1,Y);
  
endmodule

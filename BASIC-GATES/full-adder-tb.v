module tb_full_adder;

     reg A,B,CIN;
     wire SUM,COUT;
    
     full_adder FA (.a(A) ,.b(B),.sum(SUM),.cin(CIN),.cout(COUT));
    
     initial begin
         A =1'b0;
         B= 1'b0;
         CIN = 1'b0;
         #45 $finish;
     end
    
     always #6 A =~A;
     always #3 B =~B;
     always #12 CIN = ~CIN;
    
     always @(SUM,COUT)
     $display( "time =%0t \tINPUT VALUES: \t A =%b B =%b CIN =%b \t output value SUM          
      =%b COUT =%b ",$time,A,B,CIN,SUM,COUT);

endmodule

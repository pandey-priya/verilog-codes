module tb_half_adder;

    reg A,B;
    wire SUM,CARRY;
    
    half_adder HA (.a(A) ,.b(B),.sum(SUM),.carry(CARRY))
    
    initial begin
        A =1'b0;
        B= 1'b0;
        #45 $finish;
    end
    
    always #6 A =~A;
    always #3 B =~B;
    
    always @(SUM,CARRY)
    $display( "time =%0t \tINPUT VALUES: \t A=%b B =%b \t output value SUM =%b CARRY =%b ",$time,A,B,SUM,CARRY);

endmodule

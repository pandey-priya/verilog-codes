module tb_latch;
    reg en,d;
    wire q;
    
    d_latch DLATCH (.en(en) ,.d(d) ,.q(q));
    
    initial begin
        en =1'b0;
        d =1'b1;
        #45 $finish;
    end
    
    always #6 en =~ en;
    always #3 d =~d;
    
    always@( q , en )
        $display("time =%0t \t INPUT VALUES \t en =%b d =%b \t OUTPUT VALUES q=%b",$time,en,d,q);

endmodule

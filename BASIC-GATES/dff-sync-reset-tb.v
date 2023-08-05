module tb_dff;
    reg RST_n, CLK,D;
    wire Q;
    
    d_ff DFF (.clk(CLK) ,.rst_n(RST_n) ,.q(Q),.d(D));
    
    initial begin
        RST_n = 1'b0;
        CLK =1'b0;
        D =1'b1;
        #5 RST_n = 1'b1;
        #7 RST_n = 1'b0;
        #7 RST_n = 1'b1;
        #45 $finish;
    end
    
    always #4 CLK = ~CLK;
    always #6 D = ~D;
    
    always @(posedge CLK )
    $strobe("time =%0t \t INPUT VALUES \t D =%b RST_n =%b \t OUDPUT VALUES Q =%d",$time,D,RST_n,Q);

endmodule

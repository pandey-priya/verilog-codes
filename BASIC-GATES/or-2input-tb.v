module tb_and_gate;
reg A,B;
wire Y;
or_gate a1 (.a(A) ,.b(B),.y(Y));
initial begin
    A =1'b0;
    B= 1'b0;
    #45 $finish;
end

always #6 A =~A;
always #3 B =~B;

always @(Y)
$display( "time =%0t \tINPUT VALUES: \t A=%b B =%b \t output value Y =%b",$time,A,B,Y);

endmodule

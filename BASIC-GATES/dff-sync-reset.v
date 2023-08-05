module d_ff (
input clk,d,rst_n,
output reg q);
 
    //In Synchronous Reset, Reset condition is verified wrt to clk.Here It is verified at every //posedge of clk.
    always@(posedge clk )
    begin
        if (!rst_n)
            q <= 1'b0;
        else
            q <= d;
    end
 
endmodule

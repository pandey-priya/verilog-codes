module tb_encoder_8to3;

    reg en;
    reg  [7:0]in;
    wire [2:0] out;
    
    encoder_8to3 ENC (.en(en),.in(in),.out(out));    
    
    initial begin
        en =0;
        in =0;
        repeat(10)
        random_generation(in,en);
        #45 $finish;
    end
    
    task random_generation;
    output [7:0]in_t;
    output en_t;
    begin
        #4;
        in_t = $random % 8;
        en_t =$random;
    end
    endtask
    
    
    task display;
    input en_t;
    input [7:0]in_t;
    input [2:0]out_t;
        $display("time =%0t \t INPUT VALUES \t en =%b in =%b \t OUTPUT VALUES out =%b",$time,en_t,in_t,out_t);
    endtask
    
    always@(out)
       display(en,in,out);

endmodule

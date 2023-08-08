module count_ones_testbench;

    // Inputs
  reg [31:0] in;
  reg clk;
  reg reset_n;

    // Outputs
  wire [5:0] count;
  
  initial begin
    $dumpfile("count_ones_testbench.vcd");
    $dumpvars(0,count_ones_testbench);
  end
  
  always
    #50clk = ~clk;
 
    // Instantiate the Unit Under Test (UUT)
    count_ones dut (
      .in(in),
      .clk(clk),
      .reset_n(reset_n),
      .count(count)
    );

    initial begin
      clk = 1'b1;
      reset_n = 0; #100;
      reset_n = 1; #100;
        in = 32'hFFFFF;   #100;
        in = 32'h8F56F;   #100;
        in = 32'hD3FFF;   #100;
        in = 32'h10001;   #100;
        in = 32'h0F10F;   #100;
        in = 32'h57822;   #100;
        in = 32'hF7ABC;   #100;   
      #100 $stop;
    end
      
endmodule

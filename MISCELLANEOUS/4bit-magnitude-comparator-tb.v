module tb_tm;

    // Inputs
    reg [3:0] Data_in_A;
    reg [3:0] Data_in_B;

    // Outputs
    wire less;
    wire equal;
    wire greater;
  
  	initial begin
      $dumpfile("tb_tm.vcd");
      $dumpvars(0,tb_tm);
    end

    // Instantiate the Unit Under Test (UUT)
    comparator uut (
        .Data_in_A(Data_in_A), 
        .Data_in_B(Data_in_B), 
        .less(less), 
        .equal(equal), 
        .greater(greater)
    );

    initial begin
        //Apply inputs
        Data_in_A = 10;
        Data_in_B = 12;
        #100;
        Data_in_A = 15;
        Data_in_B = 11;
        #100;
        Data_in_A = 10;
        Data_in_B = 10;
        #100 $stop;
    end
      
endmodule

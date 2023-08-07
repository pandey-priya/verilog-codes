module tb_ring;

    // Inputs
    reg Clock;
    reg Reset;

    // Outputs
    wire [3:0] Count_out;
  
  	initial begin
      $dumpfile("tb_ring.vcd");
      $dumpvars(0,tb_ring);
    end

    // Instantiate the Unit Under Test (UUT)
    johnson_counter uut (
        .Clock(Clock), 
        .Reset(Reset), 
        .Count_out(Count_out)
    );

    ///////////////////Clock generation ///////////////////////////
    initial Clock = 0; 
    always #10 Clock = ~Clock; 
    ////////// #10 means wait for 10 ns before executing the next statement. ///////////
    
    //Simulation inputs.
    initial begin
    //Apply Reset for 50 ns.
        Reset = 1; //Reset is high
        #50;       //Wait for 50 ns
        Reset = 0; //Reset is low.
      	#500 $stop;
    end
      
endmodule

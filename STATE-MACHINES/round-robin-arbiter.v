`timescale 1ns / 1ps

module round_robin(clk,rst,req,grant);

   output [3:0] grant;
   reg   grant;
   input  clk;
   input  rst;
   input [3:0]  req;


   reg [2:0]  state;
   reg [2:0]  next_state;
   reg [1:0]  count;
 
 
   parameter [2:0] s_ideal=3'b000;
   parameter [2:0] s0=3'b001;
   parameter [2:0] s1=3'b010;
   parameter [2:0] s2=3'b011;
   parameter [2:0] s3=3'b100;



  always @(posedge clk or posedge rst) begin
    if(rst)
      state=s_ideal;
    else
      state=next_state;
  end


  always @(state,next_state,count) begin
    case (state)
      s0: begin
        if (req[0]) begin
          if(count==2'b11) begin
            if (req[1]) begin
              count=2'b00;
              next_state=s1;
            end
            else if (req[2]) begin
              count=2'b00;
              next_state=s2;
            end
            else if (req[3]) begin
              count=2'b00;
              next_state=s3;
            end
            else begin
              count=2'b00;
              next_state=s0;
            end
          end // if (count==2'b11)
          else begin
            count=count+2'b01;
            next_state=s0;
          end // else: !if(count==2'b11)
        end // if (req[0])
        else if (req[1]) begin
          count=2'b00;
          next_state=s1;
        end
        else if (req[2]) begin
          count=2'b00;
          next_state=s2;
        end
        else if (req[3]) begin
          count=2'b00;
          next_state=s3;
        end
        else begin
          count=2'b00;
          next_state=s_ideal;
        end
      end // case: s0


   s1: begin
     if (req[1]) begin
       if (count==2'b11) begin
         if (req[2]) begin
           count=2'b00;
           next_state=s2;
         end
         else if (req[3]) begin
           count=2'b00;
           next_state=s3;
         end
         else if (req[0]) begin
           count=2'b00;
           next_state=s0;
         end
         else begin
           count=2'b00;
           next_state=s1;
         end
       end // if (count==2'b11)
       else begin
         count=count+2'b01;
         next_state=s1;
       end // else: !if(count==2'b11)
     end // if (req[1])
     else if (req[2]) begin
       count=2'b00;
       next_state=s2;
     end
     else if (req[3]) begin
       count=2'b00;
       next_state=s3;
     end
     else if (req[0]) begin
       count=2'b00;
       next_state=s0;
     end
     else begin
       count=2'b00;
       next_state=s_ideal;
     end
   end // case: s1



   s2: begin
     if (req[2]) begin
       if (count==2'b11) begin
         if (req[3]) begin
           count=2'b00;
           next_state=s3;
         end
         else if (req[0]) begin
           count=2'b00;
           next_state=s0;
         end
         else if (req[1]) begin
           count=2'b00;
           next_state=s1;
         end
         else begin
           count=2'b00;
           next_state=s2;
         end
       end // if (count==2'b11)
       else begin
         count=count+2'b01;
         next_state=s2;
       end // else: !if(count==2'b11)
     end // if (req[2])
     else if (req[3]) begin
       count=2'b00;
       next_state=s3;
     end
     else if (req[0]) begin
       count=2'b00;
       next_state=s0;
     end
     else if (req[1]) begin
       count=2'b00;
       next_state=s1;
     end
     else begin
       count=2'b00;
       next_state=s_ideal;
     end
   end // case: s2



   s3: begin
     if (req[3]) begin
       if (count==2'b11) begin
         if (req[0]) begin
           count=2'b00;
           next_state=s0;
         end
         else if (req[1]) begin
           count=2'b00;
           next_state=s1;
         end
         else if (req[2]) begin
           count=2'b00;
           next_state=s2;
         end
         else begin
           count=2'b00;
           next_state=s3;
         end
       end // if (count==2'b11)
       else begin
         count=count+2'b01;
         next_state=s3;
       end // else: !if(count==2'b11)
     end // if (req[3])
     else if (req[0]) begin
       count=2'b00;
       next_state=s0;
     end
     else if (req[1]) begin
       count=2'b00;
       next_state=s1;
     end
     else if (req[2]) begin
       count=2'b00;
       next_state=s2;
     end
     else begin
       count=2'b00;
       next_state=s_ideal;
     end
   end // case: s3


   default: begin
     if (req[0]) begin
       count=2'b00;
       next_state=s0;
     end
     else if (req[1]) begin
       count=2'b00;
       next_state=s1;
     end
     else if (req[2]) begin
       count=2'b00;
       next_state=s2;
     end
     else if (req[3]) begin
       count=2'b00;
       next_state=s3;
     end
     else begin
       count=2'b00;
       next_state=s_ideal;
     end
   end // case: default
    endcase // case (state)
  end // always @ (state,next_state,count)     


always @(state,next_state,count)
  begin
     case (state)
       s0:begin grant=4'b0001; end
       s1:begin grant=4'b0010; end
       s2:begin grant=4'b0100; end
       s3:begin grant=4'b1000; end
       default:begin grant=4'b0000; end
     endcase // case (state)
  end
 endmodule
 

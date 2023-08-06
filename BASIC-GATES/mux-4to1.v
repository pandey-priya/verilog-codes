module mux_4to1(
  input i0,i1,i2,i3,sel0,sel1,
  output reg y);
  
  always @(*)   //It includes all Inputs. You can use this instead of specifying all inputs in //sensivity list.Verilog-2001 Feature
    begin
       case ({sel0,sel1})
       2'b00 : y = i0;
       2'b01 : y = i1;
       2'b10 : y = i2;
       2'b11 : y = i3;
       endcase
    end
    
endmodule

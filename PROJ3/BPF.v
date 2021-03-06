`timescale 1ns/1ps

module BPF
  (
   input CLK,
   input CAL_BPF,
   input PU_BPF,
   output RDY_BPF
   );

   reg 	  RDY_BPF;
   reg [6:0] counter;
   
   
 always @(posedge CLK) begin
    if (!PU_BPF) begin
       counter <= 20;
       RDY_BPF <= 0;
    end else if (counter > 0) begin
       if(CAL_BPF==0)begin
        counter <= counter - 1;
       end
    end else begin
        RDY_BPF <= 1;
    end
end

endmodule //BPF

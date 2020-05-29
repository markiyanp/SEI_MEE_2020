`timescale 1ns/1ps

module IREF
  (
   input CLK,
   input CAL_IREF,
   input PU_IREF,
   output RDY_IREF
   );

   reg 	  RDY_IREF;
   reg [6:0] counter;

always @(posedge CLK) begin
    if (!PU_IREF) begin
       counter <= 20;
       RDY_IREF <= 0;
    end else if (counter > 0) begin
        if(CAL_IREF==0)begin
        counter <= counter - 1;
       end
    end else begin
        RDY_IREF <= 1;
    end
end
   
   
endmodule //IREF

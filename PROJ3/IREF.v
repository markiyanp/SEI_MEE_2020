`timescale 1ns/1ps

module IREF
  (
   input CLK,
   input CAL_IREF,
   input PU_IREF,
   output RDY_IREF
   );

   reg    CAL_IREF_STA=0;
   reg 	  RDY_IREF=0;
   reg    AUX = 0;

   reg [32:0] counter = 0;

always @(posedge CLK) begin
    if (!PU_IREF) begin
        counter <= 35;  /*Tcal + Trdy = 7us => 7 * 5 = 35*/
        RDY_IREF <= 0;
    end else if (counter > 0) begin
        if(CAL_IREF==1)begin
        counter <= counter - 1;
       end
    end else begin
        RDY_IREF <= 1;
    end
end
   
   
endmodule //IREF

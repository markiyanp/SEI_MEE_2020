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
   
   always@ (posedge CLK)
     begin
	if(CAL_IREF & PU_IREF)
	  begin
	     #9000
	     RDY_IREF<=1;
	  end
     end
   

   always@(posedge CLK or negedge PU_IREF)
     begin
	if(PU_IREF == 0)
	  begin
	     RDY_IREF<=0;
	  end
     end
   


endmodule //IREF

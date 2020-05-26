`timescale 1ns/1ps

module SYNT
  (
   input CLK,
   input CAL_SYNT,
   input PU_SYNT,
   output RDY_SYNT
   );

   reg    CAL_SYNT_STA=0;
   reg 	  RDY_SYNT=0;
   reg    AUX = 0;
   
   always@ (posedge CLK)
     begin
	if(CAL_SYNT & PU_SYNT)
	  begin
	     #14000
	     RDY_SYNT<=1;
	  end
     end
   

   always@ (posedge CLK or negedge PU_SYNT)
     begin
	if(PU_SYNT == 0)
	  begin
	     RDY_SYNT<=0;
	  end
     end   


endmodule //SYNT

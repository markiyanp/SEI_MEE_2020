`timescale 1ns/1ps

module BPF
  (
   input CLK,
   input CAL_BPF,
   input PU_BPF,
   output RDY_BPF
   );

   reg 	  RDY_BPF=0;
   reg    AUX = 0;
   
   always@ (posedge CLK)
     begin
	if(CAL_BPF & PU_BPF)
	  begin
	     #10000
	     RDY_BPF<=1;
	  end
     end
   

   always@ (posedge CLK or negedge PU_BPF)
     begin
	if(PU_BPF == 0)
	  begin
	     RDY_BPF<=0;
	  end
     end
   


endmodule //BPF

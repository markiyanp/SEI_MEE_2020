`timescale 1ns/1ps

module CTRL
  (
   input  CLK,
   input  PU_RX, 
   output RDY_RX
   );

   reg RDY_RX = 0;
   reg PU_IREF = 0;
   reg PU_BPF = 0;
   reg PU_SYNT = 0;
   reg CAL_SYNT = 0;
   reg CAL_IREF = 0;
   reg CAL_BPF = 0;
   
   wire RDY_IREF;
   wire RDY_BPF;
   wire RDY_SYNT;
   

   wire CAL_IREF_STA = 0;
   wire CAL_BPF_STA = 0;
   wire CAL_SYNT_STA = 0;

   reg TESTE;
   reg [32:0] counter = 0;

   
   IREF iref(
	     .CLK(CLK),
	     .CAL_IREF(CAL_IREF),
	     .PU_IREF(PU_IREF),
	     .RDY_IREF(RDY_IREF)
	    );

   SYNT synt(
	     .CLK(CLK),
	     .CAL_SYNT(CAL_SYNT),
	     .PU_SYNT(PU_SYNT),
	     .RDY_SYNT(RDY_SYNT)
	    );

   BPF bpf(
	     .CLK(CLK),
	     .CAL_BPF(CAL_BPF),
	     .PU_BPF(PU_BPF),
	     .RDY_BPF(RDY_BPF)
	    );
 
   always@ (posedge CLK or negedge PU_RX)
     begin
	if(PU_RX==0)
	  begin
	     counter<=10; /* 10 = 2us * 5 */
	     RDY_RX<=0;
	     CAL_IREF<=0;
	     CAL_SYNT<=0;
	     CAL_BPF<=0;
	     PU_IREF<=0;
	     PU_BPF<=0;
	     PU_SYNT<=0;
	  end
	else begin
	   PU_IREF<=1;
	   PU_BPF<=1;
	   PU_SYNT<=1;
	   if(counter > 0)begin
	      counter <= counter - 1;
	   end
	   else begin
	      CAL_IREF<=1;
	      CAL_BPF<=1;
	      CAL_SYNT<=1;
	   end
	end 

	if(RDY_IREF & RDY_SYNT & RDY_BPF)
	 begin
	    RDY_RX<=1;
	 end
     end
   
   
endmodule // CTRL

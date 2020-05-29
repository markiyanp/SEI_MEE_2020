`timescale 1ns/1ps

module CTRL
  (
   input  CLK,
   input  PU_RX, 
   output RDY_RX
   );

   reg RDY_RX;
   reg PU_IREF;
   reg PU_BPF;
   reg PU_SYNT;
   reg CAL_SYNT;
   reg CAL_IREF;
   reg CAL_BPF;
   
   wire RDY_IREF;
   wire RDY_BPF;
   wire RDY_SYNT;
   

   wire CAL_IREF_STA;
   wire CAL_BPF_STA;
   wire CAL_SYNT_STA;

   reg TESTE;
   reg [32:0] counter;

   
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
	//reset
	if(PU_RX==0)
	  begin
	     RDY_RX<=0;
	     CAL_IREF<=0;
	     CAL_SYNT<=0;
	     CAL_BPF<=0;
	     PU_IREF<=0;
	     PU_BPF<=0;
	     PU_SYNT<=0;
	  end
	//if not reset
	else begin
	   //power up all modules
	   PU_IREF<=1;
	   PU_BPF<=1;
	   PU_SYNT<=1;
	   
	  if(counter == 10)begin
	      CAL_IREF<=1;
	      CAL_BPF<=1;
	      CAL_SYNT<=1;
	  end

	   if(counter == 35)begin
	      CAL_IREF<=0;
	   end

	   if(counter == 40)begin
	      CAL_BPF<=0;
	   end

	   if(counter == 50)begin
	      CAL_SYNT<=0;
	   end
	   
	end 

	//checking if all modules ready
	if(RDY_IREF & RDY_SYNT & RDY_BPF)
	 begin
	    RDY_RX<=1;
	 end
     end // always@ (posedge CLK or negedge PU_RX)


   always@(posedge CLK) begin
      if(!PU_RX)begin
	 counter<=0;
      end
      else begin
	 counter <= counter + 1;
	 end
      end
   
   
endmodule // CTRL

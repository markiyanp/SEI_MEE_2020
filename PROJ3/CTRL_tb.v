`timescale 1ns /1ps

module CTRL_tb;
   reg CLK;
   reg PU_RX;
   wire RDY_RX;

   CTRL ctr(
	    .CLK(CLK),
	    .PU_RX(PU_RX),
	    .RDY_RX(RDY_RX)
	    );


   initial begin
           CLK=0;
           PU_RX=0;
           end
   


	initial begin 
		$dumpfile("top.vcd");
		$dumpvars();

	   #1000
	   
	   PU_RX=1;
	 
	   #25000

           PU_RX=0;

	   #10000

           PU_RX=1;

	   #20000	     
	     
       	   $finish;

	end

   always
      #100CLK=!CLK;
   
endmodule

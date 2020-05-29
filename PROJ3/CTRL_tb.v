`timescale 1ns /1ps

module CTRL_tb;
   reg CLK=0;
   reg PU_RX=0;
   wire RDY_RX;

   CTRL ctr(
	    .CLK(CLK),
	    .PU_RX(PU_RX),
	    .RDY_RX(RDY_RX)
	    );
   


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

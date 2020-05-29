`timescale 1ns/1ps

module SYNT
  (
   input CLK,
   input CAL_SYNT,
   input PU_SYNT,
   output RDY_SYNT
   );

   reg 	  RDY_SYNT;   
   reg [6:0] counter;

always @(posedge CLK) begin
    if (!PU_SYNT) begin
       counter <= 20;
        RDY_SYNT <= 0;
    end else if (counter > 0) begin
       if(CAL_SYNT==0)begin
        counter <= counter - 1;
       end
    end else begin
        RDY_SYNT <= 1;
    end
end


endmodule //SYNT

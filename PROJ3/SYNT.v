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
   
   reg [32:0] counter = 0;

always @(posedge CLK) begin
    if (!PU_SYNT) begin
        counter <= 60;  /*Tcal + Trdy = 12us => 12 * 5 = 60*/
        RDY_SYNT <= 0;
    end else if (counter > 0) begin
       if(CAL_SYNT==1)begin
        counter <= counter - 1;
       end
    end else begin
        RDY_SYNT <= 1;
    end
end


endmodule //SYNT

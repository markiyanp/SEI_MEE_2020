top: CTRL.v IREF.v SYNT.v BPF.v CTRL_tb.v
	iverilog -o top CTRL.v IREF.v SYNT.v BPF.v CTRL_tb.v  
	./top

clean: 
	rm -f top *~ *.vcd

.PHONY: clean all

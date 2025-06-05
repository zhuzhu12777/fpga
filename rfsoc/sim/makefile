# Vivado Simulator

TOP ?= top
DUT = crossbar
WAVE_FILE = $(DUT)_wave.vcd

FILE_LIST = run.f

all: com sim

pre:
	xvlog --incr --sv -f share.f -log log/xvlog_pre.log

com:
	xvlog --incr --sv -f $(FILE_LIST) -log log/xvlog_$(DUT).log
	xelab --incr -debug typical $(TOP) -s $(TOP)_sim -log log/xelab_$(DUT).log

sim:
	xsim $(TOP)_sim --t run.tcl --testplusarg $(WAVE_FILE) -log log/xsim_$(DUT).log

clean:
	rm -rf log/*.log *.jou *.pb *.wdb *.vcd
	rm -rf xsim.dir/$(TOP)_sim .Xil

view:
	gtkwave $(WAVE_FILE) &


.PHONY: pre com sim clean view
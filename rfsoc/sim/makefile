# Vivado Simulator
XILINX_TOOL_PATH = /d/Xilinx/Vivado/2024.2/bin
XILINX_DATA_PATH = /d/Xilinx/Vivado/2024.2/data
XILINX_IP_PATH = /d/mydata/git_resp/rfsoc/rfsoc.gen/sources_1/ip

TOP ?= top
DUT = adc_data_path
WAVE_FILE = $(DUT)_wave.vcd

FILE_LIST = run.f

all: com sim

pre:
	$(XILINX_TOOL_PATH)/xvlog --incr --sv -f share.f -log log/xvlog_pre.log

com:
	$(XILINX_TOOL_PATH)/xvlog --incr --sv -f $(FILE_LIST) -log log/xvlog_$(DUT).log
	$(XILINX_TOOL_PATH)/xelab --incr -debug typical $(TOP) -s $(TOP)_sim -log log/xelab_$(DUT).log

sim:
	$(XILINX_TOOL_PATH)/xsim $(TOP)_sim --t run.tcl --testplusarg $(WAVE_FILE) -log log/xsim_$(DUT).log

clean:
	rm -rf log/*.log *.jou *.pb *.wdb *.vcd
	rm -rf xsim.dir/$(TOP)_sim .Xil

view:
	gtkwave $(WAVE_FILE) &


.PHONY: pre com sim clean view
RTL_COMPILE_OUTPUT 	= $(TOY_SCALAR_PATH)/work/rtl_compile
RTL_COMPILE_OUTPUT_NOICACHE 	= $(TOY_SCALAR_PATH)/work/rtl_compile_noicache

TIMESTAMP			= $(shell date +%Y%m%d_%H%M_%S)
GIT_REVISION 		= $(shell git show -s --pretty=format:%h)
.PHONY: compile lint

compile:
	mkdir -p $(RTL_COMPILE_OUTPUT)
	cd $(RTL_COMPILE_OUTPUT) ;vcs -kdb -full64 -debug_access -sverilog -f $(SIM_FILELIST) +lint=PCWM +lint=TFIPC-L +define+TOY_SIM
compile_debug:
	mkdir -p $(RTL_COMPILE_OUTPUT)
	cd $(RTL_COMPILE_OUTPUT) ;vcs -kdb -full64 -debug_access -sverilog -f $(SIM_FILELIST) +lint=PCWM +lint=TFIPC-L +define+TOY_SIM+DEBUG

icache_compile:
	mkdir -p $(RTL_COMPILE_OUTPUT)
	cd $(RTL_COMPILE_OUTPUT) ;vcs -kdb -full64 -debug_access -sverilog -f $(SIM_FILELIST_ICACHE) +lint=PCWM +lint=TFIPC-L +define+TOY_SIM
#	cd $(RTL_COMPILE_OUTPUT) ;vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed -kdb -lca -full64 -debug_access -sverilog -f $(SIM_FILELIST_ICACHE) +lint=PCWM +lint=TFIPC-L +define+TOY_SIM

# for ssh
icache_comp: 
	mkdir -p $(RTL_COMPILE_OUTPUT)
	cd $(RTL_COMPILE_OUTPUT) ;vcs -kdb -full64 -debug_access -sverilog -f $(SIM_FILELIST_ICACHE) +lint=PCWM +lint=TFIPC-L +define+TOY_SIM

# wsl compile
comp:
	mkdir -p $(RTL_COMPILE_OUTPUT)
	cd $(RTL_COMPILE_OUTPUT) ;vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed -kdb -lca -full64 -debug_access -sverilog -f $(SIM_FILELIST) +lint=PCWM +lint=TFIPC-L +define+TOY_SIM+WSL

lint:
	fde -file $(TOY_SCALAR_PATH)/qc/lint.tcl -flow lint

isa:
	cd ./rv_isa_test/build ;ctest -j64


dhry:
	${RTL_COMPILE_OUTPUT}/simv +HEX=$(TOY_SCALAR_PATH)/rv_isa_test/dhry/dhrystone_itcm.hex +DATA_HEX=$(TOY_SCALAR_PATH)/rv_isa_test/dhry/dhrystone_dtcm.hex +TIMEOUT=200000 +WAVE +PC=pc_trace.log +REG_TRACE=reg_trace.log +FETCH=fetch.log| tee benchmark_output/dhry/$(TIMESTAMP)_$(GIT_REVISION).log

dhry_noicache:
	${RTL_COMPILE_OUTPUT_NOICACHE}/simv +HEX=${RV_TEST_PATH}/hello_world/build/dhrystone_itcm.hex +DATA_HEX=${RV_TEST_PATH}/hello_world/build/dhrystone_dtcm.hex +TIMEOUT=200000 +WAVE +PC=pc_trace_noicache.log | tee benchmark_output/dhry/$(GIT_REVISION)_$(TIMESTAMP).log

dhry_test:
	${RTL_COMPILE_OUTPUT}/simv +HEX=$(TOY_SCALAR_PATH)/rv_isa_test/dhry/dhrystone_itcm1000.hex +DATA_HEX=$(TOY_SCALAR_PATH)/rv_isa_test/dhry/dhrystone_dtcm1000.hex +TIMEOUT=2000000 | tee benchmark_output/dhry/$(TIMESTAMP)_$(GIT_REVISION).log
mul_test:
	${RTL_COMPILE_OUTPUT}/simv +HEX=../baremetal_hello_world/test/csr/build/toy_bm/csr.itcm.hex +DATA_HEX=../baremetal_hello_world/test/csr/build/toy_bm/csr.dtcm.hex +TIMEOUT=2000000 +WAVE | tee benchmark_output/dhry/$(TIMESTAMP)_$(GIT_REVISION).log



cm:
	${RTL_COMPILE_OUTPUT}/simv +HEX=$(TOY_SCALAR_PATH)/rv_isa_test/cm/coremark_itcm.hex +DATA_HEX=$(TOY_SCALAR_PATH)/rv_isa_test/cm/coremark_dtcm.hex  +TIMEOUT=0 +PC=pc_trace.log | tee benchmark_output/cm/$(TIMESTAMP)_$(GIT_REVISION).log
cm_test:
	${RTL_COMPILE_OUTPUT}/simv +HEX=/data/usr/huangt/hello_world_ht/toy_bm/coremark_itcm.hex +DATA_HEX=/data/usr/huangt/hello_world_ht/toy_bm/coremark_dtcm.hex  +TIMEOUT=0 +PC=pc_trace.log | tee benchmark_output/cm/$(TIMESTAMP)_$(GIT_REVISION).log
cm_backup:
	${RTL_COMPILE_OUTPUT}/simv  +HEX=$(TOY_SCALAR_PATH)/rv_isa_test/dhry/coremark_itcm_1000.hex +DATA_HEX=$(TOY_SCALAR_PATH)/rv_isa_test/dhry/coremark_dtcm_1000.hex  +TIMEOUT=0 | tee benchmark_output/cm/$(TIMESTAMP)_$(GIT_REVISION).log

verdi:
	verdi -sv -f $(SIM_FILELIST) -ssf wave.fsdb -dbdir $(RTL_COMPILE_OUTPUT)/simv.daidir
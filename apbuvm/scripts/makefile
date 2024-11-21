help:
	@echo "======================================================================";
	@echo "Usage:"; 
	@echo "  > make regress          - run all tests & generate summary";
	@echo "  > make test_index       - run individual test [see list below]";
	@echo "  > make clean            - run CLEAN script";
	@echo "  > make summary          - run generate_summary.py  loads each test result into summary.text gives report as PASS or FAIL";
	@echo "    -----------------------------------------";
	@echo "    test_index      test_name";
	@echo "    -----------------------------------------";
	@echo "    1              test";
	@echo "    2              test_error";
	@echo "    3              test_single_write_read";
	@echo "    4              test_even_write_read";
	@echo "    5              test_odd_write_read";
	@echo "    6              test_multi_slve_on";
	@echo "    7              test_full_write_read";
	@echo "======================================================================";

compile:
	vlog ../top/top.sv +acc

all_test: test test_error test_single_write_read test_even_write_read test_odd_write_read test_multi_slve_on test_full_write_read 

test: compile
	vsim top -assertdebug  +r=20 +UVM_TESTNAME=$@ -do "add wave /top/dut/*;  add wave /top/indut/*; add wave /top/inbfm/*;  add wave /top/bfm/*; \
	add wave /top/as/ass1;  add wave /top/as/ass2; add wave  /top/as/ass3; add wave /top/as/ass4; add wave /top/as/ass5; add wave /top/as/ass6 ; \
	add wave /top/as/ass7; add wave /top/as/ass8; add wave /top/as/ass9; add wave /top/as/ass10; run -all; write transcript $@.log;"

test_error: compile
	vsim top -assertdebug  +r=2 +UVM_TESTNAME=$@ -do "add wave /top/dut/*;  add wave /top/indut/*; add wave /top/inbfm/*;  add wave /top/bfm/*; \
	add wave /top/as/ass1;  add wave /top/as/ass2; add wave  /top/as/ass3; add wave /top/as/ass4; add wave /top/as/ass5; add wave /top/as/ass6 ; \
	add wave /top/as/ass7; add wave /top/as/ass8; add wave /top/as/ass9; add wave /top/as/ass10; run -all; write transcript $@.log;"

test_single_write_read: compile
	vsim top -assertdebug +r=2 +UVM_TESTNAME=$@ -do "add wave /top/dut/*;  add wave /top/indut/*; add wave /top/inbfm/*;  add wave /top/bfm/*; \
	add wave /top/as/ass1;  add wave /top/as/ass2; add wave  /top/as/ass3; add wave /top/as/ass4; add wave /top/as/ass5; add wave /top/as/ass6 ; \
	add wave /top/as/ass7; add wave /top/as/ass8; add wave /top/as/ass9; add wave /top/as/ss10; run -all; write transcript $@.log;"

test_even_write_read: compile
	vsim top -assertdebug +r=20 +UVM_TESTNAME=$@ -do "add wave /top/dut/*;  add wave /top/indut/*; add wave /top/inbfm/*;  add wave /top/bfm/*; \
	add wave /top/as/ass1;  add wave /top/as/ass2; add wave  /top/as/ass3; add wave /top/as/ass4; add wave /top/as/ass5; add wave /top/as/ass6 ; \
	add wave /top/as/ass7; add wave /top/as/ass8; add wave /top/as/ass9; add wave /top/as/ass10; run -all; write transcript $@.log;"

test_odd_write_read: compile
	vsim top -assertdebug  +r=20 +UVM_TESTNAME=$@ -do "add wave /top/dut/*;  add wave /top/indut/*; add wave /top/inbfm/*;  add wave /top/bfm/*; \
	add wave /top/as/ass1;  add wave /top/as/ass2; add wave  /top/as/ass3; add wave /top/as/ass4; add wave /top/as/ass5; add wave /top/as/ass6 ; \
	add wave /top/as/ass7; add wave /top/as/ass8; add wave /top/as/ass9; add wave /top/as/ass10; run -all; write transcript $@.log;"

test_multi_slve_on: compile
	vsim top -assertdebug  +r=20 +UVM_TESTNAME=$@ -do "add wave /top/dut/*;  add wave /top/indut/*; add wave /top/inbfm/*;  add wave /top/bfm/*; \
	add wave /top/as/ass1;  add wave /top/as/ass2; add wave  /top/as/ass3; add wave /top/as/ass4; add wave /top/as/ass5; add wave /top/as/ass6 ; \
	add wave /top/as/ass7; add wave /top/as/ass8; add wave /top/as/ass9; add wave /top/as/ass10; run -all; write transcript $@.log;"

test_full_write_read: compile
	vsim top -assertdebug +r=512 +UVM_TESTNAME=$@ -do "add wave /top/dut/*;  add wave /top/indut/*; add wave /top/inbfm/*;  add wave /top/bfm/*; \
	add wave /top/as/ass1;  add wave /top/as/ass2; add wave  /top/as/ass3; add wave /top/as/ass4; add wave /top/as/ass5; add wave /top/as/ass6 ; \
	add wave /top/as/ass7; add wave /top/as/ass8; add wave /top/as/ass9; add wave /top/as/ass10; run -all; write transcript $@.log;"


regress:  all_test summary

summary:
	python generate_summary.py

clean:
	@if exist work (rmdir /s /q work) 
	@del /q transcript vsim.wlf *.log modelsim.ini summary.txt 2>nul

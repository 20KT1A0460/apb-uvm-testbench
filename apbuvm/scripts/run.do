    vlog ../top/top.sv +acc
    vsim -assertdebug top   +r=20  +UVM_TESTNAME=test   
    add wave /top/dut/* /top/indut/* /top/inbfm/* /top/bfm/*
    add wave /top/as/ass1 /top/as/ass2 /top/as/ass3  /top/as/ass4 /top/as/ass5  /top/as/ass6 /top/as/ass7  /top/as/ass8  /top/as/ass9 
    add wave /top/as/ass10
    run -all
                
                

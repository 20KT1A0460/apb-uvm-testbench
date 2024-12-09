# apb-uvm-testbench
apb master slave testbench in uvm....
it consits of  7 test cases ,7 sequence items .....
makefile  for compile and simulation  and aslo do regaress test .....
python file for summary as pass or file  .....
all are under questa sim  


RTL and testbench: 

*****************************************************
rtl:
apbbridge -> apbmaster
          -> slave1  slave2 slave3  slave4 (all are rams only)
****
features:
    * only single slave asserted at atime .
    *slveeror generation as paddr<locations of memory
    *32bit and 256 location memory.
*******************************************************
testbench:
  features:
    *uvm testbench
    *reporting 
    *regress testing by makefile
    * 10 assertions 
    * 10 coverages as coverpoints and cross cover
    *verification plane
    * 7 test cases  & all  are override by uvm factroy
    * 7 sequence_item and all are override by uvm factroy
    
    
    
      

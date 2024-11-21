  class seq_item extends uvm_sequence_item;
      
       bit PCLK ,PRESETn;
       randc bit [31:0] data;
       randc bit [31:0] addr;
       bit write, enable, sel1, sel2, sel3, sel4;
       bit [31:0] PRDATA;
       bit PREADY;
       bit PSLVERR;
     
      constraint addr_con{addr inside {[100:109]};}
      constraint data_con {data inside {[200:209]};}
     

     
     `uvm_object_utils_begin(seq_item)
     
      `uvm_field_int(PCLK,UVM_ALL_ON|UVM_DEC)
      `uvm_field_int(PRESETn,UVM_ALL_ON|UVM_DEC)
      `uvm_field_int(data,UVM_ALL_ON|UVM_DEC)
      `uvm_field_int(addr,UVM_ALL_ON|UVM_DEC)
      `uvm_field_int(write,UVM_ALL_ON|UVM_DEC)
      `uvm_field_int(enable,UVM_ALL_ON|UVM_DEC)
     `uvm_field_int(sel1,UVM_ALL_ON|UVM_DEC)
     `uvm_field_int(sel2,UVM_ALL_ON|UVM_DEC)
     `uvm_field_int(sel3,UVM_ALL_ON|UVM_DEC)
     `uvm_field_int(sel4,UVM_ALL_ON|UVM_DEC)
     `uvm_field_int(PRDATA,UVM_ALL_ON|UVM_DEC)
     `uvm_field_int(PREADY,UVM_ALL_ON|UVM_DEC)
     `uvm_field_int(PSLVERR,UVM_ALL_ON|UVM_DEC)
     `uvm_object_utils_end

     function new(string en="");
     super.new(en);
     endfunction
     
 endclass


      

      
   
    
     
     
     
    




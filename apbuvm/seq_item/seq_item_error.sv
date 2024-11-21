
  class seq_item_error extends seq_item;
      
      constraint addr_con{addr==260;}
      constraint data_con {data==350;}
     

     
     `uvm_object_utils(seq_item_error)

     function new(string en="");
     super.new(en);
     endfunction
     
   endclass



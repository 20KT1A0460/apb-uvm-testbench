 class seq_item_multi_slve_write_read extends seq_item;
     
      constraint addr_con{ addr inside {[200:203]};}
      constraint data_con {data inside {[100:103]};}

     `uvm_object_utils(seq_item_multi_slve_write_read)

      

     function new(string en="");
     super.new(en);
     endfunction
     
 endclass


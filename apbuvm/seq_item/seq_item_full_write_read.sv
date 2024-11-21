 
 class seq_item_full_write_read extends seq_item;
     
      constraint addr_con{ addr inside{[0:255]};}
      constraint data_con {data inside {[100:1000]};}

     `uvm_object_utils(seq_item_full_write_read)

      

     function new(string en="");
     super.new(en);
     endfunction
     
 endclass


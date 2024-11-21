
  class seq_item_even_write_read extends seq_item;
      
      constraint addr_con{addr%2==0 && addr inside{[100:116]};}
      constraint data_con {data inside {[200:209]};}

     `uvm_object_utils(seq_item_even_write_read)

     function new(string en="");
     super.new(en);
     endfunction
     
  endclass



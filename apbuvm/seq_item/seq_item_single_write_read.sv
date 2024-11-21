 class seq_item_single_write_read extends seq_item;
      
      constraint addr_con{addr==100;}
      constraint data_con {data==350;}

     `uvm_object_utils(seq_item_single_write_read)

     function new(string en="");
     super.new(en);
     endfunction
     
 endclass



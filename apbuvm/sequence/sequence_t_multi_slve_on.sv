 class sequence_t_multi_slve_on extends sequence_t;
  `uvm_object_utils(sequence_t_multi_slve_on)
   seq_item sq;
   int r;
     
   function new(string en="");
     super.new(en);
   endfunction

   task body();
     sq=seq_item::type_id::create("sq");
     uvm_config_db#(int)::get(null,"","randvalue",r);
     start_item(sq);
     sq.write=0;
     sq.enable=0;
     finish_item(sq);
     #10;
     start_item(sq);
     sq.write=1;
     {sq.sel1,sq.sel2,sq.sel3,sq.sel4}=4'b1111;
     sq.enable=0;
     finish_item(sq);
     #10;
     start_item(sq);
     sq.enable=1;
     finish_item(sq);
     #10;
     repeat(r-(r/2))begin
       start_item(sq);
       sq.randomize();
       finish_item(sq);
        #10;
     end
     #10;
     start_item(sq);
     sq.write<=0;
     finish_item(sq);
     #10;
     repeat(r-(r/2))begin
        start_item(sq);
        sq.data.rand_mode(0);
        sq.randomize();
        finish_item(sq);
        #10;
     end
   endtask  

 endclass





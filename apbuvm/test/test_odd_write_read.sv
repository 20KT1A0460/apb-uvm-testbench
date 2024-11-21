  class test_odd_write_read extends uvm_test;
     `uvm_component_utils(test_odd_write_read)
     sequence_t seq;
     env ev;
     function new(string en="",uvm_component pa);
     super.new(en,pa);
     endfunction

     function void build_phase(uvm_phase phase);
     seq=sequence_t::type_id::create("seq");
     ev=env::type_id::create("ev",this);
     endfunction

     task run_phase(uvm_phase phase);
     factory.set_type_override_by_type(seq_item::get_type(),seq_item_odd_write_read::get_type(),1);
     phase.raise_objection(this);
      seq.start(ev.ag1.sqr);
       #100;
     phase.drop_objection(this);
     endtask
     
    endclass



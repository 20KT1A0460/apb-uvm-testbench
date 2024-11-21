 class test_multi_slve_on extends uvm_test;
     `uvm_component_utils(test_multi_slve_on)
     sequence_t seq;
     env ev;
     function new(string en="",uvm_component pa);
     super.new(en,pa);
     endfunction

     function void build_phase(uvm_phase phase);
         ev=env::type_id::create("ev",this);
     endfunction

     task run_phase(uvm_phase phase);
     factory.set_type_override_by_type(seq_item::get_type(),seq_item_multi_slve_on::get_type(),1);

     factory.set_type_override_by_type(sequence_t::get_type(),sequence_t_multi_slve_on::get_type(),1);
      seq=sequence_t::type_id::create("seq");

     phase.raise_objection(this);
      seq.start(ev.ag1.sqr);
       #100;
     phase.drop_objection(this);
     endtask
     
    endclass


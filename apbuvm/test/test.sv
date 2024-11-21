    class test extends uvm_test;
     `uvm_component_utils(test)
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
     phase.raise_objection(this);
      seq.start(ev.ag1.sqr);
    // uvm_config_db#(uvm_object_wrapper)::set(this,"*.sqr.run_phase","default_sequence",sequence_t::type_id::get());
       #100;
     phase.drop_objection(this);
     endtask
     
    endclass


   

    

  

  
       
        

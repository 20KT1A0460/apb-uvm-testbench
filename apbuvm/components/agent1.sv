    class agent1 extends uvm_agent;
     `uvm_component_utils(agent1)
     sequencer sqr;
     driver dr;
     imonitor inm;
     function new(string en="",uvm_component pa);
     super.new(en,pa);
     endfunction

     function void build_phase(uvm_phase phase);
     sqr=sequencer::type_id::create("sqr",this);
     dr=driver::type_id::create("dr",this);
     inm=imonitor::type_id::create("inm",this);
     endfunction

     function void connect_phase(uvm_phase phase);
     dr.seq_item_port.connect(sqr.seq_item_export);
     endfunction
     
    endclass


class agent2 extends uvm_agent;
     `uvm_component_utils(agent2)
     
      omonitor om;
      
     function new(string en="",uvm_component pa);
     super.new(en,pa);
     endfunction

     function void build_phase(uvm_phase phase);
     om=omonitor::type_id::create("om",this);
     endfunction


     
    endclass


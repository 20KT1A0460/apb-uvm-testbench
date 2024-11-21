     class sequencer extends uvm_sequencer#(seq_item);
     `uvm_component_utils(sequencer)
     
     function new(string en="",uvm_component pa);
     super.new(en,pa);
     endfunction
     
    endclass

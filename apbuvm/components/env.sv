    class env extends uvm_env;
     `uvm_component_utils(env)
       agent1 ag1;
       agent2 ag2;
       scoreboard scr;
       subscriber sub;
     
     function new(string en="",uvm_component pa);
     super.new(en,pa);
     endfunction

     function void build_phase(uvm_phase phase);
     ag1=agent1::type_id::create("ag1",this);
     ag2=agent2::type_id::create("ag2",this);
     scr=scoreboard::type_id::create("scr",this);
     sub=subscriber::type_id::create("sub",this);
     endfunction

     function void connect_phase(uvm_phase phase);
     ag1.inm.apb_in.connect(scr.sc_in);
     ag1.inm.apb_in.connect(sub.analysis_export);
     ag2.om.apb_out.connect(scr.sc_out);
     endfunction
     
    endclass


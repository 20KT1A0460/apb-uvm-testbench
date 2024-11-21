     class driver extends uvm_driver #(seq_item);
     `uvm_component_utils(driver)
     seq_item sq;
     int c;
     virtual interfdut indut;
     virtual interfbfm  inbfm;
     function new(string en="",uvm_component pa);
     super.new(en,pa);
     endfunction

     function void build_phase(uvm_phase phase);
     sq=seq_item::type_id::create("sq");
     uvm_config_db#(virtual interfdut)::get(this,"","interfacedut",indut);
     uvm_config_db#(virtual interfbfm)::get(this,"","interfacebfm",inbfm);
     endfunction

     task run_phase(uvm_phase phase);
     forever begin
       seq_item_port.get_next_item(sq);

       indut.data   <= sq.data;
       indut.addr   <= sq.addr;
       indut.write  <= sq.write;
       indut.enable <= sq.enable;

       indut.sel1   <= sq.sel1;
       indut.sel2   <= sq.sel2;
       indut.sel3   <= sq.sel3;
       indut.sel4   <= sq.sel4;

       inbfm.data   <= sq.data;
       inbfm.addr   <= sq.addr;
       inbfm.write  <= sq.write;
       inbfm.enable <= sq.enable;

       inbfm.sel1   <= sq.sel1;
       inbfm.sel2   <= sq.sel2;
       inbfm.sel3   <= sq.sel3;
       inbfm.sel4   <= sq.sel4;
      
        c<=c+1;
        uvm_report_info(get_type_name(),$sformatf("driver_packet_no:=%d",c));
        sq.print();
       seq_item_port.item_done();
     end
     endtask
     
    endclass


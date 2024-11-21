    class omonitor extends uvm_monitor;
     `uvm_component_utils(omonitor)
      int c;
      seq_item spout;
      virtual interfbfm inbfm;
      uvm_analysis_port#(seq_item) apb_out;
     function new(string en="",uvm_component pa);
     super.new(en,pa);
     apb_out=new("apb_out",this);
     endfunction

     function void build_phase(uvm_phase phase);
        spout=seq_item::type_id::create("spout");
        uvm_config_db#(virtual interfbfm)::get(this,"","interfacebfm",inbfm);
     endfunction

     task run_phase(uvm_phase phase);
       forever begin
       @(inbfm.data,inbfm.addr,inbfm.write,inbfm.enable,inbfm.sel1,inbfm.sel2,inbfm.sel3,inbfm.sel4);

          spout.PCLK      <= inbfm.PCLK;
          spout.PRESETn   <= inbfm.PRESETn;
          spout.data      <= inbfm.data;
          spout.addr      <= inbfm.addr;
          spout.write     <= inbfm.write;
          spout.enable    <= inbfm.enable;
          spout.sel1      <= inbfm.sel1;
          spout.sel2      <= inbfm.sel2;
          spout.sel3      <= inbfm.sel3;
          spout.sel4      <= inbfm.sel4;
          spout.PRDATA    <= inbfm.PRDATA;
          spout.PREADY    <= inbfm.PREADY;
          spout.PSLVERR   <= inbfm.PSLVERR;
              c<=c+1;
        uvm_report_info(get_type_name(),$sformatf("omonitor_packet_no:=%d",c));
        spout.print();
        apb_out.write(spout);
       end
     endtask
     
    endclass

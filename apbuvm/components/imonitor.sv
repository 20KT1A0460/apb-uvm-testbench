     class imonitor extends uvm_monitor;
     `uvm_component_utils(imonitor)
      int c;
      seq_item spin;
      virtual interfdut indut;
      
      uvm_analysis_port #(seq_item) apb_in;

     function new(string en="",uvm_component pa);
     super.new(en,pa);
     apb_in=new("apb_in",this);
     endfunction

     function void build_phase(uvm_phase phase);
        spin=seq_item::type_id::create("spin");
        uvm_config_db#(virtual interfdut)::get(this,"","interfacedut",indut);
     endfunction

     task run_phase(uvm_phase phase);
       forever begin
       @(indut.data,indut.addr,indut.write,indut.enable,indut.sel1,indut.sel2,indut.sel3,indut.sel4);
        spin.PCLK      <= indut.PCLK;
        spin.PRESETn   <= indut.PRESETn;
        spin.data      <= indut.data;
        spin.addr      <= indut.addr;
        spin.write     <= indut.write;
        spin.enable    <= indut.enable;
        spin.sel1      <= indut.sel1;
        spin.sel2      <= indut.sel2;
        spin.sel3      <= indut.sel3;
        spin.sel4      <= indut.sel4;
        spin.PRDATA    <= indut.PRDATA;
        spin.PREADY    <= indut.PREADY;
        spin.PSLVERR   <= indut.PSLVERR;
               c<=c+1;
        uvm_report_info(get_type_name(),$sformatf("imonitor_packet_no:=%d",c));
        spin.print();
        apb_in.write(spin);
       end
     endtask
     
    endclass

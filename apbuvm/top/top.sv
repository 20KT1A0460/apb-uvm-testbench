  
 `include "uvm_macros.svh"
  import uvm_pkg::*;

`include "../packeg/apbpackage.sv"
 import uvm_venkatesh_package::*;

    module top;
        parameter width=32;
        parameter locations=256;
         bit PCLK,PRESETn;

        interfdut #(width) indut(PCLK,PRESETn);
        interfbfm #(width) inbfm(PCLK,PRESETn);

        apb_bridge #(width,locations) dut(.PCLK(indut.PCLK),.PRESETn(indut.PRESETn),.data(indut.data),.addr(indut.addr),.write(indut.write),
        .enable(indut.enable),.sel1(indut.sel1),.sel2(indut.sel2),.sel3(indut.sel3),.sel4(indut.sel4),.PRDATA(indut.PRDATA),.PREADY(indut.PREADY)        ,.PSLVERR(indut.PSLVERR));

        apb_bridge #(width,locations) bfm(.PCLK(inbfm.PCLK),.PRESETn(inbfm.PRESETn),.data(inbfm.data),.addr(inbfm.addr),.write(inbfm.write),
         .enable(inbfm.enable),.sel1(inbfm.sel1),.sel2(inbfm.sel2),.sel3(inbfm.sel3),.sel4(inbfm.sel4),.PRDATA(inbfm.PRDATA),
         .PREADY(inbfm.PREADY),.PSLVERR(inbfm.PSLVERR));

         ass as(indut);

        int r;

       always #5 PCLK=~PCLK;
       initial begin
       PCLK=1;
       PRESETn=0;
       #10;
       PRESETn=1;
       end
     
      initial run_test("");

      initial uvm_config_db#(virtual interfdut)::set(uvm_root::get(),"*","interfacedut",indut);

      initial  uvm_config_db#(virtual interfbfm)::set(uvm_root::get(),"*","interfacebfm",inbfm);

       

      initial begin 

      $value$plusargs("r=%d", r);

      uvm_config_db#(int)::set(null,"","randvalue",r);

      uvm_config_db#(int)::set(uvm_root::get(),"*.scr","randvalue",r);
      end
   endmodule

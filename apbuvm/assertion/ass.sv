  module ass(interfdut in);

     property p1;
      @(posedge in.PCLK) disable iff(!in.PRESETn) in.enable |->(in.addr inside {[32'h0:32'hffffffff]})  ;
     endproperty

     property p2;
      @(posedge in.PCLK) disable iff(!in.PRESETn) !in.write |-> (in.PRDATA inside {[32'h0:32'hffffffff]}) ;
     endproperty

     property p3;
       @(posedge in.PCLK) disable iff(!in.PRESETn) (in.write |-> (in.data inside {[32'h0:32'hffffffff]}));
     endproperty
    property p4;
      @(posedge in.PCLK) disable iff(!in.PRESETn) in.write |->##2 in.enable ;
    endproperty

     property p5;
       @(posedge in.PCLK) disable iff(!in.PRESETn) (in.write|-> ( {in.sel1,in.sel2,in.sel3,in.sel4} inside {1,2,4,8}));
     endproperty

     property p6;
       @(posedge in.PCLK) disable iff(!in.PRESETn) in.enable |-> ##1 in.PREADY ;
     endproperty

     property p7;
       @(posedge in.PCLK) disable iff(!in.PRESETn) in.enable |-> !in.PSLVERR ;
     endproperty

     property p8;
        @(posedge in.PCLK) ( {!{in.sel1,in.sel2,in.sel3,in.sel4},!{in.write,in.enable}} |-> ##1 {{in.sel1,in.sel2,in.sel3,in.sel4},{in.write,!in.          enable}} |-> ##1 {{in.sel1,in.sel2,in.sel3,in.sel4},{in.write,in.enable}});
     endproperty

     property p9;
       @(posedge in.PCLK) disable iff(in.PRESETn) !in.PRESETn |->{!{in.sel1,in.sel2,in.sel3,in.sel4},!{in.write,in.enable},!{in.addr,in.data}} ;
     endproperty

     property p10;
      @(posedge in.PCLK)  disable iff(!in.PRESETn) (!in.write |-> (in.PRDATA inside {[32'h0:32'hffffffff]}));
     endproperty

     ass1: assert property(p1);
     ass2: assert property(p2);
     ass3: assert property(p3);
     ass4: assert property(p4);
     ass5: assert property(p5);
     ass6: assert property(p6);
     ass7: assert property(p7);
     ass8: assert property(p8);
     ass9: assert property(p9);
     ass10: assert property(p10);


     endmodule


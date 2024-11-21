 interface interfdut#(parameter width =32) (input PCLK ,PRESETn );
    logic [width-1:0] data;
    logic [width-1:0] addr;
    logic write, enable, sel1, sel2, sel3, sel4;
    logic [width-1:0] PRDATA;
    logic PREADY;
    logic PSLVERR;
endinterface 

interface interfbfm #(parameter width=32) (input PCLK ,PRESETn );
    logic [width-1:0] data;
    logic [width-1:0] addr;
    logic write, enable, sel1, sel2, sel3, sel4;
    logic [width-1:0] PRDATA;
    logic PREADY;
    logic PSLVERR;
endinterface 



     class subscriber extends uvm_subscriber#(seq_item);
     `uvm_component_utils(subscriber)
     
       seq_item sq;
        
      covergroup cv1 ;
      addr_cov:coverpoint sq.addr {bins b1 ={32'h0,32'hffffffff};
                                 bins b2 ={[32'h0:32'hffffffff]};}
      endgroup

     covergroup cv2 ;
     data_cov:coverpoint sq.data {bins b1 ={32'h0,32'hffffffff};
                                 bins b2 ={[32'h0:32'hffffffff]};}
     endgroup
    
     covergroup cv3 ;
     write_cov:coverpoint sq.write {bins b1 ={0};
                                   bins b2 ={1};}
     endgroup

      covergroup cv4 ;
      enable_cov:coverpoint sq.enable {bins b1 ={0};
                                 bins b2 ={1};}
     endgroup
      
    covergroup cv5 ;
     sel_cov:coverpoint {sq.sel1,sq.sel2,sq.sel3,sq.sel4} {bins b1 ={1,2,4,8};}
    endgroup

    covergroup cv6 ;
      ready_cov:coverpoint sq.PREADY {bins b1 ={0};
                                     bins b2 ={1};}
     endgroup
     
     covergroup cv7 ;
      slverr_cov:coverpoint sq.PSLVERR {bins b1 ={0};
                                       bins b2 ={1};}
     endgroup
      

     covergroup cv8 ;
      reset_cov:coverpoint sq.PRESETn {bins b1 ={0};
                                 bins b2 ={1};}
     endgroup
      
     covergroup cv9 ;
      cross1_cov:cross sq.write,sq.enable;
      cross2_cov:cross sq.enable,sq.PREADY ;
     endgroup
          

     function new(string en="",uvm_component pa);
     super.new(en,pa);
     cv1=new();cv2=new();cv3=new();cv4=new();cv5=new();cv6=new();cv7=new();cv8=new();cv9=new();
     endfunction
     
     function void write (seq_item t);
         sq=t;
         cv1.sample(); cv2.sample(); cv3.sample();cv4.sample();cv5.sample(); cv6.sample();cv7.sample(); cv8.sample(); cv9.sample();
     endfunction


    
     endclass


     class scoreboard extends uvm_scoreboard;
     `uvm_component_utils(scoreboard)
     seq_item sq1,sq2;
     `uvm_analysis_imp_decl(_1)
     `uvm_analysis_imp_decl(_2)
     uvm_analysis_imp_1#(seq_item,scoreboard) sc_in;
     uvm_analysis_imp_2#(seq_item,scoreboard) sc_out;
     uvm_tlm_analysis_fifo #(seq_item) f1;
     uvm_tlm_analysis_fifo #(seq_item) f2;
    
     int pass,fail;
     int random;
     string result;
     function new(string en="",uvm_component pa);
     super.new(en,pa);
     sc_in=new("sc_in",this);
     sc_out=new("sc_out",this);
     f1=new("f1",this);
     f2=new("f2",this);
     endfunction

     function void build_phase(uvm_phase phase);
     sq1=seq_item::type_id::create("sq1");
     sq2=seq_item::type_id::create("sq2");
     uvm_config_db#(int)::get(this,"","randvalue",random);
     endfunction
     
     task write_1(seq_item se);
     f1.write(se);
     endtask
     task write_2(seq_item se1);
     f2.write(se1);
     endtask

     task run_phase(uvm_phase phase);
     forever begin
     f1.get(sq1);
     f2.get(sq2);
     if(sq1.compare(sq2))begin
          uvm_report_info(get_type_name(),"test_pass");
          pass=pass+1;
          sq1.print();
          sq2.print();
     end
     else begin
          uvm_report_info(get_type_name(),"test_fail");
          fail=fail+1;
          sq1.print();
          sq2.print();
     end
     end
     endtask

    function void extract_phase(uvm_phase phase);
     uvm_report_info(get_type_name(),"test_report");
     $display($time,"no of randomizes=%d",random);
     $display($time,"no of test pass=%d",pass);
     $display($time,"no of test fail=%d",fail);

      if(pass>=random || pass>=random-1)
         result="PASS";
      else
         result="FAIL";

    $display("result=%s",result);

     endfunction
     
    endclass



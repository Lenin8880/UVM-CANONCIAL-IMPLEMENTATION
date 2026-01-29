class axi_driver extends uvm_driver #(axi_txn);
  virtual axi_if vif;

  `uvm_component_utils(axi_driver)

  function void build_phase(uvm_phase phase);
    uvm_config_db#(virtual axi_if)::get(this,"","vif",vif);
  endfunction

  task run_phase(uvm_phase phase);
    axi_txn tr;
    forever begin
      seq_item_port.get_next_item(tr);
      @(posedge vif.aclk);
      vif.awvalid <= 1;
      vif.awaddr  <= tr.addr;
      wait (vif.awready);
      vif.awvalid <= 0;

      vif.wvalid <= 1;
      vif.wdata  <= tr.data;
      wait (vif.wready);
      vif.wvalid <= 0;
      seq_item_port.item_done();
    end
  endtask
endclass

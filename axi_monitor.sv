class axi_monitor extends uvm_monitor;
  virtual axi_if vif;
  uvm_analysis_port #(axi_txn) ap;

  `uvm_component_utils(axi_monitor)

  function new(string n, uvm_component p);
    super.new(n,p);
    ap = new("ap",this);
  endfunction

  task run_phase(uvm_phase phase);
    axi_txn tr;
    forever begin
      @(posedge vif.aclk);
      if (vif.awvalid && vif.awready) begin
        tr = axi_txn::type_id::create("tr");
        tr.addr = vif.awaddr;
        ap.write(tr);
      end
    end
  endtask
endclass

class generic_agent extends uvm_agent;
  uvm_sequencer #(generic_txn) seqr;
  uvm_driver    #(generic_txn) drv;
  uvm_monitor                   mon;

  `uvm_component_utils(generic_agent)

  function void build_phase(uvm_phase phase);
    mon = uvm_monitor::type_id::create("mon", this);
    if (is_active == UVM_ACTIVE) begin
      drv  = uvm_driver#(generic_txn)::type_id::create("drv", this);
      seqr = uvm_sequencer#(generic_txn)::type_id::create("seqr", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    if (is_active == UVM_ACTIVE)
      drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass

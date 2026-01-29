class axi_cov extends uvm_subscriber #(axi_txn);
  covergroup cg;
    coverpoint txn.addr;
    coverpoint txn.is_write;
  endgroup

  axi_txn txn;

  function new(string n, uvm_component p);
    super.new(n,p);
    cg = new();
  endfunction

  function void write(axi_txn t);
    txn = t;
    cg.sample();
  endfunction
endclass

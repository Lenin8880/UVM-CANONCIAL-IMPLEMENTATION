class axi_txn extends generic_txn;
  rand bit [31:0] addr;
  rand bit [31:0] data;

  constraint align { addr[1:0] == 0; }

  `uvm_object_utils(axi_txn)
endclass

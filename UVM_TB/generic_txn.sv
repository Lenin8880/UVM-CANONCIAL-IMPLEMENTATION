class generic_txn extends uvm_sequence_item;
  rand bit is_write;

  `uvm_object_utils(generic_txn)

  function new(string name="generic_txn");
    super.new(name);
  endfunction
endclass

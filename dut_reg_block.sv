class dut_reg_block extends uvm_reg_block;
  rand uvm_reg CTRL;

  `uvm_object_utils(dut_reg_block)

  function void build();
    CTRL = uvm_reg::type_id::create("CTRL");
    CTRL.configure(this, null, "RW", 32);
  endfunction
endclass

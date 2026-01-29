class base_test extends uvm_test;
  generic_env env;

  `uvm_component_utils(base_test)

  function void build_phase(uvm_phase phase);
    env = generic_env::type_id::create("env", this);
  endfunction
endclass

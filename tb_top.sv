module tb_top;
  logic aclk=0, aresetn=0;
  always #5 aclk = ~aclk;

  axi_if axi_if_inst(aclk, aresetn);

  initial begin
    uvm_config_db#(virtual axi_if)::set(null,"*","vif",axi_if_inst);
    #20 aresetn = 1;
    run_test("base_test");
  end
endmodule

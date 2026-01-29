interface axi_if (input logic aclk, input logic aresetn);
  logic awvalid, awready;
  logic wvalid,  wready;
  logic bvalid,  bready;
  logic [31:0] awaddr, wdata;
endinterface

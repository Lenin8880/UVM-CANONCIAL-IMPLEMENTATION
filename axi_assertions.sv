property awvalid_stable;
  @(posedge aclk) disable iff(!aresetn)
  awvalid |-> awvalid until awready;
endproperty

assert property (awvalid_stable);

module testbench;

  initial begin
    #5 //while both initial blocks start at the same time, this delay will ensure that the commands after it runs after 5 time units
        $display("Hello");
  end

  initial begin
    $display("World!");
  end


endmodule

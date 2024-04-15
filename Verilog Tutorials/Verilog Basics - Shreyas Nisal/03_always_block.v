module testbench;

  initial begin
    $display("Start!");
    #10
      $finish;  //you need to end the program; otherwise the always block will go into forever loop
  end

  always begin
    #5  //you need a delay for the always block to loop
        $display("always");
  end

endmodule

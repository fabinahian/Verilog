module testbench;

  reg a;  //registers are variables; they can store values

  initial begin
    a = 0;  //giving 'a' an initial value
    $display("Start!");
    #10 $finish;
  end

  always begin
    #1 a = !a;
    $display(a);
  end
endmodule

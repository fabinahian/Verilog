module half_subtractor (
    a,
    b,
    borrow,
    diff
);
  input a, b;
  output borrow, diff;

  wire not_a;

  xor xor1 (diff, a, b);
  not not1 (not_a, a);
  and and1 (borrow, not_a, b);

endmodule

`timescale 1ps / 1ps

module testbench;

  reg a, b;
  wire borrow, diff;

  half_subtractor dut (
      a,
      b,
      borrow,
      diff
  );

  initial begin
    #0{a, b} = 2'b00;
    #2{a, b} = 2'b01;
    #2{a, b} = 2'b10;
    #2{a, b} = 2'b11;

    #2 $finish;
  end

  initial $monitor("time = %g, a = %b, b = %b, borrow = %b, diff = %b", $time, a, b, borrow, diff);

endmodule

/*OUTPUT:
time = 0, a = 0, b = 0, borrow = 0, diff = 0
time = 2, a = 0, b = 1, borrow = 1, diff = 1
time = 4, a = 1, b = 0, borrow = 0, diff = 1
time = 6, a = 1, b = 1, borrow = 0, diff = 0 
*/

module full_subtractor (
    a,
    b,
    borrow_in,
    borrow_out,
    diff
);

  input a, b, borrow_in;
  output borrow_out, diff;

  wire w1, not_a, w2, not_w1, w3;

  xor xor1 (diff, a, b, borrow_in);

  xor xor2 (w1, a, b);
  not not1 (not_a, a);
  and and1 (w2, not_a, b);

  not not2 (not_w1, w1);
  and and2 (w3, not_w1, borrow_in);

  or or1 (borrow_out, w2, w3);

endmodule

`timescale 1ps / 1ps

module testbench;

  reg a, b, borrow_in;
  wire borrow_out, diff;

  full_subtractor dut (
      a,
      b,
      borrow_in,
      borrow_out,
      diff
  );

  initial begin
    //initializing the inputs 
    a = 0;
    b = 0;
    borrow_in = 0;
  end

  /* from the truth table of 3 variables (a, b, borrow_in)
we can observe that 'a' changes from 0 to 1 or vice-versa after each 4 iteration, 'b' changes after each 2 iterations and 'borrow_in' changes at each iteration. 
Using that login, always blocks can be used to update values and check the dut for all 8 combinations (000, 001, 010 etc)
*/
  always #4 a = a + 1'b1;
  always #2 b = b + 1'b1;
  always #1 borrow_in = borrow_in + 1'b1;

  initial begin
    $monitor("time = %g, a = %b, b = %b, borrow_in = %b, borrow_out = %b, diff = %b", $time, a, b,
             borrow_in, borrow_out, diff);
  end

  initial #20 $finish;

endmodule

/*OUTPUT:
time = 0, a = 0, b = 0, borrow_in = 0, borrow_out = 0, diff = 0
time = 1, a = 0, b = 0, borrow_in = 1, borrow_out = 1, diff = 1
time = 2, a = 0, b = 1, borrow_in = 0, borrow_out = 1, diff = 1
time = 3, a = 0, b = 1, borrow_in = 1, borrow_out = 1, diff = 0
time = 4, a = 1, b = 0, borrow_in = 0, borrow_out = 0, diff = 1
time = 5, a = 1, b = 0, borrow_in = 1, borrow_out = 0, diff = 0
time = 6, a = 1, b = 1, borrow_in = 0, borrow_out = 0, diff = 0
time = 7, a = 1, b = 1, borrow_in = 1, borrow_out = 1, diff = 1
time = 8, a = 0, b = 0, borrow_in = 0, borrow_out = 0, diff = 0
time = 9, a = 0, b = 0, borrow_in = 1, borrow_out = 1, diff = 1
time = 10, a = 0, b = 1, borrow_in = 0, borrow_out = 1, diff = 1
time = 11, a = 0, b = 1, borrow_in = 1, borrow_out = 1, diff = 0
time = 12, a = 1, b = 0, borrow_in = 0, borrow_out = 0, diff = 1
time = 13, a = 1, b = 0, borrow_in = 1, borrow_out = 0, diff = 0
time = 14, a = 1, b = 1, borrow_in = 0, borrow_out = 0, diff = 0
time = 15, a = 1, b = 1, borrow_in = 1, borrow_out = 1, diff = 1
time = 16, a = 0, b = 0, borrow_in = 0, borrow_out = 0, diff = 0
time = 17, a = 0, b = 0, borrow_in = 1, borrow_out = 1, diff = 1
time = 18, a = 0, b = 1, borrow_in = 0, borrow_out = 1, diff = 1
time = 19, a = 0, b = 1, borrow_in = 1, borrow_out = 1, diff = 0
time = 20, a = 1, b = 0, borrow_in = 0, borrow_out = 0, diff = 1 
*/

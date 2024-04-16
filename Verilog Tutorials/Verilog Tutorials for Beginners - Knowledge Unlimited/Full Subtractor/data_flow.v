module full_subtractor (
    a,
    b,
    borrow_in,
    borrow_out,
    diff
);

  input a, b, borrow_in;
  output borrow_out, diff;

  assign diff = a ^ b ^ borrow_in;
  assign borrow_out = ((~a) & b) | (~(a ^ b) & borrow_in);

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
    a = 1'b0;
    b = 1'b0;
    borrow_in = 1'b0;

    #20 $finish;
  end

  always #4 a = a + 1'b1;
  always #2 b = b + 1'b1;
  always #1 borrow_in = borrow_in + 1;

  initial
    $monitor(
        "time = %g, a = %b, b = %b, borrow_in = %b, borrow_out, diff",
        $time,
        a,
        b,
        borrow_in,
        borrow_out,
        diff
    );

endmodule

/*OUTPUT:
time = 0, a = 0, b = 0, borrow_in = 0, borrow_out, diff00
time = 1, a = 0, b = 0, borrow_in = 1, borrow_out, diff11
time = 2, a = 0, b = 1, borrow_in = 0, borrow_out, diff11
time = 3, a = 0, b = 1, borrow_in = 1, borrow_out, diff10
time = 4, a = 1, b = 0, borrow_in = 0, borrow_out, diff01
time = 5, a = 1, b = 0, borrow_in = 1, borrow_out, diff00
time = 6, a = 1, b = 1, borrow_in = 0, borrow_out, diff00
time = 7, a = 1, b = 1, borrow_in = 1, borrow_out, diff11
time = 8, a = 0, b = 0, borrow_in = 0, borrow_out, diff00
time = 9, a = 0, b = 0, borrow_in = 1, borrow_out, diff11
time = 10, a = 0, b = 1, borrow_in = 0, borrow_out, diff11
time = 11, a = 0, b = 1, borrow_in = 1, borrow_out, diff10
time = 12, a = 1, b = 0, borrow_in = 0, borrow_out, diff01
time = 13, a = 1, b = 0, borrow_in = 1, borrow_out, diff00
time = 14, a = 1, b = 1, borrow_in = 0, borrow_out, diff00
time = 15, a = 1, b = 1, borrow_in = 1, borrow_out, diff11
time = 16, a = 0, b = 0, borrow_in = 0, borrow_out, diff00
time = 17, a = 0, b = 0, borrow_in = 1, borrow_out, diff11
time = 18, a = 0, b = 1, borrow_in = 0, borrow_out, diff11
time = 19, a = 0, b = 1, borrow_in = 1, borrow_out, diff10
data_flow.v:37: $finish called at 20 (1ps)
time = 20, a = 1, b = 0, borrow_in = 0, borrow_out, diff01
*/

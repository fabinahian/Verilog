module half_Adder (
    a,
    b,
    carry,
    sum
);

  input a, b;
  output carry, sum;

  xor (sum, a, b);
  and (carry, a, b);

endmodule

`timescale 1ps / 1ps

module testbench;

  reg a, b;
  wire carry, sum;

  initial begin
    #2 a = 1'b0;
    b = 1'b0;

    #2 a = 1'b0;
    b = 1'b1;

    #2 a = 1'b1;
    b = 1'b0;

    #2 a = 1'b1;
    b = 1'b1;

    #2 $finish;
  end

  initial $monitor("time = %g, a = %b, b = %b, carry = %b, sum = %b", $time, a, b, carry, sum);

  half_Adder ha1 (
      a,
      b,
      carry,
      sum
  );

endmodule

/* OUTPUT:
time = 0, a = x, b = x, carry = x, sum = x
time = 2, a = 0, b = 0, carry = 0, sum = 0
time = 4, a = 0, b = 1, carry = 0, sum = 1
time = 6, a = 1, b = 0, carry = 0, sum = 1
time = 8, a = 1, b = 1, carry = 1, sum = 0
*/

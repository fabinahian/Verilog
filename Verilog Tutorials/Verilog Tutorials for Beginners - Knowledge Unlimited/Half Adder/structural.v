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
    a = 1'b0;
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

module half_adder (
    a,
    b,
    carry,
    sum
);
  input a, b;
  output reg carry, sum;

  always @(*) begin
    carry = a & b;
    sum   = a ^ b;
  end
endmodule

module full_adder (
    a,
    b,
    cin,
    carry,
    sum
);

  input a, b, cin;
  output carry, sum;

  wire w1, w2;

  half_adder ha1 (
      a,
      b,
      carry_ha1,
      w1
  );

  half_adder ha2 (
      w1,
      cin,
      w2,
      sum
  );

  or (carry, carry_ha1, w2);

endmodule

`timescale 1ps / 1ps

module testbench;

  reg a, b, cin;
  wire carry, sum;

  full_adder dut (
      a,
      b,
      cin,
      carry,
      sum
  );

  initial begin
    a   = 1'b0;
    b   = 1'b0;
    cin = 1'b0;

    #20 $finish;
  end

  always #4 a = a + 1'b1;
  always #2 b = b + 1'b1;
  always #1 cin = cin + 1'b1;

  initial
    $monitor(
        "time = %g, a = %b, b = %b, cin = %b, carry = %b, sum = %b", $time, a, b, cin, carry, sum
    );
endmodule

/*OUTPUT:
time = 0, a = 0, b = 0, cin = 0, carry = 0, sum = 0
time = 1, a = 0, b = 0, cin = 1, carry = 0, sum = 1
time = 2, a = 0, b = 1, cin = 0, carry = 0, sum = 1
time = 3, a = 0, b = 1, cin = 1, carry = 1, sum = 0
time = 4, a = 1, b = 0, cin = 0, carry = 0, sum = 1
time = 5, a = 1, b = 0, cin = 1, carry = 1, sum = 0
time = 6, a = 1, b = 1, cin = 0, carry = 1, sum = 0
time = 7, a = 1, b = 1, cin = 1, carry = 1, sum = 1
time = 8, a = 0, b = 0, cin = 0, carry = 0, sum = 0
time = 9, a = 0, b = 0, cin = 1, carry = 0, sum = 1
time = 10, a = 0, b = 1, cin = 0, carry = 0, sum = 1
time = 11, a = 0, b = 1, cin = 1, carry = 1, sum = 0
time = 12, a = 1, b = 0, cin = 0, carry = 0, sum = 1
time = 13, a = 1, b = 0, cin = 1, carry = 1, sum = 0
time = 14, a = 1, b = 1, cin = 0, carry = 1, sum = 0
time = 15, a = 1, b = 1, cin = 1, carry = 1, sum = 1
time = 16, a = 0, b = 0, cin = 0, carry = 0, sum = 0
time = 17, a = 0, b = 0, cin = 1, carry = 0, sum = 1
time = 18, a = 0, b = 1, cin = 0, carry = 0, sum = 1
time = 19, a = 0, b = 1, cin = 1, carry = 1, sum = 0
full_adder_using_half_adders.v:67: $finish called at 20 (1ps)
time = 20, a = 1, b = 0, cin = 0, carry = 0, sum = 1 
*/

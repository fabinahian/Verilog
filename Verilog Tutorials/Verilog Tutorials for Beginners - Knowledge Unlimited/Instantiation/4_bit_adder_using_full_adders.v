module full_adder (
    output carry,
    sum,
    input  a,
    b,
    cin
);

  assign sum   = a ^ b ^ cin;
  assign carry = (a & b) + (cin & (a ^ b));

endmodule

module four_bit_adder (
    output carry,
    output [3:0] sum,
    input [3:0] a,
    b,
    input cin
);

  wire [2:0] w;

  full_adder adder1 (
      w[0],
      sum[0],
      a[0],
      b[0],
      cin
  );
  full_adder adder2 (
      w[1],
      sum[1],
      a[1],
      b[1],
      w[0]
  );
  full_adder adder3 (
      w[2],
      sum[2],
      a[2],
      b[2],
      w[1]
  );
  full_adder adder4 (
      carry,
      sum[3],
      a[3],
      b[3],
      w[2]
  );

endmodule

`timescale 1ps / 1ps

module testbench;

  reg [3:0] a, b;
  reg cin;
  wire carry;
  wire [3:0] sum;

  four_bit_adder dut (
      carry,
      sum,
      a,
      b,
      cin
  );

  initial begin
    a   = 4'b0000;
    b   = 4'b0000;
    cin = 1'b0;
  end

  always #1 b = b + 1'b1;
  always #2 a = a + 1'b1;

  initial
    $monitor(
        "time = %g, carry = %b, sum = %b, a = %b, b = %b, cin = %b", $time, carry, sum, a, b, cin
    );
  initial #20 $finish;


endmodule

/*OUTPUT:
time = 0, carry = 0, sum = 0000, a = 0000, b = 0000, cin = 0
time = 1, carry = 0, sum = 0001, a = 0000, b = 0001, cin = 0
time = 2, carry = 0, sum = 0011, a = 0001, b = 0010, cin = 0
time = 3, carry = 0, sum = 0100, a = 0001, b = 0011, cin = 0
time = 4, carry = 0, sum = 0110, a = 0010, b = 0100, cin = 0
time = 5, carry = 0, sum = 0111, a = 0010, b = 0101, cin = 0
time = 6, carry = 0, sum = 1001, a = 0011, b = 0110, cin = 0
time = 7, carry = 0, sum = 1010, a = 0011, b = 0111, cin = 0
time = 8, carry = 0, sum = 1100, a = 0100, b = 1000, cin = 0
time = 9, carry = 0, sum = 1101, a = 0100, b = 1001, cin = 0
time = 10, carry = 0, sum = 1111, a = 0101, b = 1010, cin = 0
time = 11, carry = 1, sum = 0000, a = 0101, b = 1011, cin = 0
time = 12, carry = 1, sum = 0010, a = 0110, b = 1100, cin = 0
time = 13, carry = 1, sum = 0011, a = 0110, b = 1101, cin = 0
time = 14, carry = 1, sum = 0101, a = 0111, b = 1110, cin = 0
time = 15, carry = 1, sum = 0110, a = 0111, b = 1111, cin = 0
time = 16, carry = 0, sum = 1000, a = 1000, b = 0000, cin = 0
time = 17, carry = 0, sum = 1001, a = 1000, b = 0001, cin = 0
time = 18, carry = 0, sum = 1011, a = 1001, b = 0010, cin = 0
time = 19, carry = 0, sum = 1100, a = 1001, b = 0011, cin = 0
4_bit_adder_using_full_adders.v:85: $finish called at 20 (1ps)
time = 20, carry = 0, sum = 1110, a = 1010, b = 0100, cin = 0 
*/

module sixteen_bit_adder (
    sum,
    carry,
    a,
    b,
    cin
);

  output reg [15:0] sum;
  output reg carry;
  input [15:0] a, b;
  input cin;

  always @(a or b or cin) begin
    {carry, sum} = a + b + cin;
  end

endmodule

module testbench;

  reg [15:0] a;
  reg [15:0] b;
  reg cin;

  wire [15:0] sum;
  wire carry;

  sixteen_bit_adder dut (
      .sum(sum),
      .carry(carry),
      .a(a),
      .b(b),
      .cin(cin)
  );

  initial begin
    a   = 4'b0000;
    b   = 4'b0000;
    cin = 1'b0;
  end

  always #1 b = b + 1'b1;
  always #2 a = a + 1'b1;

  initial $monitor("sum = %d, carry = %d, a = %d, b = %d", sum, carry, a, b);
  initial #10 $finish;

endmodule

/*OUTPUT
sum =     0, carry = 0, a =     0, b =     0
sum =     1, carry = 0, a =     0, b =     1
sum =     3, carry = 0, a =     1, b =     2
sum =     4, carry = 0, a =     1, b =     3
sum =     6, carry = 0, a =     2, b =     4
sum =     7, carry = 0, a =     2, b =     5
sum =     9, carry = 0, a =     3, b =     6
sum =    10, carry = 0, a =     3, b =     7
sum =    12, carry = 0, a =     4, b =     8
sum =    13, carry = 0, a =     4, b =     9
16_bit_adder.v:47: $finish called at 10 (1s)
sum =    15, carry = 0, a =     5, b =    10
*/

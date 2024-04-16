module four_bit_subtractor (
    diff,
    borrow_out,
    a,
    b,
    borrow_in
);

  output [3:0] diff;
  output borrow_out;
  input [3:0] a, b;
  input borrow_in;

  wire [2:0] bi;

  full_adder sub1 (
      diff[0],
      bi[0],
      a[0],
      ~b[0],
      1'b1
  );
  full_adder sub2 (
      diff[1],
      bi[1],
      a[1],
      ~b[1],
      bi[0]
  );
  full_adder sub3 (
      diff[2],
      bi[2],
      a[2],
      ~b[2],
      bi[1]
  );
  full_adder sub4 (
      diff[3],
      borrow_out,
      a[3],
      ~b[3],
      bi[2]
  );

endmodule

module full_adder (
    sum,
    carry,
    a,
    b,
    cin
);

  input a, b, cin;
  output reg sum, carry;

  always @(*) begin
    sum   = a ^ b ^ cin;
    carry = (a & b) | (cin & (a ^ b));
  end
endmodule

module testbench;

  reg [3:0] a;
  reg [3:0] b;
  reg borrow_in;

  wire [3:0] diff;
  wire borrow_out;

  four_bit_subtractor dut (  //dot notation of instantiation
      .diff(diff),
      .borrow_out(borrow_out),
      .a(a),
      .b(b),
      .borrow_in(borrow_in)
  );

  initial begin
    a = 4'b0000;
    b = 4'b0000;
    borrow_in = 1'b1;
  end

  always #1 b = b + 1'b1;
  always #2 a = a + 1'b1;

  initial $monitor("a = %d, b = %d, borrow_out = %d, diff = %d", a, b, borrow_out, diff);
  initial #100 $finish;
endmodule

/*OUTPUT:
a =  0, b =  0, borrow_out = 1, diff =  0
a =  0, b =  1, borrow_out = 0, diff = 15
a =  1, b =  2, borrow_out = 0, diff = 15
a =  1, b =  3, borrow_out = 0, diff = 14
*/

/*you will notice that we are getting a diff of 14 when a = 1 and b = 3. You have to take 2's complement of 14 which will result in negative 2.
*/

module full_adder (
    a,
    b,
    cin,
    carry,
    sum
);

  parameter adder_size = 7;  //sets a constant

  input [adder_size-1:0] a;
  /*
    (adder_size - 1) is used because for an 8-bit adder, the notation will have to be [7:0].
    */
  input [adder_size-1:0] b;
  input cin;
  output carry;
  output [adder_size-1:0] sum;

  assign {carry, sum} = a + b + cin;

endmodule

module testbench;

  parameter adder_size = 7;

  reg [adder_size-1:0] a, b;
  reg cin;
  wire carry;
  wire [adder_size-1:0] sum;

  initial begin
    a   = 10;
    b   = 9;
    cin = 0;

    #5 $display("a = %d, b = %d, cin = %d; \ncarry = %d, sum = %d", a, b, cin, carry, sum);

    #2 $finish;
  end

  full_adder adder1 (
      a,
      b,
      cin,
      carry,
      sum
  );


endmodule

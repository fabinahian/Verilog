module full_adder (
    a,
    b,
    cin,
    cout,
    sum
);
  input a, b, cin;
  output cout, sum;

  wire w1, w2, w3;

  xor xor1 (sum, a, b, cin);  // sum = a ^ b ^ cin

  xor xor2 (w1, a, b);
  and and1 (w2, w1, cin);
  and and2 (w3, a, b);
  or or1 (cout, w2, w3);  // cout = (a & b) + cin & (a ^ b)

endmodule

`timescale 1ps / 1ps

module testbench;
  reg a, b, cin;
  wire cout, sum;

  full_adder dut (
      a,
      b,
      cin,
      cout,
      sum
  );

  initial begin

    #2{a, b, cin} = 3'b000;
    #2{a, b, cin} = 3'b001;
    #2{a, b, cin} = 3'b010;
    #2{a, b, cin} = 3'b011;
    #2{a, b, cin} = 3'b100;
    #2{a, b, cin} = 3'b101;
    #2{a, b, cin} = 3'b110;
    #2{a, b, cin} = 3'b111;

    #2 $finish;
  end

  initial
    $monitor(
        "time = %g, a = %b, b = %b, cin = %b, cout = %b, sum = %b", $time, a, b, cin, cout, sum
    );


endmodule

/*OUTPUT:
time = 0, a = x, b = x, cin = x, cout = x, sum = x
time = 2, a = 0, b = 0, cin = 0, cout = 0, sum = 0
time = 4, a = 0, b = 0, cin = 1, cout = 0, sum = 1
time = 6, a = 0, b = 1, cin = 0, cout = 0, sum = 1
time = 8, a = 0, b = 1, cin = 1, cout = 1, sum = 0
time = 10, a = 1, b = 0, cin = 0, cout = 0, sum = 1
time = 12, a = 1, b = 0, cin = 1, cout = 1, sum = 0
time = 14, a = 1, b = 1, cin = 0, cout = 1, sum = 0
time = 16, a = 1, b = 1, cin = 1, cout = 1, sum = 1 
*/

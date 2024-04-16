module half_adder (
    a,
    b,
    carry,
    sum
);

  input a, b;
  output reg carry, sum;  //inside the always block, the variables cannot be wires

  always @(*) begin
    carry = a & b;
    sum   = a ^ b;
  end
endmodule

`timescale 1ps / 1ps

module testbench;

  //inputs
  reg a, b;

  //outputs
  wire carry, sum;

  half_adder dut (
      a,
      b,
      carry,
      sum
  );

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

endmodule

/*OUTPUT:
time = 0, a = 0, b = 0, carry = 0, sum = 0
time = 2, a = 0, b = 1, carry = 0, sum = 1
time = 4, a = 1, b = 0, carry = 0, sum = 1
time = 6, a = 1, b = 1, carry = 1, sum = 0 
*/

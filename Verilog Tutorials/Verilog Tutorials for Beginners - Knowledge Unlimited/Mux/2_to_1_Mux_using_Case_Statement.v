module mux_2_to_1 (
    y,
    i,
    s
);

  output reg y;  //reg type because it will be used inside an always block
  input [1:0] i;
  input s;

  always @(*) //(*) indicates that the always block will be executed whenever any of the inputs changes

    casex (s)

      1'b0: y = i[0];  //when s = 0
      1'b1: y = i[1];  //when s = 1

      default: y = 1'bx;

    endcase

endmodule

`timescale 1ps / 1ps

module testbench;

  wire y;
  reg [1:0] i;
  reg s;

  mux_2_to_1 dut (
      .y(y),
      .i(i),
      .s(s)
  );

  initial begin
    s = 1'b0;
    i = 2'b00;
  end

  always #2 s = s + 1;
  always #1 i = i + 1;

  initial $monitor("s = %d, i[0] = %d, i[1] = %d, y = %d", s, i[0], i[1], y);

  initial #6 $finish;


endmodule
/*OUTPUT:
s = 0, i[0] = 0, i[1] = 0, y = 0
s = 0, i[0] = 1, i[1] = 0, y = 1
s = 1, i[0] = 0, i[1] = 1, y = 1
s = 1, i[0] = 1, i[1] = 1, y = 1
s = 0, i[0] = 0, i[1] = 0, y = 0
s = 0, i[0] = 1, i[1] = 0, y = 1
2_to_1_Mux_using_Case_Statement.v:48: $finish called at 6 (1ps) 
s = 1, i[0] = 0, i[1] = 1, y = 1
*/

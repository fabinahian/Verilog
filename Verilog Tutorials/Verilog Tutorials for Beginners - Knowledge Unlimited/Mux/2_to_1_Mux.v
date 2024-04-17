module mux_2_to_1 (
    output y,
    input [1:0] i,
    input s
);

  assign y = s ? i[1] : i[0];

endmodule

`timescale 1ps / 1ps

module testbench;

  reg [1:0] i;
  reg s;
  wire y;

  mux_2_to_1 dut (
      y,
      i,
      s
  );

  initial begin
    i = 2'b00;
    s = 1'b0;
  end

  always #2 s = s + 1;
  always #1 i = i + 1;

  initial $monitor("s = %d, i_0 = %d, i_1 = %d, y = %d", s, i[0], i[1], y);
  initial #4 $finish;

endmodule

/*OUTPUT
s = 0, i_0 = 0, i_1 = 0, y = 0
s = 0, i_0 = 1, i_1 = 0, y = 1
s = 1, i_0 = 0, i_1 = 1, y = 1
s = 1, i_0 = 1, i_1 = 1, y = 1
2_to_1_Mux.v:34: $finish called at 4 (1ps)
s = 0, i_0 = 0, i_1 = 0, y = 0
*/

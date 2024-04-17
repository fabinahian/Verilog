
module mux_2_to_1 (
    y,
    i,
    s
);

  output reg y;
  input [1:0] i;
  input s;

  always @(*) begin
    if (s == 1) begin
      y = i[1];
    end else begin
      y = i[0];
    end
  end

endmodule

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
2_to_1_Mux_using_if_else.v:44: $finish called at 6 (1s)
s = 1, i[0] = 0, i[1] = 1, y = 1
*/

module mux_2_to_1 (
    y,
    i,
    s
);

  output y;
  input [1:0] i;
  input s;

  assign y = s ? i[1] : i[0];

endmodule

module mux_8_to_1 (
    y,
    i,
    s
);

  output y;
  input [7:0] i;
  input [2:0] s;

  wire [5:0] w;

  mux_2_to_1 mux_1 (
      w[0],
      i[1:0],
      s[0]
  );
  mux_2_to_1 mux_2 (
      w[1],
      i[3:2],
      s[0]
  );
  mux_2_to_1 mux_3 (
      w[2],
      i[5:4],
      s[0]
  );
  mux_2_to_1 mux_4 (
      w[3],
      i[7:6],
      s[0]
  );
  mux_2_to_1 mux_5 (
      w[4],
      w[1:0],
      s[1]
  );
  mux_2_to_1 mux_6 (
      w[5],
      w[3:2],
      s[1]
  );
  mux_2_to_1 mux_7 (
      y,
      w[5:4],
      s[2]
  );

endmodule

module testbench;

  wire y;
  reg [7:0] i;
  reg [2:0] s;

  mux_8_to_1 dut (
      y,
      i,
      s
  );

  initial begin
    i = 8'b00000000;
    s = 3'b000;
  end

  always #2 s = s + 1;
  always #1 i = i + 1;

  initial $monitor("output = %b, s = %b, i = %b", y, s, i);

  initial #20 $finish;

endmodule

/*OUTPUT:
output = 0, s = 000, i = 00000000
output = 1, s = 000, i = 00000001
output = 1, s = 001, i = 00000010
output = 1, s = 001, i = 00000011
output = 1, s = 010, i = 00000100
output = 1, s = 010, i = 00000101
output = 0, s = 011, i = 00000110
output = 0, s = 011, i = 00000111
output = 0, s = 100, i = 00001000
output = 0, s = 100, i = 00001001
output = 0, s = 101, i = 00001010
output = 0, s = 101, i = 00001011
output = 0, s = 110, i = 00001100
output = 0, s = 110, i = 00001101
output = 0, s = 111, i = 00001110
output = 0, s = 111, i = 00001111
output = 0, s = 000, i = 00010000
output = 1, s = 000, i = 00010001
output = 1, s = 001, i = 00010010
output = 1, s = 001, i = 00010011
8_to_1_Mux.v:87: $finish called at 20 (1s)
output = 1, s = 010, i = 00010100
*/

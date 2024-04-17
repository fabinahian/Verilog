module demux_1_to_2 (
    y,
    i,
    s
);

  output reg [1:0] y;
  input i, s;

  always @(*) begin
    if (s == 0) begin
      y[0] = i;
    end else begin
      y[1] = i;
    end
  end

endmodule

module testbench;

  reg i, s;
  wire [1:0] y;

  demux_1_to_2 dut (
      y,
      i,
      s
  );

  initial begin
    s = 1'b0;
    i = 1'b0;
  end

  always #2 s = s + 1'b1;
  always #1 i = i + 1'b1;

  initial $monitor("output = %b, s = %b, i = %b", y, s, i);

  initial #8 $finish;

endmodule

/*OUTPUT:
output = x0, s = 0, i = 0
output = x1, s = 0, i = 1
output = 01, s = 1, i = 0
output = 11, s = 1, i = 1
output = 10, s = 0, i = 0
output = 11, s = 0, i = 1
output = 01, s = 1, i = 0
output = 11, s = 1, i = 1
1_to_2_Demux.v:41: $finish called at 8 (1s)
output = 10, s = 0, i = 0
*/

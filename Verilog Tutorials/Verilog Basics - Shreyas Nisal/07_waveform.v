module not_gate (
    a,
    b
);
  input a;
  output b;

  assign b = !a;
endmodule

module testbench;

  reg  a;
  wire b;

  initial begin

    $dumpfile("waveform.vcd");  //vcd = verilog change dump
    $dumpvars(0, gate1);
    /*argument 1 = level (0/1), argument 2 = which modules 
        level 0 means all variables gets selected
        level 1 means you get to specify the variables */

    a = 0;
    //$display("a = %b, b = %b", a,b);

    #2 a = 1;
    //$display("a = %b, b = %b", a,b);

    #2 a = 0;
    //$display("a = %b, b = %b", a,b);

    #2 $finish;
  end

  not_gate gate1 (
      a,
      b
  );
endmodule

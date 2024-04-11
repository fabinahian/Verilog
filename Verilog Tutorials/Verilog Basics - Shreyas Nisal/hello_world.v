module testbench;

initial begin //without this initial block, $display won't work since it's a .v file and not .sv
    $display ("Hello, world!");
end

endmodule

module not_gate(a,b);

    input a;
    output b; //modules don't return anything; so we need to pass parameters for the output

    assign b = !a; //use the 'assign' keyword when dealing with wires
endmodule

module testbench;

    reg a;
    wire b; //wires can't store value

    initial
    begin
        a = 0;
        $display("a = %b, b = %b",a,b);
        #5 a = 1;
        $display("a = %b, b = %b",a,b);
        #5 a = 0; //within the same initial block, time delys stack up together; so, the command after the second #5 happens after 10 time unit
        $display("a = %b, b = %b",a,b);
        #5 a = 1;
        $display("a = %b, b = %b",a,b);
        #5 a = 0;
        $display("a = %b, b = %b",a,b);
        #5 $finish;

    end

    not_gate gate1(a,b); //creating an instance of the module since we can't call the module for output

endmodule
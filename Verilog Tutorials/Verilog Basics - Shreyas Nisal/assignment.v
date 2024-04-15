module testbench;

    reg a;
    reg b;
    reg c;
    wire d;

    //continous assignment
    assign d = a; //whenever a changes, that is going to be assigned to d. This cannot be used inside an initial block.

    initial
    begin

        //blocking assignment
        {a,c} = 0;
        b = 1;

        #10
        a = b; //a gets updated with the value of b
        c = a; //c gets the new value of a
        #10
        $display("Blocking");
        $display("a = ", a);
        $display("b = ", b);
        $display("c = ", c);
        
        //non-blocking assignment
        {a,c} = 0;
        b = 1;

        #10
        a <= b; //a gets updated with the value of b
        c <= a; //c gets the old value of a
        #10
        $display("Non-Blocking");
        $display("a = ", a);
        $display("b = ", b);
        $display("c = ", c);

    end


endmodule
module testbench;
    reg a; //one bit register
    reg [2:0] b; //three bit register
    reg [2:0] c;
    reg [2:0] d;
    reg e;

    initial begin
        a = 4; // 4 in binary = 100

        $display(a); //shows 0 because a is a one bit register and thus is only shows the right most bit from 100

        //different ways of assigning values
        b = 4;
        b = 3'd4;
        b[0] = 1'b0; b[1] = 1'b0; b[2] = 1'b1;

        $display(b);

        c[0] = 1'b0; c[1] = 1'b0;

        $display(c); //will  get a 'X' because we didn't assign value to every position

        {e,d} = 4'd10; 
        /*
        since 10 requires 4 bits and d is a 3-bit regiters, 3 bits from the right will get assigned to 'd' and the left-out bit will get assigned to 3. 
        So, 
        10 = binary 1010
        e = 1, d = 010
        */
        $finish;
    end
endmodule
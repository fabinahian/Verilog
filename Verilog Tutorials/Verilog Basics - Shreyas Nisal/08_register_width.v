module testbench;
    reg a; //one bit register
    reg [2:0] b; //three bit register
    reg [2:0] c;

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
        $finish;
    end
endmodule
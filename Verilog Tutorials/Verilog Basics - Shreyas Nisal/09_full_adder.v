module full_adder(a,b,cin,carry,sum);

    input [3:0] a; //[3:0] for a 4-bit variable
    input [3:0] b; 
    input cin;
    output carry;
    output [3:0] sum;

    assign {carry,sum} = a + b + cin;

endmodule

module testbench;

    reg [3:0] a, b;
    reg cin;
    wire carry;
    wire [3:0] sum;

    initial
    begin
        a = 4'b0101;
        b = 4'b1010;
        cin = 0;

        #5 
        $display("a = %d, b = %d, cin = %d", a,b,cin);
        $display("Carry = %d, Sum = %d", carry, sum);
    end

    full_adder adder1(a,b,cin,carry,sum);


endmodule
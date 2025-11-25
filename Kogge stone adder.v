module kogge_stone_adder_4bit(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);

    // Define the propagate and generate signals
    wire [3:0] p, g;

    // Calculate propagate and generate signals
    assign p[0] = a[0] ^ b[0];
    assign g[0] = a[0] & b[0];

    assign p[1] = a[1] ^ b[1];
    assign g[1] = a[1] & b[1];

    assign p[2] = a[2] ^ b[2];
    assign g[2] = a[2] & b[2];

    assign p[3] = a[3] ^ b[3];
    assign g[3] = a[3] & b[3];

    // Define carry signals
    wire [2:0] c;

    // Calculate carry signals
    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & c[0]);
    assign c[2] = g[2] | (p[2] & c[1]);

    // Calculate sums
    assign sum[0] = p[0] ^ cin;
    assign sum[1] = p[1] ^ c[0];
    assign sum[2] = p[2] ^ c[1];
    assign sum[3] = p[3] ^ c[2];

    // Final carry-out
    assign cout = g[3] | (p[3] & c[2]);

endmodule

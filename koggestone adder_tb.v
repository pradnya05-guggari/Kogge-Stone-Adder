module kogge_stone_adder_4bit_tb;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg       cin;

    // Outputs
    wire [3:0] sum;
    wire       cout;

    // Instantiate the Kogge–Stone adder
    kogge_stone_adder_4bit ksa(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Initialize inputs
        a = 4'd0;
        b = 4'd0;
        cin = 1'd0;

        // Test cases
        #10;
        a = 4'd1; b = 4'd1; cin = 1'd0;  // 1 + 1 = 2
        #10;
        a = 4'd5; b = 4'd3; cin = 1'd0;  // 5 + 3 = 8
        #10;
        a = 4'd8; b = 4'd8; cin = 1'd0;  // 8 + 8 = 16 (overflow)
        #10;
        a = 4'd0; b = 4'd9; cin = 1'd1;  // 0 + 9 + 1 = 10 (carry-in)
        #10;
        a = 4'd5; b = 4'd5; cin = 1'd1;  // 5 + 5 + 1 = 11 (carry-in)
    end

    // Display results
    always @(a, b, cin, sum, cout) begin
        $display("a = %d, b = %d, cin = %d, sum = %d, cout = %d", 
                  a, b, cin, sum, cout);
    end

endmodule

module parity_generator (
    input wire [16-1:0] a,
    output reg [1-1:0] parity
);
    
    integer i;

    always @(*) begin
        parity = 1'b0;
        for ( i = 0 ; i < 16 ; i = i + 1) begin
            parity = parity ^ a[i];
        end
    end

endmodule

module parity_generator_tb ();
    wire [1-1:0] parity;
    reg  [1-1:0] parity_gloden;
    reg  [16-1:0] a_hw;

    parity_generator PG(.a(a_hw), .parity(parity));

    reg [16-1:0] tmp = 16'd0;
    reg [17-1:0] score = 16'd0;

    integer i, j;

    initial begin
        for (j = 0 ; j < 65536 ; j = j + 1) begin
            a_hw = tmp;
            parity_generator_golden (tmp, parity_gloden);
            #5
            if (parity != parity_gloden) begin
                $display("Error at %b, Correct = %b, Your Result = %b", tmp, parity_gloden, parity);
            end
            else begin
                score = score + 1;
            end
            #5 
            tmp = tmp + 1'b1;
        end
        $display("You get %d/65536 testcase correct", score);
    end

    task parity_generator_golden;
        input [16-1:0] a;
        output [1-1:0] parity_gloden;
        begin
            parity_gloden = 1'b0;
            for (i = 0 ; i < 16 ; i = i + 1) begin
                parity_gloden = parity_gloden ^ a[i];
            end
        end
    endtask
    
endmodule
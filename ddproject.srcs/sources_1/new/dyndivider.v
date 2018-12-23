module dyndivider (input clk100MHz, input hz, output reg clkOut);
    reg [0:31] count = 0;
    initial begin
        clkOut = 0;
    end
    always @(posedge clk100MHz) begin
        if (count < 50000000 / hz)
            count <= count + 1;
        else begin
            count <= 0;
            clkOut <= ~clkOut;
        end
    end
endmodule
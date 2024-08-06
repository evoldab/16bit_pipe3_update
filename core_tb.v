`timescale 1ps/1ps

module tb_complete;
	reg clk;
	reg rst;

core uut(
	.clk(clk),
	.rst(rst)
);

always begin
        clk = 1;
        #10;
        clk = 0;
        #10;
end

initial begin
        rst = 1;
        #10;
        rst = 0;
end

initial begin
        $dumpfile("/home/evoldab/CompletePrj/waveform.vcd");
        $dumpvars(0, tb_complete);
end


endmodule

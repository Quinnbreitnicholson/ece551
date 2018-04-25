module snn_core_tb();
reg start, q_input, clk, data ,we;
reg[9:0] addr_input_unit, addr;
reg[3:0] digit;
wire done, q;
snn_core core(.start(start), .q_input(q_input), .addr_input_unit(addr_input_unit),
		 .digit(digit), .clk(clk));
initial begin
clk = 0;
	forever #1 clk = ~clk;
end
ram#(.ADDR_WIDTH(10), .DATA_WIDTH(1), .FILE_IN("ram_input_contents_sample_0.txt"))
	ram_test(.data(data), .addr(addr_input_unit), .we(we), .clk(clk), .q(q_input));
initial begin 
	start = 1;
	while(done == 0) 
		begin
		#2;
		end
end
endmodule
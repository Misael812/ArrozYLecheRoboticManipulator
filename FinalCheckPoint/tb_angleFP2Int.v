module tb_angleFP2Int;
	reg [15:0] angle;
	wire [15:0] intVal;
	
	angleFP2Int UUT (.angle(angle), .intVal(intVal));
	
	initial begin
		//angle = 16'h7BFF;
		//angle = 16'h4D1D; //expect to get a 20 unsigned int
		//angle = 16'h58B6;// expect to get 150
		
	end
endmodule 
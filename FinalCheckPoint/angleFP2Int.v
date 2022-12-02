module angleFP2Int(
	input [15:0] angle,
	output [15:0] intVal
	);
	
	reg [4:0] exponent;
	reg [9:0] fraction;
	reg [15:0] result = 16'h0000;
	reg [15:0] normalizeVal = 16'h0001;
	
	assign intVal = result;
	always@(*) begin
		fraction = angle[9:0];
		exponent = angle[14:10];
		exponent = exponent - 5'b01111;
		result = fraction;
		if(exponent <= 5'b01010) result = result >> (5'b01010 - exponent);
		else result = result << (exponent - 5'b01010);
		normalizeVal = normalizeVal << (exponent);
		result = result | normalizeVal;
	end
endmodule 
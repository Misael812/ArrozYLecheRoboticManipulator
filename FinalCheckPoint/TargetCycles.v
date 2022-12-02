module TargetCycles(
	input [15:0] angleInt,
	output [24:0] cyclesTarget
	);
	
	
	// Mapping Range from rosettacode, 18 bit numbers
	// [a1, a2] => [0, 180]
	// [b1, b2] => [25000, 125000]
	// s is the angle given
	// t = b1 + ((s - a1)*(b2 - b1)) / (a2 - a1) what the counter should be
	
	reg [24:0] b2_b1 = 18'h186A0;
	reg [24:0] a2_a1 = 18'h000B4;
	reg [24:0] b1 = 18'h061A8;
	reg [24:0] target = 18'h61A8; //Set target to initially be in the zero position
	assign cyclesTarget = target;
	
	always@(*) begin
		target = b1 + (angleInt * b2_b1 / a2_a1);
	end
endmodule 
module PWM (
	input clk,
	input reset,
	input [15:0] angle,
	output PWMsignal
	);
	
	// Convert angle to unsigned Integer
	wire[15:0] angleInt;
	angleFP2Int conversion(angle, angleInt);
	
	// Mapping Range from rosettacode, 18 bit numbers
	// [a1, a2] => [0, 180]
	// [b1, b2] => [25000, 125000]
	// s is the angle given
	// t = b1 + ((s - a1)*(b2 - b1)) / (a2 - a1) what the counter should be	
	/**
	reg a1 = 18'b0;
	reg a2 = 18'h000B4;
	reg b1 = 18'h061A8;
	reg b2 = 18'h1E848;
	reg [17:0] t;
	
	always@(*) begin
		t = b1 + (({2'b00, angleInt} - a1) * (b2-b1) / (a2-a1));
	end
	**/
	
	wire [24:0] cyclesTarget;
	TargetCycles t (angleInt, cyclesTarget);
	
	// Counter to compare to t and pulsewidth singal
	reg [31:0] counter = 0;
	reg signal;
	assign PWMsignal = signal;
	
	always @(posedge clk) begin
		if(counter < cyclesTarget) signal <= 1;
		else signal <= 0;
		counter <= counter + 1;
		if(counter == 1000000) counter <= 0;
	end
	
	/**
	wire [17:0] Target;
	reg [17:0] cyclesTarget;
	reg [31:0] counter = 0;
	reg signal;
	//assign cyclesTarget = Target;
	assign PWMsignal = signal;
	
	angleFP2CyclesPositive owo (angle, Target);
	
		// This one is to create the PWMsignal
	always@(posedge clk) begin
		if(counter < Target) begin
			signal <= 1;
		end
		else signal <= 0;
		counter <= counter + 1;
		if(counter == 50000000) counter <= 0;
	end
	**/
endmodule 
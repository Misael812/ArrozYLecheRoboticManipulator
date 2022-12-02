`timescale 1 ns / 1 ns
module tb_PWM;
	reg clk;
	reg reset;
	reg [15:0] angle;
	wire PWMsignal;
	
	PWM UUT (.clk(clk), .reset(reset), .angle(angle), .PWMsignal(PWMsignal));
	
	localparam CLK_PERIOD = 20;
	always #(CLK_PERIOD/2) clk=~clk;

	initial begin
		clk = 0;
		reset = 0;
		
		// Testing mapping code
		angle = 16'h0000; //180 degrees, about 2.5 ms
	end
	
	initial begin
		clk = 0;
		reset = 0;
		
		// Testing mapping code
		//angle = 16'h59A0; //180 degrees, about 2.5 ms, angle is in fp
		//angle = 16'h54B0; //75 degrees about 1.33 ms
		angle = 16'h5060; //35 degrees about .88 ms
		//angle = 16'h5948; //169 degrees about 2.37 ms
		
		// This is for mapping angle to a single pulse width
		// 18 pulse widths, each with a range of fp angles
		
		// angle 171 and above, should be about 2.5 ms
		//angle = 16'h5998; // 179   degrees
		//angle = 16'h597C; // 175.5 degrees
		
		// angle 161 to before 171, should be about 2.37 ms
		//angle = 16'h5948; // 169 degrees
		//angle = 16'h592A; // 165.3 degrees
		
		// angle 151 to before 161, should be about 2.26 ms
		//angle = 16'h58E8; // 157 degrees
		//angle = 16'h58C6; // 152.8 degrees
		
		// angle 141 to before 151, should be about 2.15 ms
		//angle = 16'h5868; // 141 degrees
		//angle = 16'h587A;
		
		// angle 131 to before 141, should be about 2.04 ms
		//angle
		
		// angle 121 to before 131, should be about 1.93 ms
		
		
		// angle 111 to before 121, should be about 1.82 ms
		
		
		// angle 101 to before 111, should be about 1.71 ms
		
		
		// angle 91 to before 101, should be about 1.60 ms
		
		
		// angle 81 to before 91, should be about 1.49 ms
		
		
		// angle 71 to before 81, should be about 1.38 ms
		
		
		// angle 61 to before 71, should be about 1.27 ms
		
		
		// angle 51 to before 61, should be about 1.16 ms
		
		
		// angle 41 to before 51, should be about 1.05 ms
		
		
		// angle 31 to before 41, should be about 0.94 ms
		
		
		// angle 21 to before 31, should be about 0.83 ms
		
		
		// angle 11 to before 21, should be about 0.72 ms
		
		
		// angle 1 to before 11, should be about 0.61 ms
		
		
		// angle 0 to before 1, shoulb be about 0.5 ms
	
	end
	

endmodule 
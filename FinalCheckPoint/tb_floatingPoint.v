`timescale 1 ns / 100 ps
module tb_floatingPoint;

        reg clk;
		reg areset;
		reg [15:0] a;
		reg [15:0] b;
		reg [1:0] selectFPOperation;
		wire [15:0] fpResult;  //  opSel.opSel

floatingPoint UUT (
	 	.clk(clk),
		.areset(areset),
		.a(a),
		.b(b),
		.selectFPOperation(selectFPOperation),
		.fpResult(fpResult)  //  opSel.opSel
	);

localparam CLK_PERIOD = 10;
	always #(CLK_PERIOD/2) clk=~clk;

	initial begin
        clk <= 0;
		areset <= 0;
		a <= 0;
		b <= 0;
		selectFPOperation <= 2'b00; 
        
        // teting adding
        #CLK_PERIOD;
        a = 16'h4100;
        b = a;

        #CLK_PERIOD;
        #CLK_PERIOD;
        #CLK_PERIOD;

        //testing sub
        selectFPOperation <= 2'b01;

        #CLK_PERIOD;
        #CLK_PERIOD;
        #CLK_PERIOD;

        //testing multiplication
        selectFPOperation <= 2'b10;

        #CLK_PERIOD;
        #CLK_PERIOD;
        #CLK_PERIOD;

        //testing divide
        selectFPOperation <= 2'b11;

       


        
    end

endmodule
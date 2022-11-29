module floatingPoint (
	 	input clk,
		input areset,
		input [15:0] a,
		input [15:0] b,
		input [3:0] selectFPOperation,
		output reg [15:0] fpResult  //  opSel.opSel
	);

	wire [15:0] addSubResult;
	wire [15:0] mulResult;
	wire [15:0] DivResult;
	wire [15:0] atanResult;
	wire [15:0] atan2Result;
	wire [15:0] acosResult;
	wire [15:0] sqResult;
	reg Select_Add_Sub;

    fp_Add_Sub fpAddSub (
	     .clk(clk),    //    clk.clk
	     .areset(areset), // areset.reset
	     .a(a),      //      a.a
	     .b(b),      //      b.b
	     .q(addSubResult),      //      q.q
	     .opSel(Select_Add_Sub) //  opSel.opSel
	);

	fp_Mul mul(
	    .clk(clk),    //    clk.clk
	    .areset(areset), // areset.reset
	    .a(a),      //      a.a
	    .b(b),      //      b.b
	    .q(mulResult)       //      q.q
	);

	 fp_Div div(
		.clk(clk),    //    clk.clk
		.areset(areset), // areset.reset
		.a(a),      //      a.a
		.b(b),      //      b.b
		.q(DivResult)       //      q.q
	);

	fp_atan atan(
		.clk(clk),    //    clk.clk
		.areset(areset), // areset.reset
		.a(a),      //      a.a
		.q(atanResult)       //      q.q
	);

	fp_atan2 atan2(
		.clk(clk),    //    clk.clk
		.areset(areset), // areset.reset
		.a(a),      //      a.a
		.q(atan2Result)       //      q.q
	);

	fp_acos acos(
		.clk(clk),    //    clk.clk
		.areset(areset), // areset.reset
		.a(a),      //      a.a
		.q(acosResult)       //      q.q
	);

	fp_sqrt sqrt(
		.clk(clk),    //    clk.clk
		.areset(areset), // areset.reset
		.a(a),      //      a.a
		.q(sqResult)       //      q.q
	);

	always@(*)begin
		Select_Add_Sub <= 0; 
		case (selectFPOperation)
			4'h0: begin
				Select_Add_Sub <= 1; 
				fpResult <= addSubResult;
			end
			4'h1: begin
				fpResult <= addSubResult;
			end
			4'h2: fpResult <= mulResult;
			4'h3:  fpResult <= DivResult;
			4'h4:  fpResult <= atanResult;
			4'h5:  fpResult <= atan2Result;
			4'h6:  fpResult <= acosResult;
			4'h7:  fpResult <= sqResult;
			default: begin
				fpResult <= 16'h0000; // should not happen
			end
		endcase
	end

	
endmodule
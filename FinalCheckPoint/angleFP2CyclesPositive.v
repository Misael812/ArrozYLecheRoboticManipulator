module angleFP2CyclesPositive(
	input [15:0] angle,
	output [17:0] cyclesTarget
);

	reg [17:0] Target;
	assign cyclesTarget = Target;

	// Local Parameters that represent a half precesion angle in degrees
	// to its hexadecimal value
	localparam degree_0   = 16'h0000;
	localparam degree_1   = 16'h3C00;
	localparam degree_11  = 16'h4980;
	localparam degree_21  = 16'h4D40;
	localparam degree_31  = 16'h4FC0;
	localparam degree_41  = 16'h5120;
	localparam degree_51  = 16'h5260;
	localparam degree_61  = 16'h53A0;
	localparam degree_71  = 16'h5470;
	localparam degree_81  = 16'h5510;
	localparam degree_91  = 16'h55B0;
	localparam degree_101 = 16'h5650;
	localparam degree_111 = 16'h56F0;
	localparam degree_121 = 16'h5790;
	localparam degree_131 = 16'h5818;
	localparam degree_141 = 16'h5868;
	localparam degree_151 = 16'h58B8;
	localparam degree_161 = 16'h5908;
	localparam degree_171 = 16'h5958;
	
	// local parameters that represent the number of cycles
	localparam cycles_25000  = 18'h61A8;
	localparam cycles_30500  = 18'h7724;
	localparam cycles_36000  = 18'h8CA0;
	localparam cycles_41500  = 18'hA21C;
	localparam cycles_47000  = 18'h125C;
	localparam cycles_52500  = 18'hCD14;
	localparam cycles_58000  = 18'hE290;
	localparam cycles_64500  = 18'hFBF4;
	localparam cycles_69000  = 18'h10D88;
	localparam cycles_74500  = 18'h12304;
	localparam cycles_80000  = 18'h13880;
	localparam cycles_85500  = 18'h14DFC;
	localparam cycles_91000  = 18'h16378;
	localparam cycles_96500  = 18'h178F4;
	localparam cycles_102000 = 18'h18E70;
	localparam cycles_107500 = 18'h1A3EC;
	localparam cycles_113000 = 18'h1B968;
	localparam cycles_118500 = 18'h1CEE4;
	localparam cycles_125000 = 18'h1E848;

	always@(*) begin
		if(angle >= degree_0 && angle < degree_1) Target <= cycles_25000;
		else if(angle >= degree_1 && angle < degree_11) Target <= cycles_30500;
		else if(angle >= degree_11 && angle < degree_21) Target <= cycles_36000;
		else if(angle >= degree_21 && angle < degree_31) Target <= cycles_41500;
		else if(angle >= degree_21 && angle < degree_41) Target <= cycles_47000;
		else if(angle >= degree_41 && angle < degree_51) Target <= cycles_52500;
		else if(angle >= degree_51 && angle < degree_61) Target <= cycles_58000;
		else if(angle >= degree_61 && angle < degree_71) Target <= cycles_64500;
		else if(angle >= degree_71 && angle < degree_81) Target <= cycles_69000;
		else if(angle >= degree_81 && angle < degree_91) Target <= cycles_74500;
		else if(angle >= degree_91 && angle < degree_101) Target <= cycles_80000;
		else if(angle >= degree_101 && angle < degree_111) Target <= cycles_85500;
		else if(angle >= degree_111 && angle < degree_121) Target <= cycles_91000;
		else if(angle >= degree_121 && angle < degree_131) Target <= cycles_96500;
		else if(angle >= degree_131 && angle < degree_141) Target <= cycles_102000;
		else if(angle >= degree_141 && angle < degree_151) Target <= cycles_107500;
		else if(angle >= degree_151 && angle < degree_161) Target <= cycles_113000;
		else if(angle >= degree_161 && angle < degree_171) Target <= cycles_118500;
		else Target <= cycles_125000;
		
	end
endmodule 
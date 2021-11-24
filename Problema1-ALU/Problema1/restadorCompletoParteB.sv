module restadorCompletoParteB(input  logic [3:0]RParteA, 
										input  logic 	   CoutParteA,
										output logic [3:0]RF,
										output logic 	   NegFlag,
										output logic 	   zeroFlag);

	assign RF = CoutParteA ? RParteA : ~RParteA + 'b0001;
	assign NegFlag = CoutParteA ? 0:1;
	assign zeroFlag = ~RParteA[3] & ~RParteA[2] & ~RParteA[1] & ~RParteA[0];


endmodule
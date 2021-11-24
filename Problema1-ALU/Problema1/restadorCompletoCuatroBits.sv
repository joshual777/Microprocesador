module restadorCompletoCuatroBits(input logic [3:0]A,B, 		  
											 output logic [3:0]R,
											 output logic 	  NegFlag,
											 output logic 	  zeroFlag);
	
	logic CoutParteA;
	logic [3:0]RParteA;
	
	restadorCompletoParteA resA(A,B,RParteA,CoutParteA);
	restadorCompletoParteB resB(RParteA,CoutParteA, R, NegFlag, zeroFlag);

endmodule
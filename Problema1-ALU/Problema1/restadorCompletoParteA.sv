module restadorCompletoParteA(input logic [3:0]A,B, 		  
		  output logic [3:0]R,
		  output logic 	  Cout);
		
	

	sumadorCompletoCuatroBits fullAdder4Bits(A, ~B, 1, R, Cout);
	
endmodule
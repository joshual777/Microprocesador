module sumadorCompletoCuatroBits(input logic  [3:0]A, B,
		  input logic 		  Cin,
		  output logic [3:0]R, 
		  output logic 	  Cout);
		  
		  
		  logic Cout0_a_Cin1, Cout1_a_Cin2, Cout2_a_Cin3;
		  
		  sumadorCompletoUnBit S0(A[0],B[0], Cin, 			R[0], Cout0_a_Cin1);
		  sumadorCompletoUnBit S1(A[1],B[1], Cout0_a_Cin1, R[1], Cout1_a_Cin2);
		  sumadorCompletoUnBit S2(A[2],B[2], Cout1_a_Cin2, R[2], Cout2_a_Cin3);
		  sumadorCompletoUnBit S3(A[3],B[3], Cout2_a_Cin3, R[3], Cout);
		 		  
endmodule		  
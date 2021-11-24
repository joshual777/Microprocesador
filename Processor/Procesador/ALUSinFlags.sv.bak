/* -------------------- ALU SIN FLAGS --------------------
	ALUControl1:0  Function
		00			 	  ADD
		01			 	  SUB
		10			 	  XOR
		11			 	  NOT
	-------------------------------------------------------
*/

module ALUSinFlags #(parameter N = 4)
						  (input  logic [N-1:0] A, B, 
						   input  logic [1:0] ALUControl,
							output logic [N-1:0] out,
							output logic cout);
							
							
	logic [N-1:0] aluOut, xorOut, notOut, mux2a1Out;
	
	mux2  			  #(N) mux2(B, ~B, ALUControl[0], mux2a1Out);
	adderWithCarry   #(N) adderALU(A, mux2a1Out, ALUControl[0], aluOut, cout);
	xorGate 			  #(N) xorAlu(A, B, xorOut);
	inv	  			  #(N) invAlu(B, notOut);
	mux4a1  			  #(N) mux4(aluOut, aluOut, xorOut, notOut, ALUControl, out);
	
	
	
endmodule
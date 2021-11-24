/* -------------------- ALU SIN FLAGS --------------------
	ALUControl1:0  Function
		00			 	  ADD
		01			 	  SUB
		10			 	  AND
		11			 	  ORR
	-------------------------------------------------------
	Nota: Las ALUFlags corresponden: NZCV
*/

module ALUConFlags #(parameter n = 32)(input  logic [n-1:0] A, B,
												  input  logic [1:0] ALUControl,
												  output logic [n-1:0] out,
												  output logic [3:0] ALUFlags);
	
	logic cOut, xnorOut, xorOut, notOut;
	logic N, Z, C, V;
	

	ALUSinFlags #(n)  aluSinFlags(A, B, ALUControl, out, cOut);
	
	
	//assign V = (A[31] ~^ B[31] ~^ ALUControl[0]) & (A[31] ^ out[31]) & (~ALUControl[1]); //Depende del ancho de los datos A, B y out
	assign V = ((~A[31])&(~B[31])&(~ALUControl[0])) | ((~A[31])&(B[31])&(ALUControl[0])) | 
				  ((A[31])&(~B[31])&(ALUControl[0])) | ((A[31])&(B[31])&(~ALUControl[0])); //Depende del ancho de los datos A, B y out
	assign C = ~ALUControl[1] & cOut;
	assign N = out[31]; //Depende del ancho de los datos.
	assign Z = &(~out);
	
	assign ALUFlags = {N,Z,C,V};
	
			
endmodule
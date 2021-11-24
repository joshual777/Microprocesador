module aluWithDisplays(input logic  [3:0] A, B, 
							  input logic  [2:0] select,							  
							  output logic [13:0] displayOfNumbers,
							  output logic [6:0] displayOfFlags);
							  
	logic Carryflag, NegFlag, ZeroFlag;
	logic [3:0] result;
	
	ALU alu(A, B, {select[2:1],~select[0]}, result, Carryflag, NegFlag, ZeroFlag);
	twoDisplaysNumbers numberDisplays(result, displayOfNumbers);
	signDisplay flagDisplay({Carryflag, NegFlag, ZeroFlag}, displayOfFlags);
	
endmodule 
module conditionalLogicTest();

	logic clk, reset;
	logic [3:0] Cond;	//Código que viene de la instrucción en ejecución.
	logic [3:0] ALUFlags; 	//Flags (NZCV) que vienen desde la ALU. ALUFlags[3:2]-> NZ | ALUFlags[1:0]-> CV
	logic [1:0] FlagW; 		// FlaW[0] -> Para Carry y Overflow Flags. | FlaW[1] -> Para Negative y Zero Flags.
	logic PCS, RegW, MemW;
					  
	logic PCSrc, RegWrite, MemWrite;
	
	conditionalLogic condLogic(clk, reset, Cond, ALUFlags, FlagW, PCS, RegW, MemW,
										PCSrc, RegWrite, MemWrite);
	
	//Creacion de un reloj
	always begin
		clk = 0; #5; clk=~clk; #5;
	end
	
	initial begin
	reset = 1; #1; reset = 0; #4;
	
	// CMP R1,R2 ; Donde R1>R2
	Cond = 4'b1110; PCS = 0; RegW = 0; MemW = 0; FlagW = 2'b11;
	
	ALUFlags = 4'b0010; #5; //El resultado del "CMP R1,R2" genera estos nuevos valores en las flags
	
	//Branch Instruction BGT
	
	Cond = 4'b1100; PCS = 1; RegW = 0; MemW = 0; FlagW = 2'b00; #5;
	
	//---------------------------------------------------------------------------------------------------
	// CMP R1,R2 ; Donde R1>R2
	Cond = 4'b1110; PCS = 0; RegW = 0; MemW = 0; FlagW = 2'b11;
	
	ALUFlags = 4'b0010; #10; //El resultado del "CMP R1,R2" genera estos nuevos valores en las flags
	
	//Branch Instruction BLT
	
	Cond = 4'b1011; PCS = 1; RegW = 0; MemW = 0; FlagW = 2'b00; #5;
	
	end
	
	
endmodule
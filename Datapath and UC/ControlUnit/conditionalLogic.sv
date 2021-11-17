module conditionalLogic(input logic clk, reset,
					  input logic [3:0] Cond,		//Código que viene de la instrucción en ejecución.
					  input logic [3:0] ALUFlags, //Flags (NZCV) que vienen desde la ALU. ALUFlags[3:2]-> NZ | ALUFlags[1:0]-> CV
					  input logic [1:0] FlagW, // FlaW[0] -> Para Carry y Overflow Flags. | FlaW[1] -> Para Negative y Zero Flags.
					  input logic PCS, RegW, MemW,
					  output logic PCSrc, RegWrite, MemWrite);

	//Salida del AND para definir si se tienen o no que actualizar los Flags. FlaWrite[0]-> Para C y V.|FlaWrite[1]-> Para N y Z.
	logic [1:0] FlagWrite;
	//Salida de los registros para que los Flags (NZCV) sean habilitados. Flags[3:2]-> NZ | Flags[1:0]-> CV
	logic [3:0] Flags;
	
	logic CondEx;
	
	flopenr #(2) flagreg1(clk, reset, FlagWrite[1], ALUFlags[3:2], Flags[3:2]); // NZ
	flopenr #(2) flagreg0(clk, reset, FlagWrite[0], ALUFlags[1:0], Flags[1:0]); // CV
	
	// Write controls are conditional
	conditionCheck condCheck(Cond, Flags, CondEx);
	
	assign FlagWrite = FlagW & {2{CondEx}};
	assign RegWrite = RegW & CondEx;
	assign MemWrite = MemW & CondEx;
	assign PCSrc = PCS & CondEx;
	
endmodule
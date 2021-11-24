module datapath(input logic clk, reset,
					 input logic [1:0] RegSrc,
					 input logic RegWrite, MemWrite,
					 input logic [1:0] ImmSrc,
					 input logic ALUSrc,
					 input logic [1:0] ALUControl,
					 input logic MemtoReg,
					 input logic PCSrc,
					 output logic [3:0] ALUFlags,
					 output logic [31:0] PC, //Para poder ver el valor de PC
					 output logic [31:0] ALUResult, ReadOutData, PCNext, Instr, Result, SrcA, SrcB,
					 output logic [3:0] RA1, RA2);  //Muchas salidas para poder ver sus valores: PCNext, Instr, Result, SrcA, SrcB,ALUResult, RA1, RA2.
					 
	//logic [31:0] PCNext, PCPlus4, PCPlus8, Instr, ReadData, WriteData;
	logic [31:0] PCPlus4, PCPlus8, ReadData, WriteData;
	//logic [31:0] ExtImm, SrcA, SrcB;// Result;
	logic [31:0] ExtImm;// Result;
	//logic [3:0] RA1, RA2;
	
	// Next PC logic
	mux2a1 #(32) pcmux(PCPlus4, ALUResult, PCSrc, PCNext);	
	flopr #(32) pcreg(clk, reset, PCNext, PC);
	
	instructionMemory instMem(PC, Instr);
	
	adder #(32) pcadd1(PC, 32'b100, PCPlus4);
	adder #(32) pcadd2(PCPlus4, 32'b100, PCPlus8);
	
	// Register file logic
	mux2 #(4) ra1mux(Instr[19:16], 4'b1111, RegSrc[0], RA1);
	mux2 #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], RA2);
	
	regfile rf(clk, RegWrite, RA1, RA2,
					Instr[15:12], Result, PCPlus8,
					SrcA, WriteData);		
	extend ext(Instr[23:0], ImmSrc, ExtImm);
	
	// ALU logic
	mux2 #(32) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);
	ALUConFlags alu(SrcA, SrcB, ALUControl, ALUResult, ALUFlags);
	
	dataMemory outDataMemory(clk, MemWrite, ALUResult[7:0], WriteData, ReadOutData);
	ROM32 romInputData(ALUResult[10:0], ReadData);
	
	mux2 #(32) resmux(ALUResult, ReadData, MemtoReg, Result);
	
endmodule
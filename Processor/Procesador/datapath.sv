 module datapath(input logic clk, reset,
					 input logic [1:0] RegSrc,
					 input logic RegWrite, MemWrite,
					 input logic [1:0] ImmSrc,
					 input logic ALUSrc,
					 input logic [1:0] ALUControl,
					 input logic MemtoReg,
					 input logic PCSrc,
					 input logic[7:0] addressForVga,
					 output logic [3:0] ALUFlags,
					 output logic [31:0] rdataForVga,
					 output logic [31:0] ReadOutData,
					 output logic [31:0] PC, Result, Instr); //Salidas que solo se quieren observar.
					 
	
	logic [31:0] PCNext, PCPlus4, PCPlus8, WriteData, ALUResult;
	
	logic [31:0] ExtImm, SrcA, SrcB;
	logic [3:0] RA1, RA2;
	mux2 #(32) pcmux(PCPlus4, Result, PCSrc, PCNext);	
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
	
	mux2 #(32) resmux(ALUResult, ReadOutData, MemtoReg, Result);
	
endmodule


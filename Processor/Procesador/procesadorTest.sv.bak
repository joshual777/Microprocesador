module procesadorTest();
	
	logic clk, reset;
			  
	logic [31:0] ReadOutData; //UNICA salida "real" del procesador
			  
	logic [31:0] PC, Result, Instr; // Salidas que se quieren ver del datapath
	logic [3:0] ALUFlags;			  // Salidas que se quieren ver de la unidad de control
	logic PCSrc, MemtoReg, MemWrite, ALUSrc, RegWrite; //Salidas que se quieren ver de la unidad de control
	logic [1:0]  ALUControl, ImmSrc, RegSrc; //Salidas que se quieren ver de la unidad de control
	
	// instantiate device to be tested
	arm ARM(clk, reset,
			  ReadOutData,
			  PC, Result, Instr,
			  ALUFlags,
			  PCSrc, MemtoReg, MemWrite, ALUSrc, RegWrite,
			  ALUControl, ImmSrc, RegSrc);
			  
	// generate clock to sequence tests
	always begin
	clk <= 0; # 5; clk <= 1; #5;
	end
	
	
	initial begin 
		#5; reset = 1; #1; reset = 0;
		
	end
			  
	
	
endmodule
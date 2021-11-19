module procesadorTest();
	
	logic clk, reset, mostrarLetra;
	logic [31:0] rdataForVga;
	logic [31:0] ReadOutData; //UNICA salida "real" del procesador
			  
	logic [31:0] PC, Result, Instr; // Salidas que se quieren ver del datapath
	logic [3:0] ALUFlags;			  // Salidas que se quieren ver de la unidad de control
	logic PCSrc, MemtoReg, MemWrite, ALUSrc, RegWrite; //Salidas que se quieren ver de la unidad de control
	logic [1:0]  ALUControl, ImmSrc, RegSrc; //Salidas que se quieren ver de la unidad de control
	
	logic [6:0] segments;
	
	// instantiate device to be tested
	armForTest ARM(clk, reset, mostrarLetra,
			  rdataForVga,
			  ReadOutData,
			  PC, Result, Instr,
			  ALUFlags,
			  PCSrc, MemtoReg, MemWrite, ALUSrc, RegWrite,
			  ALUControl, ImmSrc, RegSrc,
			  segments);
			  
	// generate clock to sequence tests
	always begin
	clk <= 0; # 5; clk <= 1; #5;
	end
	
	
	initial begin 
		#5; reset = 1; #1; reset = 0;
		
		
		
		#60; 
		mostrarLetra = 0; #1; mostrarLetra = 1;
		
	end
			  
	
	
endmodule
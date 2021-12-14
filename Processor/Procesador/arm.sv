module arm(input logic clk, reset, mostrarLetra,
			  			//Salidas que se quieren ver de la unidad de control
			  output logic [6:0] segments
			  );
			  
	//logic [3:0] ALUFlags;	
	//logic 		PCSrc, MemtoReg, MemWrite, ALUSrc, RegWrite;
	//logic [1:0] ALUControl, ImmSrc, RegSrc;
	
	logic [31:0] ReadOutData, rdataForfpga; //fpga/UNICA salida "real" del procesador
	logic [31:0] PC, Result, Instr; // Salidas que se quieren ver del datapath
	logic [3:0] ALUFlags;			  // Salidas que se quieren ver de la unidad de control
	logic PCSrc, MemtoReg, MemWrite, ALUSrc, RegWrite; //Salidas que se quieren ver de la unidad de control
	logic [1:0]  ALUControl, ImmSrc, RegSrc;
	logic[7:0] addressForVga;	
	
	controller c(clk, reset, Instr[31:12], ALUFlags,
					 RegSrc, RegWrite, ImmSrc,
					 ALUSrc, ALUControl,
					 MemWrite, MemtoReg, PCSrc);
	
	datapath dp(clk, reset,
					RegSrc, 
					RegWrite, MemWrite, 
					ImmSrc,
					ALUSrc, 
					ALUControl,
					MemtoReg, 
					PCSrc,
					addressForVga,					
					ALUFlags, 
					rdataForfpga,
					ReadOutData, 
					PC, Result, Instr); // Salidas que solo se 
	deco_datos mostrarDatos(clk, mostrarLetra, rdataForVga, addressForfpga, segments);
	
endmodule
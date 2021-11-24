module datapathTest();
	logic clk, reset;
	
	logic RegWrite, MemWrite; //Enables
	
	logic MemtoReg, PCSrc, ALUSrc; // Selectors
	logic [1:0] RegSrc;				 // Selector
	
	logic [1:0] ImmSrc, ALUControl; //Señales de seleccion
	
	logic [3:0] ALUFlags; //out
	logic [31:0] PC, ALUResult, ReadOutData, PCNext, Instr, Result, SrcA, SrcB; //out
	logic [3:0] RA1, RA2;
	
	// instantiate device to be tested
	datapath dp(clk, reset, RegSrc, RegWrite, MemWrite, ImmSrc, ALUSrc, ALUControl, 
					MemtoReg, PCSrc, 
					ALUFlags, PC, ALUResult, ReadOutData, PCNext, Instr, Result, SrcA, SrcB, RA1, RA2);
	
	
	// generate clock to sequence tests
	always begin
	clk <= 0; # 5; clk <= 1; #5;
	end

	
	// initialize test
	initial begin
		#5; reset <= 1; #1; reset <= 0;
		
		
		//----------------------------------------- EJEMPLO 1 ---------------------------------------------
		/*
			ADD R1, R15, #0 ; R1 = 8 + 0 = 8
			ADD R2, R1, #5  ; R2 = 8 + 5 = 13
			SUB R3, R2, #2  ; R3 = 13 - 2 = 11
			ADD R4, R3, R2  ; R4 = 13 + 11 =	24
		*/
		/*
		//ADD R1, R15, #0
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  1; 
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;
		
		//ADD R2, R1, #5
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  1;
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#10;
		
		//SUB R3, R2, #2
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  1;
		ALUControl = 01; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#10;
		
		
		//ADD R4, R3, R2
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0;
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#10;		
		*/
		
		//----------------------------------------- EJEMPLO 2 -----------------------------------------
		
		/*	
			SUB R0, R15,R15
			ADD R1, R0, #5 
			ADD R2, R0, #2 
			
			SUBS R3, R1, R2
			BLT R2ESMAYOR
			
			SUB R4,R1,R2
			EOR R7,R1,R4
			ADD R6,R2,R7	
			B FIN
		R2ESMAYOR:
			ADD R4,R1,R2
			ADD R7,R4,#3
			EOR R6,R1,R7
		FIN:
			ADD R5, R4,R4				
		*/
		
		/*
		//SUB R0, R15, R15
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0;
		ALUControl = 01; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#8;			
			
		//ADD R1, R0, #5
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  1; 
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;
		
		//ADD R2, R0, #2 			
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  1;
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;	
	
		//SUBS R3, R1, R2
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0;
		ALUControl = 01; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;	
				
		//BLT R2ESMAYOR
		#1;
		RegSrc = 01; RegWrite = 0; ImmSrc =  10; ALUSrc =  1;
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 1;
		#10;
	
		
		//SUB R4,R1,R2
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0;
		ALUControl = 01; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;	
		
		//EOR R7,R1,R4
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0;
		ALUControl = 10; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;
		
		//ADD R6,R2,R7
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0;
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;
		
		//B FIN
		#1;
		RegSrc = 01; RegWrite = 0; ImmSrc =  10; ALUSrc =  1;
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 1;
		#9;

		//ADD R4,R1,R2 -> R2ESMAYOR: 	
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0; 
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;
		
		//ADD R7,R4,#3
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  1; 
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;		
		
		//EOR R6,R1,R7
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0; 
		ALUControl = 10; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;
		
		//ADD R5, R4,R4 -> FIN
		 #1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0; 
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;		
		*/
		
			
		//--------------------------------- EJEMPLO 3 -----------------------------------------
		
		/*
		SUB R0, R15, R15 // R0 = 0
				
		LDR R1, [R0] // Donde guardar lo que viene de memoria -> R1 = 5
		ADD R2, R1, #3 //Prueba de que se trajo el dato de la memoria -> R2 = 8
		STR R2, [R0] // Guardar el resultado obtenido en memoria -> 0x000: 8					
		*/
		
		//SUB R0, R15, R15 ;Direccion de memoria
		
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  0;
		ALUControl = 01; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;			
		
		//LDR R1, [R0]
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  01; ALUSrc =  1;
		ALUControl = 00; MemWrite = 0; MemtoReg = 1; PCSrc = 0;
		#9;			
		
		
		//ADD R2, R1, #3
		#1;
		RegSrc = 00; RegWrite = 1; ImmSrc =  00; ALUSrc =  1;
		ALUControl = 00; MemWrite = 0; MemtoReg = 0; PCSrc = 0;
		#9;
		
		
		//STR R2, [R0] 
		#1;
		RegSrc = 10; RegWrite = 0; ImmSrc =  01; ALUSrc =  1;
		ALUControl = 00; MemWrite = 1; MemtoReg = 1; PCSrc = 0;
		#9;			
		
	
	end

endmodule

/*
	Instr[31:28] -> Condition (Cond)
	Instr[27:26] -> Operation Code (Op)
	Instr[25:20] -> Function (Funct)
	Instr[15:12] -> Rd
	
	
	RegSrc[1]->  Selector del MUX de RA2| RegSrc[0]-> Selector del MUX de RA1
	
*/


/*
	----------------- Algunos codigos maquinas -----------------
	
	Instrucción: MVN R5,R2 - Not
 
	Codigo Maquina:
	1110_00_011110_0000_0101_0000_0000_0010
	E1E05002

	Cond: 1110 -> Incondicional
	Op: 00 -> DP - Inst
	Funct: 0_1111_0 -> I: 0 | cmd: 1111 | S: 0
	Rn: 0000 
	Rd: 0101  -> R5
	Scr2: 0000_0000_0010 -> R2

	El NOT se le aplica al operando de SrcB
	-------------------------------------------------------------

	Instrucción: EOR R2,R2,R3
 
	Codigo Maquina:
	1110_00_000010_0010_0010_0000_0000_0011
	E0222003
	
	Cond: 1110 -> Incondicional
	Op: 00 -> DP-Inst
	Funct: 0_0001_0 -> I: 0 | cmd: 0001 | S: 0
	Rn: 0010 -> R2
	Rd: 0010 -> R2
	Scr2: 0000_0000_0011 -> R3
	
*/


module controllerTest();

	logic clk,reset;
	logic [31:12] Instr;
	logic [3:0] ALUFlags; //NZCV
						
	logic [1:0] RegSrc; 
	logic RegWrite;
	logic [1:0] ImmSrc;
	logic ALUSrc;
	logic [1:0] ALUControl;
	logic MemWrite, MemtoReg;
	logic PCSrc;
	
	controller ctllr(clk, reset, Instr, ALUFlags, 
						  RegSrc, RegWrite, ImmSrc, ALUSrc, ALUControl, MemWrite, MemtoReg, PCSrc);


	
	//Creacion de un reloj
	always begin
		clk = 0; #5; clk=~clk; #5;
	end
		
	
	initial begin
	
		reset = 1; #1; reset = 0; #4; //Se resetea los registros que permiten o no la actualizacion de los flags.
		
	// Ejemplo 1
		Instr = 20'hE04F0; #10; // SUB R0, R15, R15 ; R0 = 0
		
		Instr = 20'hE2801; #10; // ADD R1, R0, #2 ; R1 = 2
		
		Instr = 20'hE2802; #10; // ADD R2, R0, #5 ; R2 = 5
		
		Instr = 20'hE2804; #10; // ADD R4, R0, #0x00
		
		Instr = 20'hE0519; #5;  // SUBS R9, R1,R2
		ALUFlags = 4'b1000; #5; // NZCV 
		
		Instr = 20'hDA000; #10;  // BLE R2ESMAYOR 
		
		Instr = 20'hE0413; #10;  // SUB R3,R1, R2   		
		Instr = 20'hEA000; #10;  // B FIN		   
		Instr = 20'hE0813; #10;  // ADD R3, R1, R2  
		Instr = 20'hE5843; #10;  // STR R3, [R4]		
		
		
	end
	
						  
endmodule
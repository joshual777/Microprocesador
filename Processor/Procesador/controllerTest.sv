/*
	Instr[31:28] -> Condition (Cond)
	Instr[27:26] -> Operation Code (Op)
	Instr[25:20] -> Function (Funct)
	Instr[15:12] -> Rd
	
	
	RegSrc[1]->  Selector del MUX de RA2| RegSrc[0]-> Selector del MUX de RA1
	
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
		 clk=~clk; #5;
	end
		
	
	initial begin
	
		reset = 1; #1; reset = 0; #4; //Se resetea los registros que permiten o no la actualizacion de los flags.
		clk = 0; #5;
	// Ejemplo Fuerza Bruta
		Instr = 20'he3a00000; #10; // mov r0, #0
		Instr = 20'he3a01000; #10; // mov r1, #0
		Instr = 20'he3a02000; #10; // mov r2, #0
		Instr = 20'he59f3214; #10; // ldr r3, lorem
		Instr = 20'he59f4214; #10; // ldr r4, cadena
		Instr = 20'he7d45000; #10; // ldrb r5, [r4,r0] 
		Instr = 20'he3550000; #10; // CMP r5, #00000000   		
		Instr = 20'h0a00000e; #10; // beq fin		   
		Instr = 20'he7d36001; #10; // ldrb r6, [r3,r1] 
		Instr = 20'he2800001; #10; // add r0, r0, #1		
		Instr = 20'he1560005; #10; // CMP r6, r5
		Instr = 20'h1a000005; #10; // bne verifica
		Instr = 20'he3510004; #10; // CMP r1, #4
		Instr = 20'h1a000006; #10; // bne aumenta
		Instr = 20'he2822001; #10; // add r2, r2, #1
		Instr = 20'he0400001; #10; // sub r0, r0, r1
		Instr = 20'he3a01000; #10; // mov r1, #0
		Instr = 20'heafffff2; #10; // b busqueda
		Instr = 20'he0400001; #10; // sub r0, r0, r1
		Instr = 20'he3a01000; #10; // mov r1, #0
		Instr = 20'heaffffef; #10; // b busqueda
		Instr = 20'he2811001; #10; // add r1, r1, #1
		Instr = 20'heaffffed; #10; // b busqueda
		Instr = 20'heafffffe; #10; // b fin
		#50;
	// Ejemplo KMP
	   Instr = 20'he3a00000; #10; // mov r0, #0
		Instr = 20'he3a01000; #10; // mov r1, #0
		Instr = 20'he3a02000; #10; // mov r2, #0
		Instr = 20'he59f3214; #10; // ldr r3, lorem
		Instr = 20'he59f4214; #10; // ldr r4, cadena
		Instr = 20'he3550000; #10;	//mov r1, #0
		Instr = 20'hea000001; #10; // b busqueda 
		Instr = 20'he2811001; #10; // add r1, r1, #1
		Instr = 20'hea000001; #10; // b busqueda 
		Instr = 20'he3a01000; #10; // ldrb r5, [r4,r0] 
		Instr = 20'he3550000; #10; // CMP r5, #00000000   		
		Instr = 20'h0a00000e; #10; // beq fin		   
		Instr = 20'he7d36001; #10; // ldrb r6, [r3,r1] 
		Instr = 20'he2800001; #10; // add r0, r0, #1		
		Instr = 20'he1560005; #10; // CMP r6, r5
		Instr = 20'h1a000005; #10; // bne verifica
		Instr = 20'he3510004; #10; // CMP r1, #4
		Instr = 20'h1a000006; #10; // bne aumenta
		Instr = 20'he2822001; #10; // add r2, r2, #1
		Instr = 20'he3a01000; #10; // mov r1, #0
		Instr = 20'heafffff2; #10; // b busqueda
		Instr = 20'heafffffe; #10; // b fin
	end
	
						  
endmodule
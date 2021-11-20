module decoder(input logic [1:0] Op,
					input logic [5:0] Funct,
					input logic [3:0] Rd,
					output logic [1:0] FlagW,
					output logic PCS, RegW, MemW,
					output logic MemtoReg, ALUSrc,
					output logic [1:0] ImmSrc, RegSrc, ALUControl); // RegSrc[1]->  Selector del MUX de RA2| RegSrc[0]-> Selector del MUX de RA1
					
	logic [9:0] controls;
	logic Branch, ALUOp;
	
	// Main Decoder
	always_comb
		casex(Op)
						// Se encarga de las instrucciones de procesamiento
			2'b00: if (Funct[5]) controls = 10'b00_00_1_0_1_0_0_1; //Valida que se requiera un inmediato y se manda un 1 en ALUSrc MUx y se escoge el inmediato
						
					else controls = 10'b00_00_0_0_1_0_0_1;// Por el contrario no se necesita el inmediato, se envia un 0 y se escoge el RD2 del register (es decir un registro)
					
					
					//Se encarga de las instrucciones de memoria Revisa valor de B, puesto que los algoritmos solo tienen LDR/LDRD
						
			2'b01: if (Funct[2]) controls = 10'b00_01_0_1_1_0_0_0; // LDRD con L=1 !I =1, U=1, P=1, w=0 este lleva offset y trabaja con registro
			
					else controls = 10'b01_01_1_1_1_0_0_0; // LDR con L =1, !I=0, U=1, P=0, w=1 este no lleva offset y trabaja con inmediato
						
						
				// Se encarga de las instrucciones de Saltos 
			2'b10: controls = 10'b11_10_1_0_0_0_1_0;// aqui siempre mantengo L en 0, hay un 1 en ALUSrc y por tanto un inmedisto de 10 y un registerSRc de 11 que jala el R15 y ademas toma del 15:12
						// Unimplemented
			default: controls = 10'bx;
		endcase
	// 10'b00_00_1_0_1_0_0_1
	assign {RegSrc, ImmSrc, ALUSrc, MemtoReg, RegW, MemW, Branch, ALUOp} = controls;
	
	// ALU Decoder
	always_comb
		if (ALUOp) // Si el ALUOp es 1, esto implica que la intrucción en ejecución es de tipo Data Processing Instruction. (DP-Inst)
			begin 	//Command
				case(Funct[4:1]) //En las DP-Inst se puede decidir la operación que la ALU realizará. Esto, segun los codigos de Command
					4'b0100: ALUControl = 2'b00; // ADD
					4'b0010: ALUControl = 2'b01; // SUB
					4'b0001: ALUControl = 2'b10; // XOR
					4'b1111: ALUControl = 2'b11; // NOT
					default: ALUControl = 2'bx; // unimplemented
				endcase
				
				// Update flags if S bit is set(S = 1).
				FlagW[1] = Funct[0]; // Actualiza N & Z flags.
				FlagW[0] = Funct[0] & (ALUControl == 2'b00 | ALUControl == 2'b01); //(Actualiza C & V si S = 1 y la operación es arith).
			end 
		else 
			begin
				// Siempre se realiza un ADD para non-DP instructions. En otras palabras, todos las operaciones que involucren
				// direcciones de memoria como sus operandos, solo pueden hacer offset positivos.
				ALUControl = 2'b00;
				// Para no-DP Instructions(Memory Inst y Branch Inst) las flags no tienen ningun sentido. Por tanto, no es necesario actualizarlas.
				FlagW = 2'b00; 
			end
	
	// PC Logic
	assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule 
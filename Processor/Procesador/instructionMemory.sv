/* 
	Instruction Memory.
	Set Default ARM Instructions
*/

module instructionMemory(input logic[7:0] address, //Memory Address in range [0-255] -> 2^8
								 output logic[31:0] data	  //Read data value -> read value port 
								 );
	always @*
		case(address)
			8'h00: data = 32'he04f000f; // SUB R0, R15, R15 ; R0 = 8 - 8 = 0  (Direccion 0x00)
			8'h04: data = 32'he5902000; // LDR R2, [R0]     ; R2 = 1 (Operacion Xor)
			8'h08: data = 32'he5903004; // LDR R3, [R0, #4] ; R3 = 2 (Operando dos para la operacion XOR)
			8'h0c: data = 32'he5904008; // LDR R4, [R0, #8]	; R4 = 00100110 (Condicion de parada -> &)
			
			8'h10: data = 32'he280100c; // ADD R1, R0, #12  ; Direccion del primer caracter
			8'h14: data = 32'he2525002; // SUBS R5, R2, #2  ; 
			8'h18: data = 32'hca00000f; // BGT suma // si R2 es mayor a 2 -> suma
			8'h1c: data = 32'h0a000007; // BEQ not  // si R2 es igual a 2 -> not
			
			8'h20: data = 32'heaffffff; // B xor  // sino -> xor
		
			// XOR 
			8'h24: data = 32'he5912000; // LDR R2, [R1]      //; carga el caracter
			8'h28: data = 32'he0222003; // EOR R2, R2, R3
			8'h2c: data = 32'he5812000; // STR R2, [R1]      //; almacenar el caracter cifrado
			
			8'h30: data = 32'he2811004; // ADD R1, R1, #4    //; aumenta la memoria
			8'h34: data = 32'he0525004; // SUBS R5, R2, R4
			8'h38: data = 32'h1afffff9; // BNE xor
			8'h3c: data = 32'hea00000d; // B	  fin
			
			// NOT
			8'h40: data = 32'he5912000; // LDR R2, [R1]      //; carga el caracter
			8'h44: data = 32'he1e02002; // MVN R2, R2        //; not al caracter
			8'h48: data = 32'he5812000; // STR R2, [r1]      //; almacenar el caracter cifrado
			8'h4c: data = 32'he2811004; // ADD R1, R1, #4    //; aumenta la memoria
			
			8'h50: data = 32'he0525004; // SUBS R5, R2, R4
			8'h54: data = 32'h1afffff9; // BNE not
			8'h58: data = 32'hea000006; // B	  fin
			
			// SUMA
			8'h5c: data = 32'he5912000; // LDR R2, [R1]      //; carga el caracter
			8'h60: data = 32'he2422002; // SUB R2, R2, #2
			8'h64: data = 32'he5812000; // STR R2, [R1]      //; almacenar el caracter cifrado
			8'h68: data = 32'he2811004; // ADD R1, R1, #4    //; aumenta la memoria
			
			8'h6c: data = 32'he0525004; // SUBS R5, R2, R4
			8'h70: data = 32'h1afffff9; // BNE suma
			8'h74: data = 32'heaffffff; // B	  fin
			
			// FIN
			8'h78: data = 32'h11111111; //
			8'h7c: data = 32'h00000000; //
			
			8'h80: data = 32'h00000000; //
			8'h84: data = 32'h00000000; //
			8'h88: data = 32'h00000000; //
			8'h8c: data = 32'h00000000; //
			
			8'h90: data = 32'h00000000; //
			8'h94: data = 32'h00000000; //
			8'h98: data = 32'h00000000; //
			8'h9c: data = 32'h00000000; //
			
			8'ha0: data = 32'h00000000; //
			8'ha4: data = 32'h00000000; //
			8'ha8: data = 32'h00000000; //
			8'hac: data = 32'h00000000; //
			
			8'hb0: data = 32'h00000000; //
			8'hb4: data = 32'h00000000; //
			8'hb8: data = 32'h00000000; //
			8'hbc: data = 32'h00000000; //
			
			8'hc0: data = 32'h00000000; //
			8'hc4: data = 32'h00000000; //
			8'hc8: data = 32'h00000000; //
			8'hcc: data = 32'h00000000; //
		
			8'hd0: data = 32'h00000000; //
			8'hd4: data = 32'h00000000; //
			8'hd8: data = 32'h00000000; //
			8'hdc: data = 32'h00000000; //
			
			8'he0: data = 32'h00000000; //
			8'he4: data = 32'h00000000; //
			8'he8: data = 32'h00000000; //
			8'hec: data = 32'h00000000; //
			
			8'hf0: data = 32'h00000000; //
			8'hf4: data = 32'h00000000; //
			8'hf8: data = 32'h00000000; //
			8'hfc: data = 32'h00000000; //
			
			default: data = 32'h00000000;//;
			
			
		endcase 

endmodule
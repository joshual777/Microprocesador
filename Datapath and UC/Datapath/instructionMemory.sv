/* 
	Instruction Memory.
	Set Default ARM Instructions
*/

module instructionMemory(input logic[7:0] address, //Memory Address in range [0-255] -> 2^8
								 output logic[31:0] data	  //Read data value -> read value port 
								 );
	always @*
		case(address)
			8'h00: data = 32'hE04F000F; // SUB R0, R15,R15  ; R0 = 8 - 8 = 0
			8'h04: data = 32'hE5901000; // LDR R1, [R0] 		; R1 = 5 | ROM32 -> 0x0:5
			8'h08: data = 32'hE2812003; // ADD R2, R1, #3	; R2 = 8
			8'h0c: data = 32'hE5802000; // STR R2, [R0] 		; RAM -> 0x0: 8
			
			8'h10: data = 32'h00000000; // 
			8'h14: data = 32'h00000000; // 
			8'h18: data = 32'h00000000; // 
			8'h1c: data = 32'h00000000; // 
			
			8'h20: data = 32'h00000000; // 
			8'h24: data = 32'h00000000; // 
			8'h28: data = 32'h00000000; // 
			8'h2c: data = 32'h00000000; // 
			
			8'h30: data = 32'h00000000; // 
			8'h34: data = 32'h00000000; //
			8'h38: data = 32'h00000000; //
			8'h3c: data = 32'h00000000; //
			
			8'h40: data = 32'h00000000; //
			8'h44: data = 32'h00000000; //
			8'h48: data = 32'h00000000; //
			8'h4c: data = 32'h00000000; //
			
			8'h50: data = 32'h00000000; //
			8'h54: data = 32'h00000000; //
			8'h58: data = 32'h00000000; //
			8'h5c: data = 32'h00000000; //
			
			8'h60: data = 32'h00000000; //
			8'h64: data = 32'h00000000; //
			8'h68: data = 32'h00000000; //
			8'h6c: data = 32'h00000000; //
			
			8'h70: data = 32'h00000000; //
			8'h74: data = 32'h00000000; //
			8'h78: data = 32'h00000000; //
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
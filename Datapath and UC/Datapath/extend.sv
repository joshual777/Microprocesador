module extend(input logic [23:0] Instr, //Se toma siempre el numero mas alto de bits en un immediato para no perder nunca informacion.
				  input logic [1:0] ImmSrc,
				  output logic [31:0] ExtImm);
	always_comb
		case(ImmSrc)
			// 8-bit unsigned immediate to data-proccesing instructions
			2'b00: ExtImm = {24'b0, Instr[7:0]}; 
			// 12-bit unsigned immediate to memory instructions
			2'b01: ExtImm = {20'b0, Instr[11:0]};
			// 24-bit two's complement shifted branch. 
			2'b10: ExtImm = {{6{Instr[23]}}, Instr[23:0], 2'b00}; //La extension consta de replicar el bit mas significativo del immediato 6 veces y agregar dos ceros como los LSB del numero (El shift)
			default: ExtImm = 32'bx; // undefined
		endcase
	
endmodule
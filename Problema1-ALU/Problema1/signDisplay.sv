module signDisplay(input logic [2:0] flags_C_N_Z, output logic [6:0] displays);			
	always_comb			
		case(flags_C_N_Z)			
			//								     6543210
			3'b001:			displays = 7'b0000110; // Desplejar una E de Equals
			3'b010:			displays = 7'b0111111; // Desplejar un minus sign (-)
			3'b100:			displays = 7'b1000110; // Desplejar una C del Carry
			
			default: 		displays = 7'b1111111; // Si es un valor diferente ninguno se enciende
		endcase
endmodule
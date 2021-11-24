// ShiftRight
module shiftRight(a,out);

	//-- Parametro:
	parameter n = 4;     //-- Número de bits del registro

	// Entradas
	input [n-1:0] a;
   
	// Salidas
	output [n-1:0] out;
	
	assign out = a >> 1;	//-- Corrimiento a la derecha 1 bit
	
endmodule

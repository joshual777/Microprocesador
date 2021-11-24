/* 
	Memoria de datos.
	Contiene el texto previamente cargado
*/

module dataMemory(input logic clk,
					input logic we, 	//Señal de Write Enable (permitir escritura)
					input logic[7:0] address, //posición de memoria -> 0 - 255 -> 2^8
					input logic [31:1] wdata, //Write data value -> Write value port
					input logic contadorWriteData,
					output logic contadoReadD,
					output logic [31:1] rdata);//Read data value -> read value port 
	
	logic [7:0] RAM[255:0]; //255 celdas de 8-bit cada uno de ellas. Cada celda se accede de la forma: RAM[<numeroDelaCelda>]

		
	//Para la ESCRITURA en la memoria unicamente cuando se de el posedge del CLK y el write enable = 1.
	always_ff @(negedge clk)
		if (we) {RAM[address],RAM[address+1], RAM[address+2], RAM[address+3] } <= wdata;
		
	//Para la LECTURA del contenido en la RAM. 
	//Si WE = 0, no se está haciendo una potencial escritura, y por tanto, se puede tomar el dato en la dirección a la que se apunta en address.
	//assign rdata = (we == 1'b0) ? {RAM[address],RAM[address+1], RAM[address+2], RAM[address+3]}  : 32'b0; 
	assign rdata = {RAM[address],RAM[address+1], RAM[address+2], RAM[address+3]};

	
	
endmodule
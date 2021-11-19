/* 
	Se tienen 3 puertos para "señalar" registros: A1, A2, A3 
	
	Los puertos A1 y A2 se leen combinacionalmente. 
	A1 y A2 señalan 2 registros que serán LEIDOS de la salida RD1 y RD2 respectivamente.
	
	El tercer puerto A3 señala una direccion que será ESCRITA en el Flanco positivo del CLK.
		
	El contenido de la entrada r15 nunca se almacena, solo se pone en la salida cuando se está 
	apuntando a está dirección ya sea en A1 o en A2. Ver lineas 28 y 29.
*/

module regfile(input logic clk,
					input logic we3, 	//Señal de Write Enable (permitir escritura)
					input logic [3:0] ra1, ra2, wa3,
					input logic [31:0] wd3, r15, //wd3: Valor a escribirse en el registro señalado por Wa3. si we3 = 1 
					output logic [31:0] rd1, rd2);
	
	logic [31:0] rf[14:0]; //15 registros de 32-bit cada uno de ellos(De R0 a R14). Cada registro se accede de la forma: rf[<numeroDelRegistro>]

	
	
	//Para la ESCRITURA en el Registro señalado en el Puerto A3 unicamente cuando se de el posedge del CLK y el enable este en 1.
	always_ff @(negedge clk)
		if (we3) rf[wa3] <= wd3;
		
	//Para la LECTURA del contenido en los registros. 
	assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];
	
endmodule
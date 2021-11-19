module deco_datos(
	input logic clock,
	input logic mostrarLetra,
	input [31:0] rdataForVga,
	output logic[7:0] addressForVga,
	output logic [6:0] segments
	);
	
	int contador = 12;  // Los datos de la memoria RAM comienzan en 0x12
	
	always @(posedge mostrarLetra)
		if (mostrarLetra)
			begin
				contador <= 16;
			end

	always @(negedge clock)
	 begin
	  case (rdataForVga) 
		// gfedcba
		32'b00000000000000000000000001001000 : begin segments = 7'b0001001; end  // H
		32'b00000000000000000000000001001111 : begin segments = 7'b1000000; end  // O
		32'b00000000000000000000000000000011 : begin segments = 7'b0110000; end 
		default : begin segments = 7'b1000000; end 
	  endcase
	 end
	 
	 // 7'b1000000; -> 0; 7'b1111001; -> 1
	 
	 assign addressForVga = contador;
	 
	
	/*
	always @(posedge clock)
		if (mostrarLetra)
			begin
				if (rdataForVga != 32'b00000000000000000000000000100110 )
					contador <= contador + 4;
			end
			
	assign addressForVga = contador;
	
	*/
 
endmodule

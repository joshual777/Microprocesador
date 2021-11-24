module muxResults 
	#(parameter N=4)
	 (input logic  [N-1:0] input0,input1,input2,input3,input4,input5,input6,
	  input logic  [2:0] selector,
	  output logic [N-1:0] out);
		
	 
	 //Seleccion de salida
	always_comb
		case(selector)
			4'd0: // Suma
				out = input0;
					 
			4'd1: // Resta
				out = input1;
					 
			4'd2: // AND
				out = input2;
					 
		   4'd3: // OR
				out = input3;
					 
			4'd4: // Logical xor
				out = input4;
					 
			4'd5: // Logical shift left
				out = input5;
					 
			4'd6: // Logical shift right
				out = input6;
					 
			default: 
				out = 'b0;
	endcase
		 
	 
endmodule

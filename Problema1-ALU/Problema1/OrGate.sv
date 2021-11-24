module OrGate #(parameter N = 4)//-- Número de bits en la entrada de la OR
					(input logic [N-1:0] d1,d2, output logic [N-1:0] out);


assign out = d1 | d2;

endmodule

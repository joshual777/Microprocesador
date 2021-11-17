module mux2a1 #(parameter WIDTH = 4)
				 (input logic [WIDTH-1:0] d0, d1,
				  input logic s,
				  output logic [WIDTH-1:0] out);
	always_comb 
		case(s)
			1'b0: out = d0;
			1'b1: out = d1;
		endcase
	//assign out = s ? d1 : d0;
endmodule
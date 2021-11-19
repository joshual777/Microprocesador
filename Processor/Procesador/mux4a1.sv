module mux4a1 #(parameter WIDTH = 4)
					(input logic [WIDTH-1:0] d0,d1,d2,d3, 
					 input logic [1:0]s, 
					 output logic [WIDTH-1:0] out);
	always_comb
		case(s)
			2'd0: out = d0;
			2'd1: out = d1;
			2'd2: out = d2;
			2'd3: out = d3;
		endcase
endmodule
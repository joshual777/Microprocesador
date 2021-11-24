// DIVISION
module division #(parameter N=4)
				     (input logic [N-1:0] d1, d2, output logic [N-1:0] out);

	assign out = d1/d2;

endmodule
	
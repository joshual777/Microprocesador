module inv #(parameter N=4)
				(input logic [N-1:0] a,
				output logic [N-1:0] y);
				
	assign y = ~a;
endmodule
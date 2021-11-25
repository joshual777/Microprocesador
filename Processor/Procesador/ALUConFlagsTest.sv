module ALUConFlagsTest();

	logic [31:0] A, B;
	logic [1:0] ALUControl;
	logic [31:0] out;
	logic [3:0] ALUFlags;
					

	
	// instantiate device to be tested
	ALUConFlags ALUConFlagsForTest(A, B,ALUControl,out,
			  ALUFlags);
	
	
	initial begin 		
		
		
		#10; 
		A = 32'b00000001; 
		B = 32'b10000001;
		ALUControl	= 2'b00;
		#10; 
		A = 32'b00010001; 
		B = 32'b10001001;
		ALUControl	= 2'b01;
		#10; 
		A = 32'b10010001; 
		B = 32'b11101001;
		ALUControl	= 2'b10;
		#10; 
		A = 32'b100000000010001; 
		B = 32'b111111010001001;
		ALUControl	= 2'b11;
		
		
	end
			  
	
	
endmodule
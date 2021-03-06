module decoderTest();

	logic [1:0] Op;
	logic [5:0] Funct;
	logic [3:0] Rd;
	logic [1:0] FlagW;
	logic PCS, RegW, MemW;
	logic MemtoReg, ALUSrc;
	logic [1:0] ImmSrc, RegSrc, ALUControl;
					

	
	// instantiate device to be tested
	 decoder decoderForTest(Op, Funct, Rd,
			  Flagw,
			  PCS, RegW, MemW,
			  MemtoReg, ALUSrc,
			  ImmSrc, RegSrc, ALUControl);
	
	
	initial begin 		
		
		
		#10; 
		Op = 2'b00; 
		Funct = 6'b000000; 
		Rd= 4'b0000;		
		#10;
		Op = 2'b01; 
		Funct = 6'b000000; 
		Rd= 4'b0000;
		#10;
		Op = 2'b01; 
		Funct = 6'b000000; 
		Rd= 4'b0010;
		#10;
		Op = 2'b01; 
		Funct = 6'b000100; 
		Rd= 4'b0010;
		
		
	end
			  
	
	
endmodule
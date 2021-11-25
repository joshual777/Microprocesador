module extendTest();

	logic [23:0] Instr;
	logic [1:0] ImmSrc;
	logic [31:0] ExtImm;
					

	
	// instantiate device to be tested
	extend extendForTest(Instr, ImmSrc,
			  ExtImm);
	
	
	initial begin 		
		
		
		#10; 
		Instr = 20'he0400001; 
		ImmSrc = 2'b00; 
		#10; 
		Instr = 20'he0400501; 
		ImmSrc = 2'b01;
		#10; 
		Instr = 20'he0400801; 
		ImmSrc = 2'b10;
		#10; 
		Instr = 20'he0400801; 
		ImmSrc = 2'b00;
		
	end
			  
	
	
endmodule
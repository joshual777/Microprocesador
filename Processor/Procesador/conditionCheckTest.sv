module conditionCheckTest();

	logic [3:0] Cond;
	logic [3:0] Flags;
	logic CondEx;

	// instantiate device to be tested
	 conditionCheck conditionCheckForTest(Cond, Flags,
			  CondEx);

	
	
	initial begin 		
		
		#10; 
		Cond = 4'b0000; 
		Flags = 4'b0001; 
		#10; 
		Cond = 4'b0110; 
		Flags = 4'b0001;
		#10; 
		Cond = 4'b1000; 
		Flags = 4'b0001;
		#10; 
		Cond = 4'b0000; 
		Flags = 4'b0001;
		#10; 
		Cond = 4'b1110; 
		Flags = 4'b0011;
		
		
	end
			  
	
	
endmodule
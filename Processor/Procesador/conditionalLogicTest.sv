module conditionalLogicTest();

	logic clk, reset;			  
	logic [3:0] Cond;
	logic [3:0] ALUFlags;
	logic [1:0] FlagW;
	logic PCS, RegW, MemW;
	logic PCSrc, RegWrite, MemWrite;

	
	// instantiate device to be tested
	 conditionalLogic conditionalLogicForTest(clk, reset,Cond, ALUFlags,
			  Flagw,
			  PCS, RegW, MemW,
			  PCSrc, RegWrite, MemWrite);
	always begin
		 clk=~clk; #5;
	end
	
	
	initial begin 		
		reset = 1; #1; reset = 0; #4; //Se resetea los registros que permiten o no la actualizacion de los flags.
		clk = 0; #5;
		
		#10; 
		Cond = 4'b0000; 
		ALUFlags = 4'b0001; 
		FlagW= 2'b00;
		PCS = 0;	
		RegW = 0;
		MemW = 0;
		#10; 
		Cond = 4'b0010; 
		ALUFlags = 4'b0001; 
		FlagW= 2'b00;
		PCS = 0;	
		RegW = 0;
		MemW = 0;
		#10; 
		Cond = 4'b0000; 
		ALUFlags = 4'b0001; 
		FlagW= 2'b10;
		PCS = 0;	
		RegW = 1;
		MemW = 0;
		#10; 
		Cond = 4'b0000; 
		ALUFlags = 4'b0011; 
		FlagW= 2'b00;
		PCS = 0;	
		RegW = 0;
		MemW = 1;
		
		
	end
			  
	
	
endmodule
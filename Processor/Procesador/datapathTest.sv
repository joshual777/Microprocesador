module datapathTest();
	
	logic clk, reset;
	logic [1:0] RegSrc;
	logic RegWrite, MemWrite;
	logic [1:0] ImmSrc;
	logic ALUSrc;
	logic [1:0] ALUControl;
	logic MemtoReg;
	logic PCSrc;
	logic[7:0] addressForVga;
	logic [3:0] ALUFlags;
	logic [31:0] rdataForVga;
	logic [31:0] ReadOutData;
	logic [31:0] PC, Result, Instr;

	
	
	// instantiate device to be tested
	datapath datapathForTest(clk, reset, RegSrc,
			  RegWrite, MemWrite,
			  ImmSrc,
			  ALUSrc,
			  ALUControl,MemtoReg,
			  PCSrc, addressForVga,ALUFlags, rdataForVga, ReadOutData,
			  PC, Result, Instr);
			  
	// generate clock to sequence tests
	always begin
	clk <= 0; # 5; clk <= 1; #5;
	end
	
	
	initial begin 
		#5; reset = 1; #1; reset = 0;
		
		
		
		#10; 
		RegSrc = 2'b10;
		RegWrite = 1;
		MemWrite = 0;
		ImmSrc = 2'b00;
		ALUSrc = 0;
		ALUControl = 2'b10;
		MemtoReg = 0;
		PCSrc = 0;
		addressForVga = 8'b10101010;
		#10;
		ImmSrc = 2'b1;
		MemWrite = 1;
		RegWrite = 0;
		RegSrc = 2'b10;
		ALUSrc = 0;
		ALUControl = 2'b10;
		MemtoReg = 0;
		PCSrc = 0;
		addressForVga = 8'b10101010;
		#10;
		ImmSrc = 2'b10;
		MemWrite = 1;
		RegWrite = 0;
		RegSrc = 2'b10;
		ALUSrc = 0;
		ALUControl = 2'b10;
		MemtoReg = 0;
		PCSrc = 0;
		addressForVga = 8'b10001110;
		#10;
		ImmSrc = 2'b10;
		ALUSrc = 1;
		ALUControl = 2'b10;
		ALUFlags = 4'b1001;
		MemWrite = 1;
		RegWrite = 0;
		RegSrc = 2'b10;
		MemtoReg = 0;
		PCSrc = 0;
		addressForVga = 8'b10001010;
	end
			  
	
	
endmodule
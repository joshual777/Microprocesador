module procesadorTest();
	
	logic clk, reset, mostrarLetra;

	logic [6:0] segments;
	
	// instantiate device to be tested
	arm ARM(clk, reset, mostrarLetra,
			  segments);
			  
	// generate clock to sequence tests
	always begin
	clk <= 0; # 5; clk <= 1; #5;
	end
	
	
	initial begin 
		#5; reset = 1; #1; reset = 0;
		
		
		
		#60; 
		mostrarLetra = 0; #10; mostrarLetra = 1;
		
	end
			  
	
	
endmodule
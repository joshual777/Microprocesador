module mux2Test();

	logic [7:0] d0, d1;
	logic s;
	logic [7:0] y;
					

	
	// instantiate device to be tested
	mux2 mux2ForTest(d0, d1,
			  s,y);
	
	
	initial begin 		
		
		
		#10; 
		d0 = 8'b00010101; 
		d1 = 8'b00000000; 
		s= 0;	
		#10; 
		d0 = 8'b00010101; 
		d1 = 8'b01000000; 
		s= 1;	
		#10; 
		d0 = 8'b10010101; 
		d1 = 8'b11000000; 
		s= 1;	
		#10; 
		d0 = 8'b00010101; 
		d1 = 8'b00111100; 
		s= 0;
		
		
	end
			  
	
	
endmodule
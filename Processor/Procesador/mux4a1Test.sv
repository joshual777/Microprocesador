module mux4a1Test();

	logic [3:0] d0, d1,d2,d3;
	logic [1:0] s;
	logic [3:0] out;
					

	
	// instantiate device to be tested
	mux4a1 mux4a1ForTest(d0, d1,d2,d3,
			  s,out);
	
	
	initial begin 		
		
		
		#10; 
		d0 = 4'b0101; 
		d1 = 4'b0000; 
		d2 = 4'b0101; 
		d3 = 4'b0000;
		s= 2'b00;	
		#10; 
		d0 = 4'b0101; 
		d1 = 4'b0100;
		d2 = 4'b0101; 
		d3 = 4'b0000;	
		s= 2'b01;	
		#10; 
		d0 = 4'b1101; 
		d1 = 4'b1100; 
		d2 = 4'b0101; 
		d3 = 4'b0000;
		s= 2'b10;	
		#10; 
		d0 = 4'b0101; 
		d1 = 4'b1100;
		d2 = 4'b0101; 
		d3 = 4'b1000;	
		s= 2'b11;
		
		
	end
			  
	
	
endmodule
module testALU();
	parameter n = 4;
	logic [n-1:0] a, b;
	logic [n-1:0] select;
	logic [n-1:0] out;
	logic cout;
	logic negFlag;
	logic zeroFlag;
	
	ALU ALU(.a(a), .b(b), .select(select), .outMux(out), .Cout(cout), .NegFlag(negFlag), .zeroFlag(zeroFlag));
							
	initial begin
	
		//Prueba 1 de autochequeo de los 10 modulos con las entradas a y b
		a = 'b0000;
		b = 'b0001;
		
		select = 'b0000; //Suma
		#10;
		if(out !== 'b0001) $display("Suma 1 erronea.");
		
		select = 'b0010; //Resta
		#10;
		if(out !== 'b0001) $display("Resta 1 erronea.");
		
		select = 'b0011; //Multiplicacion
		#10;
		if(out !== 'b0000) $display("Multiplicacion 1 erronea.");
		
		select = 'b0100; //Division
		#10;
		if(out !== 'b0000) $display("Division 1 erronea.");
		
		select = 'b0101; //Modulo
		#10;
		if(out !== 'b0000) $display("Modulo 1 erroneo.");
		
		select = 'b0110; //and
		#10;
		if(out !== 'b0000) $display("and 1 erronea.");
		
		select = 'b0111; //or
		#10;
		if(out !== 'b0001) $display("or 1 erronea.");
		
		select = 'b1000; //xor
		#10;
		if(out !== 'b0001) $display("xor 1 erronea.");
		
		select = 'b1001; //shift left
		#10;
		if(out !== 'b0000) $display("shift left 1 erronea.");
		
		select = 'b1010; //shift right
		#10;
		if(out !== 'b0000) $display("shift right 1 erronea.");
		
		/////Fin prueba 1
		
		
		
		//Prueba 2 de autochequeo de los 10 modulos con las entradas a y b
		a = 'b0010;
		b = 'b0001;
		
		select = 'b0000; //Suma
		#10;
		if(out !== 'b0011) $display("Suma 2 erronea.");
		
		select = 'b0010; //Resta
		#10;
		if(out !== 'b0001) $display("Resta 2 erronea.");
		
		select = 'b0011; //Multiplicacion
		#10;
		if(out !== 'b0010) $display("Multiplicacion 2 erronea.");
		
		select = 'b0100; //Division
		#10;
		if(out !== 'b0010) $display("Division 2 erronea.");
		
		select = 'b0101; //Modulo
		#10;
		if(out !== 'b0000) $display("Modulo 2 erroneo.");
		
		select = 'b0110; //and
		#10;
		if(out !== 'b0000) $display("and 2 erronea.");
		
		select = 'b0111; //or
		#10;
		if(out !== 'b0011) $display("or 2 erronea.");
		
		select = 'b1000; //xor
		#10;
		if(out !== 'b0011) $display("xor 2 erronea.");
		
		select = 'b1001; //shift left
		#10;
		if(out !== 'b0100) $display("shift 2 left erronea.");
		
		select = 'b1010; //shift right
		#10;
		if(out !== 'b0001) $display("shift 2 right erronea.");
		
		/////Fin prueba 2
		
		//Prueba 3 de autochequeo de los 10 modulos con las entradas a y b
		a = 'b0010; //2 decimal
		b = 'b0100; //4 decimal
		
		select = 'b0000; //Suma
		#10;
		if(out !== 'b0110) $display("Suma 3 erronea.");
		
		select = 'b0010; //Resta
		#10;
		if(out !== 'b0010) $display("Resta 3 erronea.");
		
		select = 'b0011; //Multiplicacion
		#10;
		if(out !== 'b1000) $display("Multiplicacion 3 erronea.");
		
		select = 'b0100; //Division
		#10;
		if(out !== 'b0000) $display("Division 3 erronea.");
		
		select = 'b0101; //Modulo
		#10;
		if(out !== 'b0010) $display("Modulo 3 erroneo.");
		
		select = 'b0110; //and
		#10;
		if(out !== 'b0000) $display("and 3 erronea.");
		
		select = 'b0111; //or
		#10;
		if(out !== 'b0110) $display("or 3 erronea.");
		
		select = 'b1000; //xor
		#10;
		if(out !== 'b0110) $display("xor 3 erronea.");
		
		select = 'b1001; //shift left
		#10;
		if(out !== 'b0100) $display("shift left 3 erronea.");
		
		select = 'b1010; //shift right
		#10;
		if(out !== 'b0001) $display("shift right 3 erronea.");
		
		/////Fin prueba 3
		
		//Prueba 4 de autochequeo de los 10 modulos con las entradas a y b
		a = 'b1001; //9 dec 
		b = 'b0101; //5 dec
		
		select = 'b0000; //Suma
		#10;
		if(out !== 'b1110) $display("Suma 4 erronea.");
		
		select = 'b0010; //Resta
		#10;
		if(out !== 'b0100) $display("Resta 4 erronea.");
		
		select = 'b0011; //Multiplicacion
		#10;
		if(out !== 'b1101) $display("Multiplicacion 4 erronea.");
		
		select = 'b0100; //Division
		#10;
		if(out !== 'b0001) $display("Division 4 erronea.");
		
		select = 'b0101; //Modulo
		#10;
		if(out !== 'b0100) $display("Modulo 4 erroneo.");
		
		select = 'b0110; //and
		#10;
		if(out !== 'b0001) $display("and 4 erronea.");
		
		select = 'b0111; //or
		#10;
		if(out !== 'b1101) $display("or 4 erronea.");
		
		select = 'b1000; //xor
		#10;
		if(out !== 'b1100) $display("xor 4 erronea.");
		
		select = 'b1001; //shift left
		#10;
		if(out !== 'b0010) $display("shift left 4 erronea.");
		
		select = 'b1010; //shift right
		#10;
		if(out !== 'b0100) $display("shift right 4 erronea.");
		
		/////Fin prueba 4
		
		
		//Prueba bandera de cero
		a = 'b0000; //9 dec 
		b = 'b0000; //5 dec
		
		select = 'b0000; //Suma
		#10;
		if(out !== 'b0000) $display("Suma 5 erronea.");
		select = 'b0010; //Resta
		#10;
		if(out !== 'b0000) $display("Resta 5 erronea.");
		
		/////
		
		//Prueba bandera de carry
		a = 'b1100; //9 dec 
		b = 'b1100; //5 dec
		
		select = 'b0000; //Suma
		#10;
		if(out !== 'b1000) $display("Suma 6 erronea.");
		select = 'b0010; //Resta
		#10;
		if(out !== 'b0000) $display("Resta 6 erronea.");
		
		/////
		
	
		// Prueba del restador.
		select  = 4'd1;
		
		a = 4'd10; b = 4'd7;  #10;
		a = 4'd4;  b = 4'd9;  #10;
		a = 4'd15; b = 4'd2;  #10;
		a = 4'd2;  b = 4'd15; #10;
		a = 4'd8;  b = 4'd8;  #10;
		
		
		
	end
	
endmodule 
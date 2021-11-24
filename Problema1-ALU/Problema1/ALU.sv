module ALU
	#(parameter N=4)
	 (input logic  [N-1:0] a, b,
	  input logic  [2:0]   select,
	  output logic [N-1:0] outMux, 
	  output logic 		  Cout,
	  output logic 		  NegFlag,
	  output logic 		  zeroFlag);
	
	
	// Almacenamiento temporal de las salidas de los modulos
	logic [N-1:0] outSuma;
	logic [N-1:0] outResta;
	logic [N-1:0] outAnd;
	logic [N-1:0] outOr;
	logic [N-1:0] outXor;
	logic [N-1:0] outShiftL;
	logic [N-1:0] outShiftR;

	// Variables internas para el manejo de las flags
	logic CarryFlag, NegativeFlag, EqualFlag;

	//instanciacion de los modulos
	sumadorCompletoCuatroBits  	  x0 (a, b, 0, outSuma, CarryFlag);
	restadorCompletoCuatroBits 	  x1 (a, b, outResta, NegativeFlag, EqualFlag);
	AndGate 							#(N) x5 (a,b,outAnd);
	OrGate 							#(N) x6 (a,b,outOr);
	XorGate 							#(N) x7 (a,b,outXor);
	shiftLeft 						#(N) x8 (a,outShiftL);
	shiftRight 						#(N) x9 (a,outShiftR);
	
	//Manegador de las banderas
	flagsControls flags(CarryFlag, NegativeFlag, EqualFlag, select, Cout, NegFlag, zeroFlag);

	muxResults #(N) muxR (outSuma, outResta, outAnd, outOr, outXor, outShiftL, outShiftR, select, outMux);
		 	 	 	
endmodule 
module twoDisplaysNumbers(input logic [3:0] in, output logic [13:0] displays);			
	always_comb			
		case(in)
			//  				13-12-11-10-9-8-7-6-5-4-3-2-1-0
			//								0123456 0123456
			0:			displays = 14'b0000001_0000001; // Hacer un 00
			1:			displays = 14'b0000001_1001111; // Hacer un 01
			2:			displays = 14'b0000001_0010010; // Hacer un 02
			3:			displays = 14'b0000001_0000110; // Hacer un 03
			4:			displays = 14'b0000001_1001100; // Hacer un 04
			5:			displays = 14'b0000001_0100100; // Hacer un 05
			6:			displays = 14'b0000001_0100000; // Hacer un 06
			7:			displays = 14'b0000001_0001111; // Hacer un 07
			8:			displays = 14'b0000001_0000000; // Hacer un 08
			9:			displays = 14'b0000001_0000100; // Hacer un 09
			10:		displays = 14'b1001111_0000001; // Hacer un 10
			11:		displays = 14'b1001111_1001111; // Hacer un 11
			12:		displays = 14'b1001111_0010010; // Hacer un 12
			13:		displays = 14'b1001111_0000110; // Hacer un 13
			14:		displays = 14'b1001111_1001100; // Hacer un 14
			15:		displays = 14'b1001111_0100100; // Hacer un 15
			default: displays = 14'b0000001_0000001; // Hacer un 00
		endcase
endmodule
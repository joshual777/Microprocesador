module flagsControls(input logic  CarryFlag, NegFlag, EqualFlag,
							input logic [3:0] Selector,
							output logic CarryFlagOut, NegFlagOut, EqualFlagOut);
	
	always_comb
		case(Selector)
			4'd0: //Suma
				begin
					CarryFlagOut = CarryFlag;
					NegFlagOut = 4'd0;
					EqualFlagOut = 4'd0; 
				end
						
			4'd1: //Resta
				begin
					CarryFlagOut = 4'd0;
					NegFlagOut = NegFlag;
					EqualFlagOut = EqualFlag; 
				end
				
				
			default:
				begin
					CarryFlagOut = 4'd0;
					NegFlagOut   = 4'd0;
					EqualFlagOut = 4'd0;
				end				
		
		endcase
	


endmodule
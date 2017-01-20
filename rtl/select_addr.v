module select_addr(
							//input
							control,
							addr0,
							addr1,
							//output
							addr_o
						 );

input control;
input [4:0] addr0;
input [4:0] addr1;
output reg [4:0]	addr_o;
					 
always@(*) begin
	addr_o <= (control == 1'b0) ? addr0 : addr1;
end

endmodule
	 
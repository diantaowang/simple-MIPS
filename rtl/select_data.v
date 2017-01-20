module select_data(
							//input
							control,
							data0,
							data1,
							//output
							data_o
						 );

input control;
input [31:0] data0;
input [31:0] data1;
output reg [31:0]	data_o;
					 
always@(*) begin
	data_o <= (control == 1'b0) ? data0 : data1;
end

endmodule
	 
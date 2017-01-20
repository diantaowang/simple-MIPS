module sign_extend(
									 //input 
									 inst_imm,
									 //output
									 sign_imm
									);
									
input [15:0] inst_imm;
output reg [31:0] sign_imm;

always@(*) begin
	sign_imm <= {{16{inst_imm[15]}},inst_imm};
end

endmodule
 
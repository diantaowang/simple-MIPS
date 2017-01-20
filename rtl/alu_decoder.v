`include "define.v"
module alu_decoder(
										//input
										alu_op,
										funct,
										//output
										alu_control
									);

input [1:0] alu_op;
input [5:0] funct;
output reg [2:0] alu_control;

always@(*) begin
	case(alu_op)
		2'b00:
			alu_control <= `ADD_OP;
		2'b01:
		  alu_control <= `SUB_OP;
		2'b10:
			case(funct)
				`ADD_Funct: begin
					alu_control <= `ADD_OP;
				end
				`SUB_Funct: begin
					alu_control <= `SUB_OP;
				end
				`AND_Funct: begin
					alu_control <= `AND_OP;
				end
				`OR_Funct: begin
					alu_control <= `OR_OP;
				end
				`SLT_Funct: begin
					alu_control <= `SLT_OP;
				end
				`SLLV_Funct: begin
					alu_control <= `SLLV_OP;
				end
				`SRLV_Funct: begin 
					alu_control <= `SRLV_OP;
				end
				default: begin
					alu_control <= `NO_OP;
				end
			endcase	
		2'b11:
		  alu_control <= `NO_OP;
	endcase
end

endmodule
		
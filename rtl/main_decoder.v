`include "define.v"
module main_decoder(
                    //input 
                    Opcode,
                    //output
                    RegWrite,
                    RegDst, 
                    ALUSrc,
                    Branch,
                    MemWrite,
                    MemtoReg,
                    ALUOp,
                    Jump
								   );
								   
input [5:0] Opcode;
output reg RegWrite;
output reg RegDst;
output reg ALUSrc;
output reg Branch;
output reg MemWrite;
output reg MemtoReg;
output reg [1:0] ALUOp;
output reg Jump;

always@(*) begin
	case(Opcode)
		`EXE_SPECIAL: begin
			{RegWrite,RegDst,ALUSrc,Branch} <= {1'b1, 1'b1, 1'b0, 1'b0};
			{MemWrite,MemtoReg,ALUOp,Jump}  <= {1'b0, 1'b0, 2'b10, 1'b0};
		end
		`LW_OP: begin
			{RegWrite,RegDst,ALUSrc,Branch} <= {1'b1, 1'b0, 1'b1, 1'b0};
			{MemWrite,MemtoReg,ALUOp,Jump}  <= {1'b0, 1'b1, 2'b00, 1'b0};
		end
		`SW_OP: begin
			{RegWrite,RegDst,ALUSrc,Branch} <= {1'b0, 1'b0, 1'b1, 1'b0};
			{MemWrite,MemtoReg,ALUOp,Jump}  <= {1'b1, 1'b0, 2'b00, 1'b0};
		end
		`BEQ_OP: begin
			{RegWrite,RegDst,ALUSrc,Branch} <= {1'b0, 1'b0, 1'b0, 1'b1};
			{MemWrite,MemtoReg,ALUOp,Jump}  <= {1'b0, 1'b0, 2'b01, 1'b0};
		end
		`J_OP: begin
			{RegWrite,RegDst,ALUSrc,Branch} <= {1'b0, 1'b0, 1'b0, 1'b0};
			{MemWrite,MemtoReg,ALUOp,Jump}  <= {1'b0, 1'b0, 2'b00, 1'b1};
		end
		`ADDI_OP: begin
			{RegWrite,RegDst,ALUSrc,Branch} <= {1'b1, 1'b0, 1'b1, 1'b0};
			{MemWrite,MemtoReg,ALUOp,Jump}  <= {1'b0, 1'b0, 2'b00, 1'b0};
		end
		default: begin
			{RegWrite,RegDst,ALUSrc,Branch} <= {1'b0, 1'b0, 1'b0, 1'b0};		//take care
			{MemWrite,MemtoReg,ALUOp,Jump}  <= {1'b0, 1'b0, 2'b00, 1'b0};
		end
	endcase
end

endmodule

		
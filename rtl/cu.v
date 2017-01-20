`include "define.v"
module cu(
					//input 
					Opcode,
					Funct,
					//output
					RegWrite,
          RegDst, 
          ALUSrc,
          Branch,
          MemWrite,
          MemtoReg,
          ALUControl,
          Jump
				 );
				 
input [5:0] Opcode;
input [5:0] Funct;

output RegWrite;
output RegDst;
output ALUSrc;
output Branch;
output MemWrite;
output MemtoReg;
output [2:0] ALUControl;
output Jump;

wire [1:0] link;

main_decoder main_decoder0(
		//input 
		.Opcode(Opcode),
		//output
		.RegWrite(RegWrite),
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc),
		.Branch(Branch),
		.MemWrite(MemWrite),
		.MemtoReg(MemtoReg),
		.ALUOp(link),
		.Jump(Jump)
);

alu_decoder alu_decoder0(
		//input
		.alu_op(link),
		.funct(Funct),
		//output
		.alu_control(ALUControl)
);

endmodule
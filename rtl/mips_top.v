module mips_top(
							  //input
							  clk,
							  rst
							 );
							 
input clk;
input rst;

// pc_reg && rom_64Kx2
wire [31:0] pc_link;
wire ce_link;

// rom_64Kx2 && others
wire [31:0] instr_link;

// sign_extend &7 others
wire [31:0] sign_imm_link;

// cu && others
wire RegWrite_link;
wire RegDst_link;
wire ALUSrc_link;
wire Branch_link;
wire MemWrite_link;
wire MemtoReg_link;
wire [2:0] ALUControl_link;
wire Jump_link;

// select_addr && registers
wire [4:0] addr2_link;

// registers && other
wire [31:0] rd0_link;
wire [31:0] rd1_link;

// select_data && alu
wire [31:0] srcb_link;

// alu && other
wire zero_link;
wire ov_link;
wire [31:0] alu_result_link;

// pc_src && pc_reg
wire pcsrc_link;

// select_data1 && other
wire [31:0] read_data_link;
wire [31:0] wdata_link;

pc_reg pc_reg0(
		//input
		.clk(clk),
		.rst(rst),
		.option_jump(Jump_link),
		.option_src(pcsrc_link),
		.I_SignImm(sign_imm_link),
		.J_Imm(instr_link[25:0]),
		//output
		.ce(ce_link),
		.pc(pc_link)
);

rom_64Kx32 rom_64Kx32_inst(
		//input
		.ce(ce_link),
		.addr(pc_link),
		//output
		.rd(instr_link)
);

sign_extend sign_extend0(
		//input 
		.inst_imm(instr_link[15:0]),
		//output
		.sign_imm(sign_imm_link)
);

registers registers0(
		//input 
		.clk(clk),
		.we(RegWrite_link),
		.addr0(instr_link[25:21]),
		.addr1(instr_link[20:16]),
		.addr2(addr2_link),
		.wd(wdata_link),
		//output
		.rd0(rd0_link),
		.rd1(rd1_link)
);

select_addr select_addr0(
		//input
		.control(RegDst_link),
		.addr0(instr_link[20:16]),
		.addr1(instr_link[15:11]),
		//output
		.addr_o(addr2_link)
);

cu cu0(
		//input 
		.Opcode(instr_link[31:26]),
		.Funct(instr_link[5:0]),
		//output
		.RegWrite(RegWrite_link),
		.RegDst(RegDst_link), 
		.ALUSrc(ALUSrc_link),
		.Branch(Branch_link),
		.MemWrite(MemWrite_link),
		.MemtoReg(MemtoReg_link),
		.ALUControl(ALUControl_link),
		.Jump(Jump_link)
);

select_data select_data0(
		//input
		.control(ALUSrc_link),
		.data0(rd1_link),
		.data1(sign_imm_link),
		//output
		.data_o(srcb_link)
);

alu alu0(
		//input
		.srcA(rd0_link),
		.srcB(srcb_link),
		.F(ALUControl_link),
		//output
		.result(alu_result_link),
		.zero(zero_link),
		.ov(ov_link)
);

pc_src pc_src0(
		//input
		.Branch(Branch_link),
		.Zero(zero_link),
		//output
		.PCSrc(pcsrc_link)
);

ram_4Kx32 ram_4Kx32_inst(
		//input    
		.clk(clk),      
		.we(MemWrite_link),      
		.addr(alu_result_link),    
		.wd(rd1_link),
		.ov(ov_link),      
		//output
		.rd(read_data_link)       
);

select_data select_data1(
		//input
		.control(MemtoReg_link),
		.data0(alu_result_link),
		.data1(read_data_link),
		//output
		.data_o(wdata_link)
);


endmodule

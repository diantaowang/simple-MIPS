
// OP
`define EXE_SPECIAL			6'b000000
`define LW_OP						6'b100011
`define SW_OP						6'b101011
`define BEQ_OP					6'b000100
`define J_OP						6'b000010
`define ADDI_OP				  6'b001000

// R_funct
`define ADD_Funct				6'b100000
`define SUB_Funct				6'b100010
`define AND_Funct				6'b100100										
`define OR_Funct				6'b100101	
`define SLT_Funct				6'b101010
`define SLLV_Funct      6'b000100
`define SRLV_Funct      6'b000110

// ALUContral
`define AND_OP					3'b000
`define OR_OP						3'b001
`define ADD_OP  				3'b010
`define NO_OP						3'b011
`define SLLV_OP					3'b100
`define SRLV_OP  				3'b101
`define SUB_OP					3'b110
`define SLT_OP					3'b111
module pc_reg(
							//input
							clk,
							rst,
							option_jump,
              option_src,
              I_SignImm,
              J_Imm,
              //output
              ce,
              pc
						 );

input clk;
input rst;
input option_jump;
input option_src;
input [31:0] I_SignImm;
input [25:0] J_Imm;
output reg ce;
output reg [31:0] pc;

wire [31:0] PCPlus4;
wire [31:0] PCJump;
wire [31:0] PCBranch;

assign PCPlus4 = pc + 4'h4;
assign PCJump = {PCPlus4[31:28],J_Imm,2'b00};
assign PCBranch = PCPlus4 + (I_SignImm << 2);

always@(posedge clk) begin
	if(rst == 1'b1)
		ce <= 1'b0;
	else
		ce <= 1'b1;
end

always@(posedge clk) begin
	if(ce == 1'b0) begin
		pc <= 32'h0;
	end else if(option_jump == 1'b1) begin
  	pc <= PCJump;
  end else if(option_src == 1'b1) begin
		pc <= PCBranch;
	end else begin
  	pc <= PCPlus4;
  end
end						 

endmodule
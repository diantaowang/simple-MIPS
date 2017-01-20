`include "define.v"
module alu(
						//input
						srcA,
						srcB,
						F,
            //output
            result,
            zero,
            ov
					);
					
input [31:0] srcA;
input [31:0] srcB;
input [2:0]  F;
output reg [31:0] result;
output reg zero;
output reg ov;

wire ov_sum;
wire srcA_lt_srcB;
wire [31:0] srcB_mux;
wire [31:0] sum_tmp;

assign srcB_mux = ((F == 3'b111) || (F == 3'b110)) ? (~srcB+1) : srcB;

assign sum_tmp = srcA + srcB_mux;

assign ov_sum = (srcA[31] && srcB_mux[31] && !sum_tmp[31]) ||
                (!srcA[31] && !srcB_mux[31] && sum_tmp[31]);

assign srcA_lt_srcB = (srcA[31] && !srcB[31]) || 
                      (srcA[31] && srcB[31] && sum_tmp[31]) ||
                      (!srcA[31] && !srcB[31] && sum_tmp[31]);


always@(*) begin
	ov <= 1'b0;
	zero <= (srcA == srcB) ? 1 : 0;
	case(F)
	  `AND_OP: begin
	  	result <= srcA & srcB;
	  end
	  `OR_OP: begin
	  	result <= srcA | srcB;
	  end
	  `ADD_OP,`SUB_OP: begin
	  	result <= sum_tmp;
	  	ov <= ov_sum;
	  end
	  `NO_OP:	begin						//take case
	    result <= result;
	  end
	  `SLLV_OP: begin
	  	result <= srcB << srcA[4:0];
	  end
	  `SRLV_OP: begin
	  	result <= srcB >> srcA[4:0];
	  end
	  `SLT_OP: begin
			result <= srcA_lt_srcB;
		end
	endcase
end

endmodule

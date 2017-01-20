module rom_64Kx32(
						      //input
						      ce,
						      addr,
						      //output
						      rd
					       );

input ce;
input [31:0] addr;				
output reg [31:0] rd; 

reg [31:0] mem [65535:0];

initial begin
	$readmemh("/home/edauser/Processor/rtl/inst_rom.data", mem);
end

always@(*) begin
	if(ce == 1'b1) 
		rd <= mem[addr[17:2]];
	else
		rd <= 32'h0;
end

endmodule

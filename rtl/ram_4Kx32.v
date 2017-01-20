module ram_4Kx32(
                    //input    
                    clk,      
                    we,      
                    addr,    
                    wd,
                    ov,      
                    //output
                    rd       
                  );
                  
input clk;
input we;
input ov;
input [31:0] addr;
input [31:0] wd;
output reg [31:0] rd;

reg [31:0] mem[4095:0];

always@(posedge clk or negedge clk)
begin
  if(we && !ov) 
	  	mem[addr] <= wd;
	else ;
end

always@(*) begin
	rd <= mem[addr[11:0]];
end

endmodule



	  
			 
	  
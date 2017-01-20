module pc_src(
							//input
							Branch,
							Zero,
							//output
							PCSrc
						 );
						 
input Branch;
input Zero;
output PCSrc;

assign PCSrc = Branch & Zero;

endmodule

module cu(opcode,zero,funct3,funct7,alusrc,resultsrc,immsrc,regwrite,memwrite,pcsrc,aluctrl);
input [6:0] opcode;
input zero,funct7;
input [2:0] funct3;
output [2:0] aluctrl;
output [1:0] immsrc;
output resultsrc,memwrite,alusrc,regwrite,pcsrc;
wire branch;
wire [1:0] aluop;

controlunit u1(opcode,branch,immsrc,resultsrc,aluop,memwrite,alusrc,regwrite);
aluctrl u2(aluop,funct3,funct7,aluctrl);
assign pcsrc = branch && zero;
endmodule

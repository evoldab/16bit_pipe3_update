module core (
	input wire clk,
	input wire rst
);
wire [15:0] instr_IF;
wire [15:0] instr_ID;
wire [15:0] PC, PC_jump;
wire [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
wire [1:0] opcode;
wire [2:0] funct3;
wire [2:0] rd;
wire [2:0] rs1;
wire [2:0] rs2;
wire [7:0] imm;
wire jump;


IF uut_if(
	.clk(clk),
	.rst(rst),
	.jump(jump),
	.instr_IF(instr_IF),
	.PC(PC),
	.PC_jump(PC_jump)
);

ID uut_id(
	.clk(clk),
	.rst(rst),
	.instr_IF(instr_IF),
	.instr_ID(instr_ID),
	.opcode(opcode),
	.funct3(funct3),
	.rd(rd),
	.rs1(rs1),
	.rs2(rs2),
	.imm(imm)
);
EX uut_ex(
	.clk(clk),
	.rst(rst),
	.PC(PC),
	.PC_jump(PC_jump),
	.opcode(opcode),
	.funct3(funct3),
	.rd(rd),
	.rs1(rs1),
	.rs2(rs2),
	.imm(imm),
	.jump(jump),
	.R0(R0),
	.R1(R1),
	.R2(R2),
	.R3(R3),
	.R4(R4),
	.R5(R5),
	.R6(R6),
	.R7(R7)
);


initial begin
	$monitor("At time %t, PC = %h, instr_IF = %h, instr_ID = %h, opcode = %b, funct3 = %b, R0 = %h, R1 = %h, R2 = %h, R3 = %h, R4 = %h, R5 = %h, R6 = %h, R7 = %h", $time, PC, instr_IF, instr_ID, opcode, funct3, R0, R1, R2, R3, R4, R5, R6, R7);

end

endmodule
module EX (    
	input wire clk,
	input wire rst,
	input reg [15:0] PC,
	input reg [1:0] opcode,
	input reg [2:0] funct3, rd, rs1, rs2,
	input reg [7:0] imm,
	output reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7,
	output reg [15:0] PC_jump,
	output reg jump
);
	reg [15:0] dataD, dataS1, dataS2;
	reg [15:0] register [0:7];
	reg [15:0] result;
	reg [15:0] memory [0:255]; 
	reg [15:0] init_registers [0:7];
	integer i;
initial begin
	$readmemh("/home/evoldab/CompletePrj/memory.hex", memory);
	$readmemh("/home/evoldab/CompletePrj/registers.hex", init_registers);
end

always @(posedge clk or posedge rst) begin
if (rst) begin
	jump <= 1'b0;
	PC_jump <= 16'b0;
	for (i = 0; i<8; i= i+1) begin
		register[i] <= init_registers[i];
	end
end else begin

	if (opcode == 2'b00) begin
		case (funct3)
		3'b000: begin	//NOP
			end
		3'b001: begin	//SW
			memory[imm] <= register[rs1];
			end
		3'b010: begin	//LW
			register[rs1] <= memory[imm];
			end
		endcase
		jump <= 1'b0;
	end else if (opcode == 2'b01) begin
		case (funct3)
		3'b000: begin	//ADD
			register[rd] <= register[rs1] + register[rs2];
			end
		3'b001: begin	//SUB
			register[rd] <= register[rs1] - register[rs2];
			end
		3'b010: begin	//AND
			register[rd] <= register[rs1] & register[rs2];
			end
		3'b011: begin	//OR
			register[rd] <= register[rs1] | register[rs2];
			end
		3'b100: begin	//XOR
			register[rd] <= register[rs1] ^ register[rs2];
			end
		endcase
		jump <= 1'b0;
	end else if (opcode == 2'b10) begin
		case (funct3)
		3'b000: begin	//ADDI
			result = register[rd] + imm;
			register[rd] = result;
			end
		3'b001: begin	//LI
			register[rd] <= imm;
			end
		3'b010: begin	//LUI
			register[rd] <= {imm, 8'b0};
			end
		endcase
		jump <= 1'b0;
	end else if (opcode == 2'b11) begin
		case (funct3)
		3'b000: begin	//BEQZ
			if (register[rd] == 0) begin
				PC_jump <= PC + imm;
				jump <= 1'b1;
				end
			end
		3'b001: begin	//BNEZ
			if (register[rs1] != 0) begin
				PC_jump <= PC + imm;
				jump <= 1'b1;
				end
			end
		3'b010: begin	//JUMP
			PC_jump <= PC + imm;
			jump <= 1'b1;
			end
		3'b011: begin	//JAL
			register[rd] <= PC_jump;
			PC_jump <= PC_jump + imm;
			jump <= 1'b1;
			end
		3'b100: begin	//JR
			PC_jump <= register[rd];
			jump <= 1'b1;
			end
		3'b101: begin	//JALR
			register[rd] <= PC;
			PC_jump <= register[rs1];
			jump <= 1'b1;
			end
		endcase

	end
end
	R0 <= register[0];
	R1 <= register[1];
	R2 <= register[2];
	R3 <= register[3];
	R4 <= register[4];
	R5 <= register[5];
	R6 <= register[6];
	R7 <= register[7];
end
endmodule
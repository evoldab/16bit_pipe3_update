module ID (
	input wire clk,
	input wire rst,
	input reg [15:0] instr_IF,

	output reg [15:0] instr_ID,
	output reg [1:0] opcode,
	output reg [2:0] funct3,
	output reg [2:0] rd, rs1, rs2,
	output reg [7:0] imm
);


always @(posedge clk or posedge rst) begin
	if (rst) begin
		instr_ID <= 16'h0;
		opcode <= 2'b0;
		funct3 <= 3'b0;
		imm    <= 8'b0;
		rd     <= 3'b0;
		rs1    <= 3'b0;
		rs2    <= 3'b0;
	end else begin
		instr_ID = instr_IF;
		opcode = instr_ID[15:14];
		funct3 = instr_ID[13:11];
		case (opcode)
			2'b00: begin
				imm    <= instr_ID[10:3];
				rs1    <= instr_ID[2:0];
			end
			2'b01: begin
				rd     <= instr_ID[10:8];
				rs1    <= instr_ID[7:5];
				rs2    <= instr_ID[4:2];
			end
			2'b10: begin
				imm    <= instr_ID[10:3];
				rd     <= instr_ID[2:0];
			end
			2'b11: begin
				imm    <= instr_ID[10:3];
				rd     <= instr_ID[2:0];
				rs1    <= instr_ID[5:3];
			end
		endcase
        end
end
endmodule

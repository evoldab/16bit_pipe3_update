module IF (
	input wire clk,
	input wire rst,
	input wire jump,
	input reg [15:0] PC_jump,
	output reg [15:0] instr_IF,
	output reg [15:0] PC
);
	reg [15:0] instr_code [0:255];  //doc bo nho tap lenh
initial begin
	$readmemh("/home/evoldab/CompletePrj/instr_code.hex", instr_code);
end

always @(posedge clk or posedge rst) begin	//doc gia tri PC
	if (rst) begin
		PC <= 16'b0;
	end else if (!jump) begin
			PC <= PC + 16'h1;
		end else begin
			PC <= PC_jump;
		end
end

assign instr_IF = instr_code[PC];   //ket qua cua stage Fetch

endmodule
`timescale 1ns / 1ps

module processor(
	input clk,
	input reset,
	output [15:0] out,
	output I,
	output Z,
	output S,
	output HALT
    );
	
	wire [6:0] CAR;
	
	reg [10:0] AR;
	//reg [10:0] PC;
	//reg [15:0] DR;
	//reg [15:0] AC;
	
	//initial AC = 0;
	//initial DR = 0;
	//initial PC = 0;
	//initial AR = 0;
	
	//assign out = {5'b0, PC_out};
	//assign out = {9'b0, CAR};
	//assign out = {5'b0, AR};
	//assign out = AC_out;
	assign out = {AC_out[7:0], 1'b0, CAR};
	//assign out = 16'b1010101010101010;
	
	//reg [15:0] AC_out_temp;
	//always @(posedge clk) AC_out_temp = AC_out;
	
	// flags
    assign I = DR_out[15];
    assign S = AC_out[15];
    assign Z = ~(|AC_out);
	
	// OPCode
    wire [3:0] OPCode = DR_out[14:11];
	
	// control of registers
    wire [2:0] AC_control;
    wire [2:0] DR_control;
    wire [2:0] AR_control;
    wire [2:0] PC_control;
	
	// ALU controls
    wire ADD;
    wire DRTAC;
    wire SUB;
    wire OR;
    wire AND;
    wire XOR;
    wire COM;
    wire SHL;
    wire SHR;
	
	// register muxes
	wire [1:0] DR_mux;
	wire AR_mux;
	
	// main memory enable
	wire MEM_wen;
	
	// wires connected to output of registers
	wire [15:0] DR_out;
    wire [15:0] AC_out;
	//wire [10:0] AR_out;
    wire [10:0] PC_out;
	
	// wires connected to input of registers
	wire [15:0] DR_in;
	//wire [10:0] AR_in;
	
	// ALU out
	wire [15:0] ALU_out;
	
	// memory output
	wire [15:0] mem_out;
	
	register #(16) AC (
        .data(AC_out),
        .in(ALU_out),
        .control(AC_control),
        .clk(clk));
		
	register #(16) DR (
        .data(DR_out),
        .in(DR_in),
        .control(DR_control),
        .clk(clk));
		
	//egister #(11) AR (
    //    .data(AR_out),
    //    .in(AR_in),
    //    .control(AR_control),
    //    .clk(clk));
		
	register #(11) PC (
        .data(PC_out),
        .in(AR),
        .control(PC_control),
        .clk(clk));

	ALU alu(
		.DR(DR_out),
		.AC(AC_out),
		.ADD(ADD),
		.DRTAC(DRTAC),
		.SUB(SUB),
		.OR(OR),
		.AND(AND),
		.XOR(XOR),
		.COM(COM),
		.SHL(SHL),
		.SHR(SHR),
		.out(ALU_out)
	);
	
	control_unit control(
		.clk(clk),
		.reset(reset),
		.I(I),
		.S(S),
		.Z(Z),
		.OPCode(OPCode),
		.CAR(CAR),
		.AC_control(AC_control),
		.DR_control(DR_control),
		.AR_control(AR_control),
		.PC_control(PC_control),
		.ADD(ADD),
		.DRTAC(DRTAC),
		.SUB(SUB),
		.OR(OR),
		.AND(AND),
		.XOR(XOR),
		.COM(COM),
		.SHL(SHL),
		.SHR(SHR),
		.DR_mux(DR_mux),
		.AR_mux(AR_mux),
		.MEM_wen(MEM_wen),
		.HALT(HALT)
	);

	main_memory mem (
	  .clka(clk), // input clka
	  .wea(MEM_wen), // input [0 : 0] wea
	  .addra(AR), // input [10 : 0] addra
	  .dina(DR_out), // input [15 : 0] dina
	  .douta(mem_out) // output [15 : 0] douta
	);
	
	// for AC
	//always @(posedge clk) begin
	//	if (AC_control[2]) AC <= ALU_out;
	//	else if (AC_control[1]) AC <= 16'b0;
	//	else if (AC_control[0]) AC <= AC + 1;
	//end
	
	// for DR
	//always @(posedge clk) begin
	//	if (DR_control[2]) begin
	//		if (DR_mux == 2'b00) DR <= PC;
	//		else if (DR_mux == 2'b01) DR <= mem_out;
	//		else if (DR_mux == 2'b10) DR <= AC; 
	//	end
	//	else if (DR_control[1]) DR <= 16'b0;
	//	else if (DR_control[0]) DR <= DR + 1;
	//end
	
	// for PC
	//always @(posedge clk) begin
	//	if (DR_control[2]) PC <= AR;
	//	else if (DR_control[1]) PC <= 16'b0;
	//	else if (DR_control[0]) PC <= PC + 1;
	//end
	
	// for AR
	always @(*) begin
		if (AR_control[2]) begin
			if (AR_mux) AR = DR_out[10:0];
			else AR = PC_out;
		end
		else if (AR_control[1]) AR = 11'b0;
		else if (AR_control[0]) AR = AR + 1;
	end
	
	// assigning mux outputs to register inputs
	//assign AR_in = (AR_mux) ? (DR_out[10:0]) : (PC_out);
	assign DR_in = (DR_mux[1]) ? (AC_out) : ((DR_mux[0]) ? (mem_out) : ({5'b0, PC_out}));
	
endmodule








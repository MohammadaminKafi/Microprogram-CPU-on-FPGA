`timescale 1ns / 1ps

module control_unit (
    input clk,
	input reset,
    input I,
    input S,
    input Z,
    input [3:0] OPCode,
	output reg [6:0] CAR,
    output reg [2:0] AC_control,
    output reg [2:0] DR_control,
    output reg [2:0] AR_control,
    output reg [2:0] PC_control,
    output reg ADD,
    output reg DRTAC,
    output reg SUB,
    output reg OR,
    output reg AND,
    output reg XOR,
    output reg COM,
    output reg SHL,
    output reg SHR,
	output reg [1:0] DR_mux,
	output reg AR_mux,
	output reg MEM_wen,
	output reg HALT
);
	// required wires and registers for CAR and SBR
    //reg [6:0] CAR_in, SBR_in;
    //wire [6:0] CAR_out, SBR_out;
	//reg [2:0] CAR_control, SBR_control;

	// instruction fields
	wire [2:0] f1, f2, f3;
	wire [1:0] cd, br;
	wire [6:0] addr;
	
	// unneccesary wire
	wire [19:0] memory_in;
	//reg [6:0] CAR;
	reg [6:0] SBR;

    // memory
	micro_memory mem (
	  .clka(clk), // input clka
	  .wea(1'b0), // input [0 : 0] wea
	  .addra(CAR), // input [6 : 0] addra
	  .dina(memory_in), // input [19 : 0] dina
	  .douta({f1, f2, f3, cd, br, addr}) // output [19 : 0] douta
	);
	
	// instantiation of CAR
    //register #(7) CAR (
    //    .data(CAR_out),
    //    .in(CAR_in),
    //    .control(CAR_control),
    //    .clk(clk));
	
	// instantiation of SBR
    //register #(7) SBR (
    //    .data(SBR_out),
    //    .in(SBR_in),
    //    .control(SBR_control),
    //    .clk(clk));
		
	initial CAR = 0;
	initial SBR = 0;
	
	//initial HALT = 0;

	//always @(posedge reset) begin
	//	CAR = 0;
	//	SBR = 0;
	//	AC_control = 3'b010;
	//	DR_control = 3'b010;
	//	PC_control = 3'b010;
	//	AR_control = 3'b010;
	//end

	// assigning control wires
    always @(*)
    begin
		if (reset == 0) begin
			AC_control = 0;
			DR_control = 0;
			PC_control = 0;
			AR_control = 0;
			
			ADD = 0;
			DRTAC = 0;
			SUB = 0;
			OR = 0;
			AND = 0;
			XOR = 0;
			COM = 0;
			SHL = 0;
			SHR = 0;
			
			DR_mux = 0;
			AR_mux = 0;
			
			MEM_wen = 0;
				
			// F1
			// ADD
			if (f1 == 3'b001) begin
				ADD = 1;
				AC_control = 3'b100;
			end
			// CLRAC
			else if (f1 == 3'b010) AC_control = 3'b010;
			// INCAC
			else if (f1 == 3'b011) AC_control = 3'b001;
			// DRtAC
			else if (f1 == 3'b100) begin
				DRTAC = 1;
				AC_control = 3'b100;
			end
			// DRTAR
			else if (f1 == 3'b101) begin
				AR_control = 3'b100;
				AR_mux = 1'b1;
			end
			// PCTAR
			else if (f1 == 3'b110) begin
				AR_control = 3'b100;
				AR_mux = 1'b0;
			end
			//  WRITE
			else if (f1 == 3'b111) MEM_wen = 1'b1;
			// NOP
			else begin
				AC_control = 0;
				DR_control = 0;
				PC_control = 0;
				AR_control = 0;
				
				ADD = 0;
				DRTAC = 0;
				SUB = 0;
				OR = 0;
				AND = 0;
				XOR = 0;
				COM = 0;
				SHL = 0;
				SHR = 0;
				
				DR_mux = 0;
				AR_mux = 0;
				
				MEM_wen = 0;
			end
	// _____________________________________________________________________________
			// F2
			// SUB
			if (f2 == 3'b001) begin
				SUB = 1;
				AC_control = 3'b100;
			end
			// OR
			else if (f2 == 3'b010) begin
				OR = 1;
				AC_control = 3'b100;
			end
			// AND
			else if (f2 == 3'b011) begin
				AND = 1;
				AC_control = 3'b100;
			end
			// READ
			else if (f2 == 3'b100) begin
				DR_mux = 2'b01;
				DR_control = 3'b100;
			end
			// ACTDR
			else if (f2 == 3'b101) begin
				DR_mux = 2'b10;
				DR_control = 3'b100;
			end
			// INCDR
			else if (f2 == 3'b110) begin
				DR_control = 3'b001;
			end
			// PCTDR
			else if (f2 == 3'b111) begin
				DR_mux = 2'b00;
				DR_control = 3'b100;
			end
			else begin
				AC_control = AC_control;
				DR_control = DR_control;
				PC_control = PC_control;
				AR_control = AR_control;
				
				ADD = ADD;
				DRTAC = DRTAC;
				SUB = SUB;
				OR = OR;
				AND = AND;
				XOR = XOR;
				COM = COM;
				SHL = SHL;
				SHR = SHR;
				
				DR_mux = DR_mux;
				AR_mux = AR_mux;
				
				MEM_wen = MEM_wen;
			end
	// _____________________________________________________________________________
			// F3
			// XOR
			if (f3 == 3'b001) begin
				XOR = 1;
				AC_control = 3'b100;
			end
			// COM
			else if (f3 == 3'b010) begin
				COM = 1;
				AC_control = 3'b100;
			end
			// SHL
			else if (f3 == 3'b011) begin
				SHL = 1;
				AC_control = 3'b100;
			end
			// SHR
			else if (f3 == 3'b100) begin
				SHR = 1;
				AC_control = 3'b100;
			end
			// INCPC
			else if (f3 == 3'b101) PC_control = 3'b001;
			//ARTPC
			else if (f3 == 3'b110) PC_control = 3'b100;
			// HLT
			else if (f3 == 3'b111) HALT = 1;
			else begin
				AC_control = AC_control;
				DR_control = DR_control;
				PC_control = PC_control;
				AR_control = AR_control;
				
				ADD = ADD;
				DRTAC = DRTAC;
				SUB = SUB;
				OR = OR;
				AND = AND;
				XOR = XOR;
				COM = COM;
				SHL = SHL;
				SHR = SHR;
				
				DR_mux = DR_mux;
				AR_mux = AR_mux;
				
				MEM_wen = MEM_wen;
				HALT = 0;
			end
			
			case (cd)
				2'b00: condition = 1'b1;
				2'b01: condition = I;
				2'b10: condition = S;
				2'b11: condition = Z;
			endcase
			if (HALT == 0) begin
				if (condition) begin
					case (br)
						// JMP
						2'b00: begin 
							CAR = addr;
							//temp = addr + 1;
						end
						// CALL
						2'b01: begin
							SBR = CAR + 1;
							CAR = addr;
							//temp = addr + 1;
						end
						// RET
						2'b10: begin 
							CAR = SBR;
							//temp = SBR + 1;
						end
						// MAP
						2'b11: begin
							CAR = {1'b0, OPCode, 2'b00};
							//temp = {1'b0, OPCode, 2'b01};
						end
					endcase
				end
				else CAR = temp;
			end
			else begin // if HALT = 1 
				CAR = 0;
				HALT = 1'b1;
			end
		end
		else begin // reset
			CAR = 0;
			AC_control = 3'b010;
			DR_control = 3'b010;
			PC_control = 3'b010;
			
			ADD = ADD;
			DRTAC = DRTAC;
			SUB = SUB;
			OR = OR;
			AND = AND;
			XOR = XOR;
			COM = COM;
			SHL = SHL;
			SHR = SHR;
				
			HALT = 0;
		end
    end

	//reg flag;
	//always @(posedge clk) flag = 0;

	reg [6:0] temp;
	always @(posedge clk) temp = CAR + 1;

	reg condition;
	
	//always @(*)
	//begin
	//end
endmodule





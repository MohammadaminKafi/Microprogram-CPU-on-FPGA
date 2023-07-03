`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:24:59 06/30/2023
// Design Name:   ALU
// Module Name:   C:/ISE Projects/Final_Project_Ult/test_ALU.v
// Project Name:  Final_Project_Ult
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ALU;

	// Inputs
	reg [15:0] DR;
	reg [15:0] AC;
	reg ADD;
	reg DRTAC;
	reg SUB;
	reg OR;
	reg AND;
	reg XOR;
	reg COM;
	reg SHL;
	reg SHR;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.DR(DR), 
		.AC(AC), 
		.ADD(ADD), 
		.DRTAC(DRTAC), 
		.SUB(SUB), 
		.OR(OR), 
		.AND(AND), 
		.XOR(XOR), 
		.COM(COM), 
		.SHL(SHL), 
		.SHR(SHR), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		DR = 16'h1111;
		AC = 16'h1111;
		ADD = 0;
		DRTAC = 0;
		SUB = 0;
		OR = 0;
		AND = 0;
		XOR = 0;
		COM = 0;
		SHL = 0;
		SHR = 0;
		
		#100;
		DR = 16'h1111;
		AC = 16'h1111;
		ADD = 1;
		DRTAC = 0;
		SUB = 0;
		OR = 0;
		AND = 0;
		XOR = 0;
		COM = 0;
		SHL = 0;
		SHR = 0;
		
		#100;
		DR = 16'h2222;
		AC = 16'h1111;
		ADD = 0;
		DRTAC = 1;
		SUB = 0;
		OR = 0;
		AND = 0;
		XOR = 0;
		COM = 0;
		SHL = 0;
		SHR = 0;
		
		#100;
		DR = 16'h1111;
		AC = 16'h3333;
		ADD = 0;
		DRTAC = 0;
		SUB = 1;
		OR = 0;
		AND = 0;
		XOR = 0;
		COM = 0;
		SHL = 0;
		SHR = 0;
		
		#100;
		DR = 16'h2211;
		AC = 16'h1111;
		ADD = 0;
		DRTAC = 0;
		SUB = 0;
		OR = 1;
		AND = 0;
		XOR = 0;
		COM = 0;
		SHL = 0;
		SHR = 0;
		
		#100;
		DR = 16'h0011;
		AC = 16'h1111;
		ADD = 0;
		DRTAC = 0;
		SUB = 0;
		OR = 0;
		AND = 1;
		XOR = 0;
		COM = 0;
		SHL = 0;
		SHR = 0;
		
		#100;
		DR = 16'h1001;
		AC = 16'h1111;
		ADD = 0;
		DRTAC = 0;
		SUB = 0;
		OR = 0;
		AND = 0;
		XOR = 1;
		COM = 0;
		SHL = 0;
		SHR = 0;
		
		#100;
		DR = 16'h1111;
		AC = 16'h1111;
		ADD = 0;
		DRTAC = 0;
		SUB = 0;
		OR = 0;
		AND = 0;
		XOR = 0;
		COM = 1;
		SHL = 0;
		SHR = 0;
		
		#100;
		DR = 16'h1111;
		AC = 16'h1111;
		ADD = 0;
		DRTAC = 0;
		SUB = 0;
		OR = 0;
		AND = 0;
		XOR = 0;
		COM = 0;
		SHL = 1;
		SHR = 0;
		
		#100;
		DR = 16'h1111;
		AC = 16'h1111;
		ADD = 0;
		DRTAC = 0;
		SUB = 0;
		OR = 0;
		AND = 0;
		XOR = 0;
		COM = 0;
		SHL = 0;
		SHR = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


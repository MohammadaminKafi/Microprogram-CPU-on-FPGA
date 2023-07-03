`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:51:36 07/01/2023
// Design Name:   processor
// Module Name:   C:/ISE Projects/Final_Project_Ult/test_processor_mul.v
// Project Name:  Final_Project_Ult
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_processor_mul;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] out;
	wire I;
	wire Z;
	wire S;
	wire HALT;

	always #50 clk = ~clk;
	
	// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk), 
		.reset(reset), 
		.out(out), 
		.I(I), 
		.Z(Z), 
		.S(S), 
		.HALT(HALT)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


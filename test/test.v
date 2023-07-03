`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:56:28 06/30/2023
// Design Name:   motherboard
// Module Name:   C:/ISE Projects/Final_Project_Ult/test.v
// Project Name:  Final_Project_Ult
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: motherboard
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] led;
	wire [3:0] sseg;

	// Instantiate the Unit Under Test (UUT)
	motherboard uut (
		.clk(clk), 
		.led(led), 
		.sseg(sseg)
	);

	always #100 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:57:32 06/30/2023
// Design Name:   motherboard
// Module Name:   C:/ISE Projects/Final_Project_Ult/test_motherboard.v
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

module test_motherboard;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] led;
	wire [3:0] sseg;
	wire HALT;
	wire processor_clk;

	// Instantiate the Unit Under Test (UUT)
	motherboard uut (
		.clk(clk), 
		.reset(reset),
		.led(led), 
		.sseg(sseg), 
		.HALT(HALT),
		.processor_clk(processor_clk)
	);
	
	always #1 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


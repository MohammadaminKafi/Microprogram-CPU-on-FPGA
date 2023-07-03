`timescale 1ns / 1ps

module motherboard(
	input clk,
	input reset,
	output [7:0] led,
	output [3:0] sseg,
	output I,
	output S,
	output Z,
	output HALT,
	output reg processor_clk
    );

	initial processor_clk = 0;
	
	wire [15:0] out;
	
	wire LOCKED;
	
	//////////////////////////////////////////////////////////
	//reg [15:0] test;
	
	//always @(posedge clk)
	//begin
	//	test = out;
	//end
	//////////////////////////////////////////////////////////
	
	four_digit_sseg convertor(
	.clk(clk), // must be 24MHz
	.num(out), // 16 bits
	.sseg(sseg), // output: 4 bits for selcting which sseg
	.led(led) // output: leds of sseg
    );

	integer counter = 0;
	always @(posedge clk) begin
		if (counter == 2000000) begin // must be 6000000
			processor_clk = ~processor_clk;
			counter = 0;
		end
		else counter = counter + 1;
	end
	
	processor dolce_far_niente(
	.clk(processor_clk), // must be 1Hz -> changed to ungated 24MHz: change to processor_clk for 1MHz
	.reset(reset),
	.out(out), // 16 bits
	.I(I),
	.S(S),
	.Z(Z),
	.HALT(HALT)
    );
	
	//clock_manager clk_mnger
   //(// Clock in ports
   // .CLK_IN1(clk),      // IN
    // Clock out ports
    //.CLK_OUT1(clk_out),     // OUT
    // Status and control signals
    //.RESET(reset),// IN
    //.LOCKED(LOCKED));

endmodule

`timescale 1ns / 1ps

module register #(parameter SIZE = 16)(
    output reg [SIZE-1:0] data,
    input [SIZE-1:0] in,
    input [2:0] control,
    input clk
);
// control bits in order from MSB: write_enable, clear, increment 
		
	initial data = 0;
	
	//always @(*) if (control[1]) data = 0;
	
    always @(posedge clk)
    begin
        if (control[0]) data = data + 1;
		else if (control[1]) data = 0;
        else if (control[2]) data = in;
		else data = data; // latch
    end
    
endmodule
`timescale 1ns / 1ps

module ALU #(parameter SIZE = 16) (
    input [SIZE-1:0] DR,
    input [SIZE-1:0] AC,
    input ADD,
    input DRTAC,
    input SUB,
    input OR,
    input AND,
    input XOR,
    input COM,
    input SHL,
    input SHR,
    output reg [SIZE-1:0] out
    // output reg C
);

	initial out = 16'b0;

    always @(*)
    begin
        if (ADD) out = DR + AC;
        else if (DRTAC) out = DR;
        else if (SUB) out = AC - DR;
        else if (OR) out = AC | DR;
        else if (AND) out = AC & DR;
        else if (XOR) out = AC ^ DR;
        else if (COM) out = ~AC;
        else if (SHL) out = AC << 1;
        else if (SHR) out = AC >> 1;
    end

endmodule
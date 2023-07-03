`timescale 1ns / 1ps

// hexadecimal digit to seven-segment LED decoder
// LED control signal g, f, e, d, c, b and a grouped as 7-bit signal sseg 
// seven segment LED configured as active high

module hex2sseg(
    input [3:0] hex,
    output reg [6:0] sseg
);

    always @(*)
    begin
        case (hex)
            4'h0: sseg[6:0] = ~(7'b0111111);
            4'h1: sseg[6:0] = ~(7'b0000110);
            4'h2: sseg[6:0] = ~(7'b1011011);
            4'h3: sseg[6:0] = ~(7'b1001111);
            4'h4: sseg[6:0] = ~(7'b1100110);
            4'h5: sseg[6:0] = ~(7'b1101101);
            4'h6: sseg[6:0] = ~(7'b1111101);
            4'h7: sseg[6:0] = ~(7'b0000111);
            4'h8: sseg[6:0] = ~(7'b1111111);
            4'h9: sseg[6:0] = ~(7'b1101111);
            4'hA: sseg[6:0] = ~(7'b1110111);
            4'hB: sseg[6:0] = ~(7'b1111100);
            4'hC: sseg[6:0] = ~(7'b1011000);
            4'hD: sseg[6:0] = ~(7'b1011110);
            4'hE: sseg[6:0] = ~(7'b1111001);
            default : sseg[6:0] = ~(7'b1110001); // 4'hF
        endcase
    end
endmodule
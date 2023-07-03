`timescale 1ns / 1ps

module four_digit_sseg(
	input clk,
	input [15:0] num,
	output reg [3:0] sseg,
	output [7:0] led
    );

reg [3:0] hx;

// instantiation 0f hexadecimal to 7segment convertor
hex2sseg convertor(
    .hex(hx),
    .sseg(led[6:0])
);

assign led[7] = 1'b0;

// cnt is for clock conversion
integer cnt = 0;
// counter is for determination of states
integer counter = 0;

always @(posedge clk)
begin
	if (cnt == 60000) begin // 100Hz clk
		counter = counter + 1;
		if (counter == 0) begin
			sseg = 4'b1110;
			hx = num[15:12];
		end
		else if (counter == 1) begin
			sseg = 4'b1101;
			hx = num[11:8];
		end
		if (counter == 2) begin
			sseg = 4'b1011;
			hx = num[7:4];
		end
		if (counter == 3) begin
			sseg = 4'b0111;
			hx = num[3:0];
			counter = -1;
		end
		cnt = 0;
	end
	else cnt = cnt +1;
end


endmodule

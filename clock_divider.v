`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2025 09:58:09
// Design Name: 
// Module Name: clock_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(clk_100MHz, reset, clk_1Hz);

input clk_100MHz;
input reset;
output reg clk_1Hz;

reg[25:0]counter = 0;

always@(posedge clk_100MHz) begin 
if(counter >= 27'd49_999_999)begin 
    counter <= 0;
    clk_1Hz = ~ clk_1Hz;
    end
        else begin 
                counter <= counter + 1;
             end
end 
       
endmodule

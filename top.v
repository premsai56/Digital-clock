`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 15:45:47
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    output wire [6:0] display,
    output wire [3:0] anode
    );
    
  wire [5:0] min_counter;
  wire [5:0] hr_counter;
  wire [4:0] hours;
    time_day inst3 (
        .clk(clk),
        .rst(rst),
        .min_counter(min_counter),
        .hr_counter(hr_counter),
        .hours(hours)
        );
        
         seven_seg disp_unit (
        .clk(clk),
        .rst(rst),
        .sec(hours),
        .sec1(hr_counter),
        .display(display),
        .anode(anode)
    );
endmodule

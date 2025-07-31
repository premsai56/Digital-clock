`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 12:11:14
// Design Name: 
// Module Name: time_sec
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


module time_sec(
    input clk,
    input rst,
    output wire second
    );
    reg sec_en;
    reg [29:0] sec_counter;
    
    always @(posedge clk)
    begin
if (rst || sec_counter == 30'd99999999)
 begin sec_counter<=30'd0;
    sec_en<= 1;
    end
    else begin sec_counter<=sec_counter+30'd1;
    sec_en<=0;
    end
    end
    assign second = sec_en;
    
endmodule

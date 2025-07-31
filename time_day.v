`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 14:56:06
// Design Name: 
// Module Name: time_day
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


module time_day(
    input clk,
    input rst,
    output reg [4:0] hours,
    output wire [5:0] min_counter,
    output wire [5:0] hr_counter

    );
    
 
    wire hr_en;
    reg day_en;
 
    time_hr inst1 (
        .clk(clk),
        .rst(rst),
        .hour(hr_en),
        .min_counter(min_counter),
        .hr_counter(hr_counter)
        );
        
        always @(posedge clk) begin
            if(rst) begin
            hours<=5'd0;         
            end else if(hr_en) begin
            if(hours==5'd23) begin
                hours<=5'd0;
            end
             else
                    begin
                     hours<=hours+6'd1;
                    
                     end
                     
            end
         
            end
        
     
endmodule

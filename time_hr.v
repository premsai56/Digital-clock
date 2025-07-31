`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 14:42:44
// Design Name: 
// Module Name: time_hr
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


module time_hr(
    input clk,
    input rst,
    output hour,
    output wire [5:0] min_counter,
    output reg [5:0] hr_counter
    );
    
   // reg [5:0] hr_counter;
    wire min_en;
    reg hr_en;
 
    
    time_min inst2 (
        .clk(clk),
        .rst(rst),
        .minute(min_en),
        .min_counter(min_counter)
        );
      
         always @(posedge clk)begin
            if(rst) begin 
                hr_en<=0;
                hr_counter<=6'd0;
                end
            else if(min_en == 1) begin
                    if(hr_counter == 6'd59) begin
                        hr_en<=1;
                        hr_counter<=6'd0;
                        end 
                    else
                    begin
                     hr_counter<=hr_counter+6'd1;
                     hr_en<=0;
                     end
                 end
                 else hr_en<=0;
                 
        end
        
        assign hour = hr_en;
        
        
endmodule

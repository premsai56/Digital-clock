`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 13:48:18
// Design Name: 
// Module Name: time_min
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


module time_min(
    input clk,
    input rst,
    output wire minute,
    output reg [5:0] min_counter
    );
    
    wire sec_en;
    reg min_en;
 //  reg [5:0] min_counter;
    
    time_sec uut1 (
        .clk(clk),
        .rst(rst),
        .second(sec_en)
        );
        always @(posedge clk)begin
            if(rst) begin 
                min_en<=0;
                min_counter<=6'd0;
                end
            else if(sec_en == 1) begin

                    if(min_counter == 6'd59) begin
                        min_en<=1;
                        min_counter<=6'd0;
                        end 
                    else
                    begin
                     min_counter<=min_counter+6'd1;
                     min_en<=0;
                     end
                 end
                 else min_en<=0;
                 
        end
        
        assign minute = min_en;  
   //     assign minutes = min_counter; 
endmodule

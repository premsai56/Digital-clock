`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 14:42:41
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
    input rst,
    input clk,
   input [5:0] sec,
   input [5:0] sec1,
    output reg [6:0] display,
    output reg [3:0] anode
    );
    
    wire one_second_enable;
    reg [26:0] one_second_counter;
    reg [19:0] refresh_counter;
    wire [1:0] LED_activating_counter;
    reg [5:0] displayed_number;
    reg [5:0] displayed_number1;
        reg [3:0] LED_BCD;

 //   always @(*)begin 
 //   sec<=7'd80;
//    sec1<=7'd08;
 //   end
    
     always @(posedge clk or posedge rst)
    begin
        if(rst==1)
            one_second_counter <= 0;
        else begin
            if(one_second_counter>=99999999) 
                 one_second_counter <= 0;
            else
                one_second_counter <= one_second_counter + 1;
        end
    end 
    assign one_second_enable = (one_second_counter==99999999)?1:0;
    
    always @(posedge clk or posedge rst)
    begin 
        if(rst==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end 
    assign LED_activating_counter = refresh_counter[19:18];
    
   always @(posedge clk or posedge rst)
begin
    if (rst == 1) begin
        displayed_number  <= 0;
        displayed_number1 <= 0;
    end else if (one_second_enable == 1) begin
        displayed_number  <= sec;
        displayed_number1 <= sec1;
    end
end

     always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
            anode = 4'b0111; 
            // activate LED1 and Deactivate LED2, LED3, LED4
           // LED_BCD = displayed_number/1000;
            LED_BCD = ((displayed_number % 1000)%100)/10;
            // the first digit of the 16-bit number
              end
        2'b01: begin
            anode = 4'b1011; 
            // activate LED2 and Deactivate LED1, LED3, LED4
            //LED_BCD = (displayed_number % 1000)/100;
            LED_BCD = ((displayed_number % 1000)%100)%10;
            // the second digit of the 16-bit number
              end
        2'b10: begin
            anode = 4'b1101; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            LED_BCD = ((displayed_number1 % 1000)%100)/10;
            // the third digit of the 16-bit number
                end
        2'b11: begin
            anode = 4'b1110; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            LED_BCD = ((displayed_number1 % 1000)%100)%10;
            // the fourth digit of the 16-bit number    
               end
        endcase
    end
    // Cathode patterns of the 7-segment LED display 
    always @(*)
    begin
        case(LED_BCD)
        4'b0000: display = 7'b0000001; // "0"     
        4'b0001: display = 7'b1001111; // "1" 
        4'b0010: display = 7'b0010010; // "2" 
        4'b0011: display = 7'b0000110; // "3" 
        4'b0100: display = 7'b1001100; // "4" 
        4'b0101: display = 7'b0100100; // "5" 
        4'b0110: display = 7'b0100000; // "6" 
        4'b0111: display = 7'b0001111; // "7" 
        4'b1000: display = 7'b0000000; // "8"     
        4'b1001: display = 7'b0000100; // "9" 
        default: display = 7'b0000001; // "0"
        endcase
    end
endmodule

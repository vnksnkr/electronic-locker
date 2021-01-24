// Code your design here
//----add module for keypad----------------
//-------------top module-----------------------------------------
module dlock(I1,I2,I3,I4,I5,I6,I7,I8,I9,I0,OPEN,CLOSE,SET,LOCK,RESET,CLK,d1_seg,d2_seg,d3_seg);
  input I1,I2,I3,I4,I5,I6,I7,I8,I9,I0,OPEN,CLOSE,SET,RESET,CLK;
  
  output reg LOCK;
  
  //-------output to be given to seven segment display----------
  output [6:0]d1_seg;
  output [6:0]d2_seg;
  output [6:0]d3_seg;
  
  wire[3:0] BCD;    //bcd from keypad
 
  wire setpassword; //if setpassword=1 new password can be set
  wire p;           //detect if button is pressed
  
  reg [3:0] digit1; //first  digit
  reg [3:0] digit2; //second digit
  reg [3:0] digit3; //third  digit
  reg [3:0] pwd1;   //first  digit of password
  reg [3:0] pwd2;   //second digit of password
  reg [3:0] pwd3;   //third  digit of password	
  
  reg r_p;
  
  wire EQ;          //EQ=1 if password = entered value
  
  reg change;       //change will be 1 for a very small time when p != r_p
  
//--------states-----------------------  
  parameter DIGIT_1 = 2'b00,DIGIT_2 = 2'b01,DIGIT_3=2'b10;
  reg [1:0]current_state;
 
  
//------instantiating keypad module------------------------
  assign BCD[3] = I8 || I9;
  assign BCD[2] = I4 || I5 || I6 || I7;
  assign BCD[1] = I2 || I3 || I6 || I7;
  assign BCD[0] = I1 || I3 || I5 || I7 || I9;
  assign p = I1||I2||I3||I4||I5||I6||I0||I9||I8||I7;
  
//---------------instantiating seven segment displays-----------------------------------
  seven_seg_decoder d1(CLK,digit1,d1_seg);
  seven_seg_decoder d2(CLK,digit2,d2_seg);
  seven_seg_decoder d3(CLK,digit3,d3_seg);

  
  
//-----------to detect the short time when the button is pressed or released so as to store the button value to keypad digit register-------------  
  always @(posedge CLK)
    begin
      r_p <= p;    //r_p stores 1 when p is pressed
      if(r_p != p) //when p is pressed p = 1 then for a very small time r_p is 0 and p is 1.So then the change = 1 and p = 1 and bcd is stored.
        change <= 1'b1;
      else
        change <= 1'b0;

    end
  


  always @(posedge CLK) 
    begin
      if(RESET)   //resets password to 0 if 'RESET' pressed or stores bcd from keypad if 'RESET' not pressed
        begin
          current_state <= DIGIT_1;
          pwd1 <= 0;
          pwd2 <= 0;
          pwd3 <= 0;
          digit1 <= 0;
          digit2 <= 0;
          digit3 <= 0;
        end
      else if(change&p)
        begin
          case(current_state)
            DIGIT_1:begin
              digit1 <= BCD;
              current_state = DIGIT_2;
            end
            DIGIT_2:begin
              digit2 <= BCD;
              current_state = DIGIT_3;
            end
            DIGIT_3:begin
              digit3 <= BCD;
              current_state = DIGIT_1;
            end
          endcase
        end
      
      else if(setpassword) //sets number frojm keypad memory as password
      begin
        pwd1 <= digit1;
        pwd2 <= digit2;
        pwd3 <= digit3;
      end
      
      else if(CLOSE)
        begin
          LOCK   <= 0;
          digit1 <= 0;
          digit2 <= 0;
          digit3 <= 0;
          current_state = DIGIT_1;
        end
      
      else if(OPEN)
        LOCK <= EQ;
      end
  assign EQ = ({digit1,digit2,digit3}=={pwd1,pwd2,pwd3});//EQ = 1 if entered value equals password
  assign setpassword = LOCK & SET;//if pwd equals and set password pressed
  
endmodule  





module seven_seg_decoder(clk,bcd,seven_seg);

input [3:0] bcd;
input clk;
output reg [6:0] seven_seg;

always @(posedge clk)
 begin
  case (bcd)
   4'b0000 : begin seven_seg = 7'b1111110; end
   4'b0001 : begin seven_seg = 7'b0110000; end
   4'b0010 : begin seven_seg = 7'b1101101; end
   4'b0011 : begin seven_seg = 7'b1111001; end
   4'b0100 : begin seven_seg = 7'b0110011; end
   4'b0101 : begin seven_seg = 7'b1011011; end
   4'b0110 : begin seven_seg = 7'b1011111; end
   4'b0111 : begin seven_seg = 7'b1110000; end
   4'b1000 : begin seven_seg = 7'b1111111; end
   4'b1001 : begin seven_seg = 7'b1110011; end
   default : begin seven_seg = 7'b0000000; end
   endcase
 end
endmodule
  
  
          


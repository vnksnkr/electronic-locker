//-------------top module-----------------------------------------
module dlock(I1,I2,I3,I4,I5,I6,I7,I8,I9,I0,OPEN,CLOSE,SET,LOCK,RESET,CLK);
  input I1,I2,I3,I4,I5,I6,I7,I8,I9,I0,OPEN,CLOSE,SET,RESET,CLK;
  output reg LOCK;
  wire[3:0] BCD; //bcd from keypad
  reg address; //address=0 to store in first memory,address=1 to store in second memory
  wire setpassword; //if setpassword=1 new password can be set
  wire p; //detect if button is pressed
  reg [3:0] digit1; //first digit
  reg [3:0] digit2; //second digit
  reg [3:0] pwd1; //first digit of password
  reg [3:0] pwd2; //second digit of password
  reg r_p;
  wire EQ; //EQ=1 if password = entered value
  reg change;
 
  
//------instantiating keypad module------------------------
  assign BCD[3] = I8 || I9;
  assign BCD[2] = I4 || I5 || I6 || I7;
  assign BCD[1] = I2 || I3 || I6 || I7;
  assign BCD[0] = I1 || I3 || I5 || I7 || I9;
  assign p = I1||I2||I3||I4||I5||I6||I0||I9||I8||I7;
  
  always @(posedge CLK)
    begin
      r_p <= p;//r_p stores 1 when p is pressed
      if(r_p != p) //when p is pressed p = 1 then for a very small time r_p is 0 and p is 1.So then the change = 1 and p = 1 and bcd is stored.
        change <= 1'b1;
      else
        change <= 1'b0;

    end
  

//resets password to 0 if 'RESET' pressed or stores bcd from keypad if 'RESET' not pressed
  always @(posedge CLK) 
    begin
      if(RESET)
        begin
          address <= 0;
          pwd1 <= 0;
          pwd2 <= 0;
        end
      else if(change&p)
        begin
          if(!address)
            begin
              digit1 <= BCD;
              address <= 1;
            end
          else
            begin
              digit2 <= BCD;
              address <= 0;
            end
        end
    end
  
  
  
  assign EQ = ({digit1,digit2}=={pwd1,pwd2});//EQ = 1 if entered value equals password
  assign setpassword = LOCK & SET;//if pwd equals and set password pressed
  
  
  
  
  //sets new password 
  always @(posedge CLK)
    if(setpassword)
      begin
        pwd1 <= digit1;
        pwd2 <= digit2;
      end
  
  
  //open LOCK(LOCK=1) if 'OPEN' PRESSED  OR  RESETS LOCK AND KEYPAD MEMORY TO 0 IF 'CLOSE' PRESSED
  always @(posedge CLK)
    begin
      if(CLOSE)
        begin
          LOCK <= 0;
          digit1 <= 0;
          digit2 <= 0;
          address <= 0;
        end
      else if(OPEN)
        LOCK <= EQ;
    end
endmodule
  
  
          


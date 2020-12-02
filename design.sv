//-----------------keypad module for decimal to bcd conversion----------------
module keypad(i1,i2,i3,i4,i5,i6,i7,i8,i9,i0,open,clear,set,bcd,pressed);
  input i1,i2,i3,i4,i5,i6,i7,i8,i9,i0,open,clear,set;
  output [3:0]bcd;
  output pressed;
  assign bcd[3] = i8 || i9;
  assign bcd[2] = i4 || i5 || i6 || i7;
  assign bcd[1] = i2 || i3 || i6 || i7;
  assign bcd[0] = i1 || i3 || i5 || i7 || i9;
  assign pressed = i1||i2||i3||i4||i5||i6||i0||i9||i8||i7||clear;
endmodule



//-------------top module-----------------------------------------
module dlock(I1,I2,I3,I4,I5,I6,I7,I8,I9,I0,OPEN,CLOSE,SET,LOCK,RESET);
  input I1,I2,I3,I4,I5,I6,I7,I8,I9,I0,OPEN,CLOSE,SET,RESET;
  output reg LOCK;
  wire[3:0] BCD; //bcd from keypad
  reg address; //address=0 to store in first memory,address=1 to store in second memory
  wire setpassword; //if setpassword=1 new password can be set
  wire p; //detect if button is pressed
  reg [3:0] digit1; //first digit
  reg [3:0] digit2; //second digit
  reg [3:0] pwd1; //first digit of password
  reg [3:0] pwd2; //second digit of password
  wire EQ; //EQ=1 if password = entered value
  
 
  
//------instantiating keypad module------------------------
  keypad k1(  
    .i1(I1),.i2(I2),.i3(I3),.i4(I4),.i5(I5),        		 
    .i6(I6),.i7(I7),.i8(I8),.i9(I9),.i0(I0),.open(OPEN),
    .clear(CLOSE),.set(SET),.bcd(BCD),.pressed(p)
     );
  
  

//resets password to 0 if 'RESET' pressed or stores bcd from keypad if 'RESET' not pressed
  always @(posedge p or posedge RESET) 
    begin
      if(RESET)
        begin
          address <= 0;
          pwd1 <= 0;
          pwd2 <= 0;
        end
      else
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
  always @(posedge setpassword)
    begin
      pwd1 <= digit1;
      pwd2 <= digit2;
    end
  
  
  //open LOCK(LOCK=1) if 'OPEN' PRESSED  OR  RESETS LOCK AND KEYPAD MEMORY TO 0 IF 'CLOSE' PRESSED
  always @(posedge OPEN or posedge CLOSE)
    begin
      if(CLOSE)
        begin
          LOCK <= 0;
          digit1 <= 0;
          digit2 <= 0;
        end
      else
        LOCK <= EQ;
    end
endmodule
  
  
  
          


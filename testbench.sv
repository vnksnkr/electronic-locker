// CHANGE DISPLAY PARAMETERS INCLUDE BOTH PASSWORD AND SEVEN SEGMENT
module dlock_tb;
  
  reg T1,T2,T3,T4,T5,T6,T7,T8,T9,T0,O,S,C,R,CLK_T;
  wire L;
  wire [6:0]d1_seg;
  wire [6:0]d2_seg;
  wire [6:0]d3_seg;
  wire [6:0]p1_seg;
  wire [6:0]p2_seg;
  wire [6:0]p3_seg;  
  
  
  dlock d1(
    .I1(T1),.I2(T2),.I3(T3),
    .I4(T4),.I5(T5),.I6(T6),
    .I7(T7),.I8(T8),.I9(T9),
    .I0(T0),.OPEN(O),.CLOSE(C),
    .SET(S),.LOCK(L),.RESET(R),
    .CLK(CLK_T),.d1_seg(d1_seg),
    .d2_seg(d2_seg),
    .d3_seg(d3_seg)
  );
  
  initial begin
    CLK_T=0;
  end
  always begin
    #1 CLK_T=~CLK_T;
  end
   
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(2);
//--------------------------------------PRESSING RESET BUTTON----------------------------------------    
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b1;
    #10;
    $display("PRESSING RESET BUTTON\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
// ---------------------------------RELEASING RESET BUTTON-------------------------------------------   
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
  
    
//--------------------------TEST WHEN CORRECT PASSWORD ENTERED-----------------------------------------   
//-----------------------------------------------------------------------------------------------------
    
    $display("\nTEST WHEN CORRECT PASSWORD ENTERED");
//-------------------------------ENTERING FIRST DIGIT TO CHECK PASSWORD-----------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b1;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("ENTERING FIRST DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
//----------------------------RELEASING BUTTON OF FIRST DIGIT--------------------------------------    
    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
//--------------------------------ENTERING SECOND DIGIT-----------------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b1;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("\nENTERING SECOND DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
//------------------------------RELEASING BUTTON OF SECOND DIGIT---------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
    
//--------------------------------ENTERING THIRD DIGIT-----------------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b1;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("\nENTERING THIRD DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
      
//------------------------------RELEASING BUTTON OF THIRD DIGIT---------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
//-------------------------PRESSING OPEN BUTTON--------------------------------
    $display("\nPressing OPEN Button");
        #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b1;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
    
//-----------------------RELEASING OPEN BUTTON---------------------------------
     #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
    
    
//--------------------------SET NEW PASSWORD-----------------------------------------   
//-----------------------------------------------------------------------------------------------------
    
    $display("\nSET NEW PASSWORD");
//-------------------------------ENTERING FIRST DIGIT-----------------------------    
    #10;
    T1 = 1'b1;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("ENTERING FIRST DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
//----------------------------RELEASING BUTTON OF FIRST DIGIT--------------------------------------    
    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
//--------------------------------ENTERING SECOND DIGIT-----------------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b1;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("\nENTERING SECOND DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
//------------------------------RELEASING BUTTON OF SECOND DIGIT---------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
//--------------------------------ENTERING THIRD DIGIT-----------------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b1;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("\nENTERING THIRD DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
      
//------------------------------RELEASING BUTTON OF THIRD DIGIT---------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
//----------------------------ENTERING SET BUTTON--------------------------------------------------------- 
    $display("\nPressing SET button");
     #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b1;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
    
//----------------------------RELEASING SET BUTTON--------------------------------------------------------- 
     #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
    
//----------------------------PRESSING CLOSE BUTTON--------------------------------------------------------- 
    $display("\nPressing CLOSE button");
     #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b1;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
    
//----------------------------RELEASING CLOSE BUTTON--------------------------------------------------------- 
     #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
       
    
    
    


    
    
    
    

    
    
    
    
    
    
    
//--------------------------TEST WHEN INCORRECT PASSWORD ENTERED-----------------------------------------   
//-----------------------------------------------------------------------------------------------------
    
    $display("\n\nTEST WHEN INCORRECT PASSWORD ENTERED");
//-------------------------------ENTERING FIRST DIGIT TO CHECK PASSWORD-----------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b1;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("ENTERING FIRST DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
//----------------------------RELEASING BUTTON OF FIRST DIGIT--------------------------------------    
    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
//--------------------------------ENTERING SECOND DIGIT-----------------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b1;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("\nENTERING SECOND DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
//------------------------------RELEASING BUTTON OF SECOND DIGIT---------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
    
//--------------------------------ENTERING THIRD DIGIT-----------------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b1;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("\nENTERING THIRD DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
      
//------------------------------RELEASING BUTTON OF THIRD DIGIT---------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
//-------------------------PRESSING OPEN BUTTON--------------------------------
    $display("\nPressing OPEN Button");
        #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b1;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});
    
    
//-----------------------RELEASING OPEN BUTTON---------------------------------
     #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b0;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%12b, PASSWORD:%12b,EQUAL:%b, LOCK:%b SEVEN SEGMENT:%21b",R,O,C,S,{d1.digit1,d1.digit2,d1.digit3},{d1.pwd1,d1.pwd2,d1.pwd3},d1.EQ,L,{d1_seg,d2_seg,d3_seg});    
    
    
    $finish;
    
    
    end 
endmodule     
    

module dlock_tb;
  
  reg T1,T2,T3,T4,T5,T6,T7,T8,T9,T0,O,S,C,R,CLK_T;
  wire L;
  
  dlock d1(
    .I1(T1),.I2(T2),.I3(T3),
    .I4(T4),.I5(T5),.I6(T6),
    .I7(T7),.I8(T8),.I9(T9),
    .I0(T0),.OPEN(O),.CLOSE(C),
    .SET(S),.LOCK(L),.RESET(R),
    .CLK(CLK_T)
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
    $display("PRESSING RESET BUTTON\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b\n",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);  
    
//--------------------------TEST WHEN CORRECT PASSWORD ENTERED-----------------------------------------   
//-----------------------------------------------------------------------------------------------------
    
    $display("TEST WHEN CORRECT PASSWORD ENTERED");
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
    $display("ENTERING FIRST DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
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
    $display("ENTERING SECOND DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
      
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//------------------------PRESSING OPEN BUTTON---------------------------------------------    
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
    $display("PRESSING OPEN BUTTON TO OPEN LOCK\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//---------------------------------RELEASING OPEN BUTTON----------------------------------    
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
    #5;
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
//-------------------ENTERING FIRST DIGIT OF NEW PASSWORD--------------------------------------------    
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
    $display("ENTERING FIRST DIGIT OF NEW PASSWORD\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//---------------------RELEASING BUTTON-------------------------------------------    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
//-----------------ENTERING SECOND DIGIT------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b1;
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
    $display("ENETERING SECOND DIGIT OF NEW PASSWORD\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
//------------------------------RELEASING BUTTON---------------------------------------    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//---------------------------PRESSING SET PASSWORD BUTTON------------------------------------    
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
    $display("PRESSING SET PASSWORD BUTTON\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//----------------------RELEASING BUTTON--------------------------------------------    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//----------------------PRESSING CLOSE BUTTON--------------------------------------------------    
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
    $display("PRESSING CLOSE BUTTON\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
    
//-----------------------RELEASING BUTTON--------------------------------------------------------------    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);

    
    
    
//--------------------------TEST WHEN WRONG PASSWORD ENTERED------------------------------------------    
    
    $display("\nTEST WHEN WRONG PASSWORD ENTERED");        
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
    $display("ENTERING FIRST DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
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
    $display("ENTERING SECOND DIGIT\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
      
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//------------------------PRESSING OPEN BUTTON---------------------------------------------    
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
    $display("PRESSING OPEN BUTTON TO OPEN LOCK\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//---------------------------------RELEASING OPEN BUTTON----------------------------------    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
//-------------------ENTERING FIRST DIGIT OF NEW PASSWORD--------------------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b1;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("ENTERING FIRST DIGIT OF NEW PASSWORD\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//---------------------RELEASING BUTTON-------------------------------------------    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
//-----------------ENTERING SECOND DIGIT------------------------------    
    #10;
    T1 = 1'b0;
    T2 = 1'b0;
    T3 = 1'b0;
    T4 = 1'b0;
    T5 = 1'b0;
    T6 = 1'b0;
    T7 = 1'b1;
    T8 = 1'b0;
    T9 = 1'b0;
    T0 = 1'b0;
    O  = 1'b0;
    S  = 1'b0;
    C  = 1'b0;
    R  = 1'b0;    
    #10;
    $display("ENETERING SECOND DIGIT OF NEW PASSWORD\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
//------------------------------RELEASING BUTTON---------------------------------------    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//---------------------------PRESSING SET PASSWORD BUTTON------------------------------------    
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
    $display("PRESSING SET PASSWORD BUTTON\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//----------------------RELEASING BUTTON--------------------------------------------    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
//----------------------PRESSING CLOSE BUTTON--------------------------------------------------    
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
    $display("PRESSING CLOSE BUTTON\nRESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);
    
    
    
//-----------------------RELEASING BUTTON--------------------------------------------------------------    
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
    $display("RESET :%b, OPEN:%b, CLOSE:%b, SET:%b, KEYPAD:%8b, PASSWORD:%8b,EQUAL:%b, LOCK:%b",R,O,C,S,{d1.digit1,d1.digit2},{d1.pwd1,d1.pwd2},d1.EQ,L);    
    $finish;
    
    
    end 
endmodule
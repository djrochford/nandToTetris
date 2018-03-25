// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(OUTER_LOOP)
  @SCREEN
  D=A
  @current_word
  M=D
  (INNER_LOOP)
    @KBD
    D=M
    @WHITE
    D;JEQ
    (BLACK)
      @current_word
      A=M
      M=-1
      @GET_NEXT_WORD
      0;JMP
    (WHITE)
      @current_word
      A=M
      M=0
    (GET_NEXT_WORD)
      @current_word
      D=M
      @24576
      D=A-D
      @OUTER_LOOP
      D;JEQ 
      @current_word
      M=M+1
      @INNER_LOOP
      0;JMP

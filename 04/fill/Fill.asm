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

(START)
    @SCREEN
    D=A
    @0
    M=D 

(CHECK_PRESS)  // Check if any keyboard button is pressed
    @KBD
    D=M
    @PRESSED
    D; JGT    
    @NOT_PRESSED
    D; JEQ    

    @CHECK_PRESS
    0; JMP

// Choose if pressed or not_pressed

(PRESSED)
    @1
    // Fill every row
    M=-1
    @UPDATE
    0; JMP

(NOT_PRESSED)
    @1
    // Dont fill rows
    M=0
    @UPDATE
    0; JMP

(UPDATE)
    @1
    D=M      // pixel value to fill with

    @0
    A=M      //Address of pixel to be filled
    M=D 

    // Move to the next pixel
    @0
    D=M+1
    @KBD
    D=A-D 

    @0
    M=M+1
    A=M

    @UPDATE
    D;JGT

    @START
    0;JMP
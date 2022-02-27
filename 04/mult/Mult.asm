// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Implement multiplication buy adding 1 R0*R1 times
// Put your code here.


@R2    // Result address
M = 0 // Initiate it with zero

// if one of the product is zero, product is zero

@R0 
D=M
@END
D; JEQ

@R1
D=M
@END
D; JEQ 

// Add R1 to R2 R0 times
// Reduce R0 by 1 in each step

(LOOP)
    // Load R2
    @R2
    D=M

    // Add R1 to R2 
    @R1
    D=D+M

    @R2
    M=D

    // Reduce R0 by 1
    @R0
    M = M-1
    D=M
    @LOOP
    D; JGT

(END)
    @END
    0;JMP


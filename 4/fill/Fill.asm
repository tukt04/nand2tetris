// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

// black code
@color:black
M=-1

// white code
@color:white
M=0

@8192
D=A
@SCREEN
D=D+A
@loop:num
M=D

(BEGIN)
@KBD
D=M
@WHITE
D;JEQ

// set black code
@color:black
D=M
@R0
M=D

@COLORFIN
0;JMP

// set white code
(WHITE)
@color:white
D=M
@R0
M=D

(COLORFIN)
@SCREEN
D=A
@i
M=D

(LOOP)
// if (i==loop:num) goto LOOPEND
@i
D=M
@loop:num
D=M-D
@LOOPEND
D;JEQ

@R0
D=M
@i
A=M
M=D


// i = i + 1
@i
M=M+1

// goto LOOP
@LOOP
0;JMP

(LOOPEND)

@BEGIN
0;JMP
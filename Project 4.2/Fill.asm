// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.


(RESET) 
	@SCREEN
	D=A
	@cur_screen_word 	M=D

(LOOP)	
	@KBD
	D=M
	
	@FILL 	D; JGT
	
	@BLANK 
	0; JMP
	
(FILL)
	@cur_screen_word
	A=M
	M=-1
	
	@CHECK
	0; JMP
	
(BLANK)
	@cur_screen_word
	A=M
	M=0
	
	@CHECK
	0; JMP
	
(CHECK) 
	@cur_screen_word
	MD=M+1
	@KBD
	D=D-A
	
	@RESET 
	D; JEQ
	
	@LOOP  
	0; JMP
	
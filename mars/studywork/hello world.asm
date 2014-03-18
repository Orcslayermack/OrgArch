	.data
Str1:	.asciiz "Hello World!"
	
	.text
la $a0, Str1
li $v0, 4
syscall

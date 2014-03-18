.data
	strInput:
		.asciiz "Please enter a number "
	strOutput:
		.asciiz "The sum is "
	
.text
	move $t0, $zero
	
	loop:
		li, $v0, 4
		la $a0, strInput
		syscall
		
		#Get input
		li $v0, 5
		syscall
	
		add $t0, $t0, $v0
	
		bnez $v0, loop
	
	li, $v0, 4
	la $a0, strOutput
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
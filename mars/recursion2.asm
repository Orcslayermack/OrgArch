.data
prompt:		.asciiz "Please enter a number to evaluate: \n"
factorial:	.asciiz "The factorial of your number is: "
.text
main:
# print prompt
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $t0, $v0 # store int in $t0

#1-3


#4-5


#6-9


j end



end:
li $v0, 4
la $a0, factorial
syscall
li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall
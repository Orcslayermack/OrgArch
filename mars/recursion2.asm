.data
prompt:		.asciiz "Please enter a number to evaluate: \n"
str:		.asciiz "The factorial of your number is: "
.text
main:
# print prompt
li $v0, 4
la $a0, prompt
syscall
li $v0, 5
syscall
move $t0, $v0 # store parameter in $t0

factorial:
# 1-3
sw $t0, 0($sp) 		# store parameter
move $a0, $t0 		# pass parameter
jal if	 		# jal
j endFactorial


#4-5
if:
subu $sp, $sp, 12	# Push the stack 
sw $ra, 0($sp)		# store return address to stack pointer

# case 1
ble $a0, 0, endFactorial

# case 2
# 1-3 steps
sub $t0, $t0, 1
jal factorial

# magic
mult $a0, $v0
mflo $t0


j endFactorial
# $t0 will be the return variable n
#6-9
endFactorial:
move $v0, $t0
lw $ra, 0($sp)
addu $sp, $sp, 12 	# Pop the stack
jr $ra


j end



end:
li $v0, 4
la $a0, str
syscall
li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall
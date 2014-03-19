.data
prompt:		.asciiz "Please enter a number to evaluate: \n"
str:		.asciiz "The factorial of your number is: "
mult:		.asciiz "Multiplying\n"
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
#1	Save caller saved registers
sw $t0, 4($sp) 		
sw $t1, 8($sp)		
#2	Pass Arguments
move $a0, $t0 		
#3	Execute a jal instruction
jal if	 		

#END
j end

if:
#4 	Allocate memory for the frame by subtracting the frame's size from the stack pointer
subu $sp, $sp, 32	# Push the stack 
#5 	Save callee-saved registers in the frame
sw $ra, 0($sp)		# store return address to stack pointer

# case 1
ble $a0, 1, endFactorial
# case 2
lw $t0, 0($sp)
sub $t0, $a0, 1
jal factorial

# magic aaaaand this never executes
mult $a0, $v0
mflo $t0

# test
move $t0, $v0
li $v0, 4
la $a0, str
syscall



# $t0 will be the return variable n
endFactorial:
#6 	Put return values in $v0
move $v0, $t0
#7	Restore callee saved registers that were saved on entry
lw $ra, 0($sp)
lw $t0, 4($sp)
lw $t1, 8($sp)
#8	Pop the stack frame
addu $sp, $sp, 32 	
#9	Return by jumping to address in $ra
jr $ra

end:
move $t0, $v0
li $v0, 4
la $a0, str
syscall
li $v0, 1
move $a0, $t0
syscall
li $v0, 10
syscall
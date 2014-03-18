.data
prompt:		.asciiz "Please enter a number. \n"
.text
# print prompt
# System.out.println("Please enter a number.");
li $v0, 4
la $a0, prompt
syscall
# take int imput
# int n = input.nextInt();
li $v0, 5
syscall
move $t0, $v0
# $to is the integer to be evaluated


# int r = factorialRecurisve(n);

#*****************Start Caller Responsibilities******************
#1) Save Caller saved registers (#1)
# %a0-$a3, $t0-$t9
sw $t0, 0($sp)
#2) Pass arguments (#2)
# first four are passed into $a0-$a3
Remaining are passed on the stack in called procedure's frame.  
move $a0, $t0
#3) Execute a jal instruction (#3)
# Jumps to callee's first instruction
# Saves return address in $ra
jal factorialRecursive
#*****************End Caller Responsibilities******************

move $a0, $v0
li $v0, 1
syscall
j end
factorialRecursive:

#*****************Start Callee Responsibilities start******************
#4)  Allocate memory for frame by subtracting the frame's size from the stack pointer (#4)
subu $sp,$sp,12
#5) Save callee-saved registers in the frame (#5)
# $s0-$s7, $ra
sw $ra, 0($sp)
#*****************Start Callee Responsibilities start******************
bne $a0, 1, recursiveCase

#*****************Start Callee Responsibilities end******************
#6) Put return values in $v0 (#6)
li #v0, 1
#7) Restore callee saved registers that were saved on entry (#7)
lw #ra, 0($sp)
#8) Pop the stack frame (#8)
addiu $sp, $sp, 12
#9) Return by jumping to addres sin $ra (#9)
jr $ra
#*****************End Callee Responsibilities end******************


recursiveCase:
#*****************Caller Responsibilities******************
#1) Save Caller saved registers (#1)
# %a0-$a3, $t0-$t9
sw $a0, 4($sp)

#2) Pass arguments (#2)
# first four are passed into $a0-$a3
#Remaining are passed on the stack in called procedure's frame.  
sub $a0, $a0, 1

#3) Execute a jal instruction (#3)
# Jumps to callee's first instruction
# Saves return address in $ra
jal factorialRecursive
#*****************Caller Responsibilities end******************

# mult n * factRecursive(n-1)
# return prod
lw $a0,4($sp)
mult $v0, $a0

#*****************Start Callee Responsibilities end******************
#6) Put return values in $v0 (#6)
mflo $v0
#7) Restore callee saved registers that were saved on entry (#7)
lw #ra, 0($sp)
#8) Pop the stack frame (#8)
addiu $sp, $sp, 12
#9) Return by jumping to addres sin $ra (#9)
jr $ra
#*****************End Callee Responsibilities end******************











# initalize f
# int f = 1;
li $t1, 1






j factorialRecursive





end:
# System.out.printlnl( f );
li $v0, 1
move $a0, $t1
syscall 
# gracefully close the program
li $v0, 10
syscall

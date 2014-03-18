.data 
x0: .word 1
x1: .word 2
x2: .word 3
x3: .word 4
x4: .word 5
space: .asciiz " "
.text

la $t0, x0		#base address of the array
move $t7, $zero 	#initialize looping variable.
li $t1, 1 		#load 1 into $t1 ain order to determine if it is an odd number

loop:
beq $t7, 5, end
add $t7, $t7, 1
lw $a0, 0($t0)
add $t0, $t0, 4
and $t2, $a0, $t1	#register $t2 is 1 if it is an odd number
beq $t2, $t1, loop	# 

li $v0, 1
syscall
li, $v0, 4
la $a0, space
syscall

j loop

end:

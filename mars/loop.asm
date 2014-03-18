.data
newline: .asciiz "\n"

.text
li $t0, 5
li $t1, 1
li $t2, 20
loop:		# needs to loop
		# prints number and newline
bgt $t0, $t2, end 
li $v0, 1
move $a0, $t0 
syscall
li $v0, 4
la, $a0, newline
syscall
		# iterates
add $t0, $t0, $t1
blt $t0, $t2, loop

end:
li $v0, 10
syscall
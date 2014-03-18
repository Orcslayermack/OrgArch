.data
String: .asciiz "Completing iteration number "
Complete: .asciiz "Work complete. $t0 and $t1 are equal."
newline: .asciiz "\n"
test: .asciiz "THIS SHOULD NOT SHOW UP, YOU DID SOMETHING WRONG!\n"
.text
#iterate until $t1 is five.
li $t0, 5
li $t1, 0
li $t2, 1

loop:


#print out each time it iterates

#iterate
add $t1, $t1, $t2

# Prints string and iteration number
li $v0, 4
la $a0, String
syscall
li $v0, 1
move $a0, $t1
syscall
li $v0, 4
la $a0, newline
syscall

bne $t0, $t1, loop
beq $t0, $t1, end
#WRONG
li $v0, 4
la $a0, test
syscall

end:
li $v0, 4
la $a0, Complete
syscall
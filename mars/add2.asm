.data
str1:
	.asciiz "Enter a number now, MINION."
str2:
	.asciiz "The sum is: "
#this is a comment!
.text
li $v0,4		# Print str1, the input prompt.
la $a0, str1
syscall

li $v0, 5
syscall
move $t0, $v0		# move the int to $t0

li $v0,4		# Print str1, the input prompt.
la $a0, str1
syscall

li $v0, 5
syscall
move $t1, $v0		# move the int to $t0

add $t2, $t0, $t1

li $v0,4		# Print str2, the output notification.
la $a0, str2
syscall

li $v0,1		# Print str2, the output notification.
move $a0, $t2
syscall
.data
prompt1:	.asciiz "Please enter integer 1 of 3: \n"
prompt2: 	.asciiz "Please enter integer 2 of 3: \n"
prompt3: 	.asciiz "Please enter integer 3 of 3: \n"
result: 	.asciiz "The integers in order from smallest to largest are: "
range: 		.asciiz "The range of the integers entered is: "
space: 		.asciiz " "
newline: 	.asciiz "\n"
.text
# prompt and record three integers in $t0-$t2
li $v0, 4
la $a0, prompt1
syscall
li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, prompt2
syscall
li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, prompt3
syscall
li $v0, 5
syscall
move $t2, $v0

# evaluate the three integers, print them out in order of least to greatest.
first: # is $t0 less than t1? if so, jump to second.
ble $t0, $t1, second
move $t3, $t0
move $t0, $t1
move $t1, $t3

second: # is $t1 less than t2? if so, jump to third.
ble $t1, $t2, third
move $t3, $t1
move $t1, $t2
move $t2, $t3

third: # is $t0 less than t1? if so, jump to print
ble $t0, $t1, print
move $t3, $t0
move $t0, $t1
move $t1, $t3

print:
# prints result
li $v0, 4
la $a0, result
syscall

# first letter
li $v0, 1
move $a0, $t0
syscall

# space
li $v0, 4
la $a0, space
syscall

# second letter
li $v0, 1
move $a0, $t1
syscall

# space
li $v0, 4
la $a0, space
syscall

# third letter
li $v0, 1
move $a0, $t2
syscall

# newline
li $v0, 4
la $a0, newline
syscall

#calculate the range
sub $t3, $t2, $t0
li $v0, 4
la $a0, range
syscall
li $v0, 1
move $a0, $t3
syscall

# close program
li $v0, 10
syscall

.data
STR: .asciiz "WRONG"
.text
j test

wrong:
li $v0, 4
la $a0, STR
syscall
li $v0, 10
syscall


test:
li $t0, 1
li $t1, 0
bgt $t0, $t1, wrong
li $v0, 10
syscall






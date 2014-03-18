.data
str1: .asciiz "main begin should be first\n"
str2: .asciiz "label begin should be last\n"
str3: .asciiz ".text begin should not run\n"



.text
la $a0, str3
li $v0, 4
syscall



main:
la $a0, str1
li $v0, 4
syscall







label:
la $a0, str2
li $v0, 4
syscall


li $v0 10
syscall
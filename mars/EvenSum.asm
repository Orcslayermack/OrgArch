# Below is the code to setup an array of 10 integers in MIPS, 
# stored contiguously with the address of a[0] in register $t2, 
# and registers $t0 and $t1 initialized to 0.  
# Write MIPS code to find the sum of the even values. 

.data
x0: .word 12
x1: .word 19
x2: .word 7
x3: .word 16
x4: .word 5
x5: .word 31
x6: .word 24
x7: .word 3
x8: .word 25
x9: .word 2

.text
li $t0, 0			# initialize looping variable.
li $t1, 0
la $t2, x0			# base address of the array


# loop through array
loop:
# if int is even, add to sum






# gracefully exit
li $v0, 10
syscall
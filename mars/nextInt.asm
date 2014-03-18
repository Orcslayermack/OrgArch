.data
prompt: .asciiz "Please enter an integer: "
prompt2: .asciiz "The number entered is: "
x: .word 0 
.text
# System.out.print("Please enter an integer: ");   DONE
la $a0, prompt
li $v0,  4
syscall  

# int x = input.nextInt();  
li $v0 5
syscall
move $t0, $v0		#store in $t0

# System.out.print("The number entered is: ");
la $a0, prompt2
li $v0, 4
syscall

move $a0, $t0
li $v0, 1
syscall
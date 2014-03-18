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
# initalize f
# int f = 1;
li $t1, 1
loop:
# while ( n > 1 ) {
ble $t0, 1, end
# f *= n;
mul $t1, $t1, $t0
# n--:
sub $t0, $t0, 1
# }
j loop
end:
# System.out.printlnl( f );
li $v0, 1
move $a0, $t1
syscall 
# gracefully close the program
li $v0, 10
syscall
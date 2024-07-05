.data
input_msg0: .asciiz "Enter n: "
input_msg1: .asciiz "\nInput number1"
input_msg2: .asciiz "\nInput number2 "
input_msg3: .asciiz "\nAnswer "

.text
.globl main
# start of main program
main:
li $v0, 4
la $a0, input_msg0
syscall
li $v0, 5
syscall
add $t0, $v0, $0
sub.s $f2,$f2,$f2
loop:
li $v0, 4
# ask for element
la $a0, input_msg1
syscall
li $v0, 6
syscall
mov.s $f1, $f0
li $v0, 4
# ask for element
la $a0, input_msg2
syscall
li $v0, 6
syscall
mul.s $f1, $f0, $f1
add.s $f2, $f2, $f1
addi $t0, $t0, -1
bne $t0, $0, loop
li $v0, 4
la $a0, input_msg3
syscall
li $v0, 2
mov.s $f12, $f2
syscall
jr $ra

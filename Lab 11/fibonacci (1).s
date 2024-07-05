.data
input_msg0: .asciiz "Enter n: "

input_msg2: .asciiz ", "

.text
.globl main
# start of main program
main:
li $v0, 4
la $a0, input_msg0
syscall
li $v0, 5
syscall
add $s0, $v0, $0
add $a3, $s0, $0
add $a1, $0, $0
addi $a2, $0, 1
xor $a0, $a0, $a0
addi $sp, $sp, -4
sw $ra, 0($sp)
jal fib
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra
fib:
beq $a3, $0, label
add $a0, $a2, $0
li $v0, 1
syscall
li $v0, 4
la $a0, input_msg2
syscall
add $a0, $a2, $0
add $a2, $a2, $a1
add $a1, $a0, $0
addi $a3, $a3, -1
addi $sp, $sp, -4
sw $ra 0($sp)
jal fib
lw $ra, 0($sp)
addi $sp, $sp, 4
label:
jr$ra


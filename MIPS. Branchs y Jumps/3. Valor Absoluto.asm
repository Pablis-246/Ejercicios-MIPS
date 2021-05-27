.data
    msg: .asciiz "Ingrese su numero: "
    finalMsg: .asciiz "El numero absoluto del ingresado es: " 
    exitMsg: .asciiz "Quiere repetir el proceso con otro numero?:(0 para no, 1 para si): "
.text
.globl main
main:
    li $v0,  4
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    bge $t0, $zero, exit
loop:
    beq $t0, $zero, loop2
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    j loop
loop2:
    add $t0, $t0, $t1
exit:
    li $v0, 4
    la $a0, finalMsg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 10
    syscall
.data   
 prompt: .asciiz "Ingrese numero: "
 msg: .asciiz "El factorial es: "

.text
.globl main
main:
    li     $t1, 1             
    li     $v0, 4             
    la     $a0, prompt         
    syscall                    
    
    li     $v0, 5              
    syscall                       
    move   $t0, $v0           
    bne    $t0, $zero, loop     
    li     $v0, 4              
    la     $a0, msg            
    syscall                    
    
    li     $v0, 1              
    li     $a0, 1              
    syscall                    
    
    li     $v0, 10             
    syscall                    

loop:
    beq    $t0, $zero, exit    
    mul    $t1, $t0, $t1       
    addi   $t0, $t0, -1        
    j loop                     

exit:
    li     $v0, 4              
    la     $a0, msg            
    syscall                   
    
    li     $v0, 1             
    move   $a0, $t1            
    syscall                    
    
    li     $v0, 10             
    syscall                    
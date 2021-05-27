.data
prompt: .asciiz "Ingrese un numero: "
parmsg: .asciiz "es par\n"
imparmsg: .asciiz "es impar\n"

.text
.globl main
main:
  li          $v0, 4                  
  la          $a0, prompt                
  syscall                             
  li          $v0, 5                  
  syscall                             

  move        $t0, $v0                
  rem         $t1, $t0, 2             
  beq         $t1, $zero, par         
  j           impar                   

par:
  li          $v0, 1                 
  move        $a0, $t0                
  syscall                             
  li          $v0, 4                  
  la          $a0, parmsg             
  syscall                             
  j           exit                    

impar:
  li          $v0, 1                  
  move        $a0, $t0                
  syscall                             
  li          $v0, 4                  
  la          $a0, imparmsg           
  syscall                             
  j           exit                    

exit: 
  li          $v0, 10                
  syscall                             
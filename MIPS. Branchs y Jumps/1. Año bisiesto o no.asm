.data
ingresa_anio: .asciiz "Ingrese el anio: "
no_bisiesto: .asciiz " No es bisiesto\n"
si_bisiesto: .asciiz " Es bisiesto\n"

.text
.globl main
main:
  li          $v0, 4                  
  la          $a0, ingresa_anio       
  syscall                             
  
  li          $v0, 5                  
  syscall                             
  
  move        $t0, $v0                 
  rem         $t1, $t0, 4             
  beq         $t1, $zero, step2       
  j           no                      

step2:
  rem         $t1, $t0, 100           
  bne         $t1, $zero, yes         
  j           step3                  

step3:
  rem         $t1, $t0, 400          
  beq         $t0, $zero, yes         
  j           no                      

no:
  li          $v0, 1                 
  move        $a0, $t0                
  syscall                             
  li          $v0, 4                  
  la          $a0, no_bisiesto        
  syscall                             
  j           exit                    

yes:
  li          $v0, 1                  
  move        $a0, $t0                
  syscall                             
  li          $v0, 4                 
  la          $a0, si_bisiesto        
  syscall                             
  j           exit                    

exit:
  li          $v0, 10                 
  syscall                             
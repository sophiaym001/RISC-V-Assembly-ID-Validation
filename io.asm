.global printInt
.global printString
.global readChar
.global readInt

main:
 printInt: #used the help page to check all of the numbers for these syscalls
 li a7,1
 ecall
 ret
 
 printString:
 li a7,4
 ecall
 ret
 
 readChar:
 li a7,12
 ecall
 ret

 readInt:
 li a7,5
 ecall
 ret

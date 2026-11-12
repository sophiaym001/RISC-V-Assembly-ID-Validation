.data #defining data, mostly strings I need to print
 welcome: .string "Welcome to the Digital ID Validation Toolkit."
 operations: .string "\nOperations - 1:parity 2:check sum 3: reverse 4:count digits 5:fraud check"
 prompt: .string "\nEnter ID number: "
 select: .string "Select operation: "
 answer: .string "Result: "
 continues: .string "\nContinue (y/n)?: "
 total: .string "\n\nNumber of operations performed: "
 ending: .string "\nExiting"
 

.text #shows that the code is starting now
.globl main
main:
 li s0, 0 #defining the operations count, using s0 because it's a callee-save register
 li s1,1 #operation 1
 li s2,2 #operation 2
 li s3,3 #operation 3
 li s4,4 #operation 4
 li s5,5 #operation 5

 #loads and prints welcome string
 la a0,welcome
 jal printString
 
 la a0,operations
 jal printString
 
repeat:
 la a0,total
 jal printString
 
 #loads and prints s0, or our operations count
 mv a0,s0
 jal printInt
 
 #loads and prints the prompt to collect ID number
 la a0,prompt
 jal printString
 
 #syscall to read the entered ID, uses t0 because the ID will be temporary and a new ID will be given for next operation
 jal readInt
 mv s7,a0
 
 #loads and prints select
 la a0,select
 jal printString
 
 #reads which operation user wants to complete
 jal readInt
 mv t1,a0
 
 beq t1,s1, parity #if user enters 1 complete parity operation
 beq t1,s2, Checksum #if 2 is entered complete Checksum
 beq t1,s3, Reverse
 beq t1,s4, count
 beq t1,s5, fraud
 j end
 
 parity: #calls subroutine from analysis.asm
  mv a0,s7
  jal isEven
  mv s6,a0
  addi s0,s0,1
 
  #loads and prints answer
  la a0,answer
  jal printString
 
  #prints 0 or 1 based off if Id is even or odd
  mv a0,s6
  jal printInt
  j continue
 
 Checksum:
  mv a0,s7
  jal sumDigits
  mv s6,a0
  addi s0,s0,1
  
  #loads and prints answer
  la a0,answer
  jal printString
  
  mv a0,s6
  jal printInt
  j continue
  
  Reverse: #reverses the ID
  mv a0,s7
  jal reverseNumber
  mv s6,a0
  addi s0,s0,1
  
  #loads and prints answer
  la a0,answer
  jal printString
  
  mv a0,s6
  jal printInt
  j continue
  
  count: #count operation shows how many digits in ID
  mv a0,s7
  jal countDigits
  mv s6,a0
  addi s0,s0,1
  
  #loads and prints answer
  la a0,answer
  jal printString
  
  mv a0,s6
  jal printInt
  j continue
  
  fraud: #completes fraud operation and increases operations count
  mv a0,s7
  jal fraudHeuristic
  mv s6,a0
  addi s0,s0,1
  
  #loads and prints answer
  la a0,answer
  jal printString
  
  mv a0,s6 #prints if it's fraud
  jal printInt
  j continue
  
  continue: #ask if user wants to continue, reads y/n as yes or no
   la a0,continues
   jal printString
   
   jal readChar
   mv s6,a0
   
   li t0,'y'
   beq s6,t0,yes
   
   li t0,'n'
   beq s6,t0,no
   
   yes: #loops to continue and check other IDs
    j repeat
    
   no: #jumps to end the program
    la a0,ending
    jal printString
    j end
 end: #ends program
 li a7,10
 ecall

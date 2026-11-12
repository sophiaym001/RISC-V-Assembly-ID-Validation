.global isEven
.global sumDigits
.global reverseNumber
.global countDigits
.global fraudHeuristic
#main:
 isEven: #takes the remainder and if it is equal to 0, ID is even
  li t1,2
  rem t3,a0,t1
  beqz t3,even
  li a0,0
  ret
  even:
  li a0,1
  ret

 sumDigits:
  li t4,0 #this will be our sum
  li t5,10 #use this to check last digit
  mv t0,a0
  
  loop: #loops and takes the last digit adds it to sum, moves to next digit
   beqz t0,done
   rem t2,t0,t5
   add t4,t4,t2
   div t0,t0,t5
   j loop
   done:
   mv a0,t4
   ret
   
 reverseNumber: #uses similar technique to sumDigits, but multiplies by 10 then adds in order to reverse the order
  li t4,0
  li t5,10
  mv t0,a0
  
  rloop:
  beqz t0,rdone
  rem t2,t0,t5
  div t0,t0,t5
  mul t4,t4,t5
  add t4,t4,t2
  j rloop
  rdone:
  mv a0,t4
  ret

 countDigits: #again same technique but instead t4 will hold a count instead of a sum or reversed number
  li t4,0 
  li t5,10
  mv t0,a0
  
  cloop: 
   beqz t0,cdone
   rem t2,t0,t5
   addi t4,t4,1
   div t0,t0,t5
   j cloop
   cdone:
   mv a0,t4
   ret
 fraudHeuristic:
  li t4,0 #this will be our sum
  li t5,10 #use this to check last digit
  mv t0,a0
  
  floop: #loops and takes the last digit adds it to sum, moves to next digit
   beqz t0,fcheck
   rem t2,t0,t5
   add t4,t4,t2
   div t0,t0,t5
   j floop
   fcheck:
    li t5,40
    bgt t4,t5,true
    
    li a6,0
    li t5,10
    mv t0,a0
  
  Floop: #counts the digits in the ID
   beqz t0,Fdone
   rem a2,a0,a5
   addi a6,a6,1
   div t0,t0,t5
   j Floop
   Fdone:
   li t5,5
   blt a6,t5,true
   
  false: #if ID is not fraudulent
   li a0,0
   ret
   
  true: #if ID has a sum greater than 0, or ID less than 5 digits
   li a0,1
   ret

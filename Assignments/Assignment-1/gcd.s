     THUMB
     AREA     gcd, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
	MOV r0,#5 ;a
	MOV r1,#35 ;b
	
loop CMP r0,r1 ; (a!=b)
     SUBGT r0,r0,r1 ;  a=a-b
	 SUBLT r1,r1,r0 ; b=b=a
	 BNE loop 
; result indicated in both r0 and r1
stop B stop ; stop program
     ENDFUNC
     END
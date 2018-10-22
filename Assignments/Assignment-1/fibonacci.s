     THUMB
     AREA     fibonacci, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
	 MOV r0,#0 ; a
	 MOV r1,#1 ; b
	 MOV r2,#1 ; c
	 ; a,b,c are the first three terms of the fibonacci series
	 
	 MOV r3,#10 ; n - no.of terms in the series
	 MOV r5,#0x20000000 ;fibonacci series stored from this location 
	 MOV r6,#0 ; offset to store in memory
	 
loop CMP r3, #0
	 ; the logic for fib series
     MOV r0, r1 ;a=b
     MOV r1, r2 ;b=c
	 ADD r2,r1,r0
	 ; for storing series in memory 
	 STR r2, [r5,r6]
	 ADD r6,r6,#1
	 ; check loop condition
	 SUBGT r3, r3, #1 ; decrement n
     BGT loop ; do another fib if counter!= 0
stop B stop ; stop program
     ENDFUNC
     END
	 
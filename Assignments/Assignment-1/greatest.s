	 THUMB
     AREA     greatest, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
	 MOV r0, #88  ;a
	 MOV r1, #98 ;b 
	 MOV r2, #8  ;c
	 
	 CMP r0,r1 ; check between a,b
	 BGT great
	 BLT less
	 BEQ equal
	 
great CMP r0,r2 ; check between a,c
      BGT result_1
	  BLT result_2
	  B result_2
	  
less CMP r1,r2 ; check between b,c
	 BGT result_3
	 BLT result_2
	 B result_2
	
equal CMP r0,r2
	  BGT result_1
	  BLT result_2

result_1 MOV r4,r0
		 B stop
result_2 MOV r4,r2
		 B stop
result_3 MOV r4,r1

stop B stop ; stop program
     ENDFUNC
     END
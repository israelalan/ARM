     AREA     test_1, CODE, READONLY
     EXPORT __main
     ENTRY
__main function
	VLDR.F32 s0, =1.0 ; sum A
	VLDR.F32 s1, =1.0 ; B
	VLDR.F32 s2, =1.0 ; C = x
	VLDR.F32 s3, =1.0 ; mul_factor
	VLDR.F32 s4, =1.0 ; add_factor
	
loop VMOV.F32 s6,s0
	 VDIV.F32 s5,s2,s3 ; C = x/n
	 VADD.F32 s3,s3,s4 ; n = n+1
	 VFMA.F32 s0,s1,s5 ; A = A + BC
	 VMUL.F32 s1,s1,s5 ; B = B*C
	 VCMP.F32 s6,s0
	 VMRS APSR_nzcv, FPSCR
	 BNE loop
	 
	 ;check answer in S0
stop B stop ; stop program
	 ENDFUNC
     END
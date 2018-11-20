	 area     appcode, CODE, READONLY
	 IMPORT printMsg  
	 EXPORT __sigmoid
__sigmoid function
	VLDR.F32 s5, =0.0 ; B
	VLDR.F32 s0, =1.0 ; sum A
	VLDR.F32 s1, =1.0 ; B
	;VLDR.F32 s2, =5.0 ; C = x
	VSUB.F32 s2,s5,s2
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
	 
	 VADD.F32 s6,s4,s0
	 VDIV.F32 s6,s4,s6
	 ;check answer in S0
	 BX lr
	
	 ENDFUNC
	 export __main	
	 ENTRY 
__main  function		 
	   ; Testing check output here -- s25-AND, s26-OR, s27-NAND, s28-NOR, s29-XOR, s30-XNOR, s31-NOT
       ; using s7,s8,s9 for inputs
	   VLDR.F32 s7, =1.0 ; in1
	   VLDR.F32 s8, =0.0 ; in2
	   VLDR.F32 s9, =1.0 ; in3
	   VLDR.F32 s10, =1.0 ; bias
	   
	   ; AND weights - s11,s12,s13,s14
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =-5.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid
	   VCVTR.S32.F32 s25,s6
	   VMOV.F32 r0,s25
	   ;VCVT.F32.S32 s25,s25
	   BL printMsg
	   
	   ; OR weights - s11,s12,s13,s14
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid
	   VCVTR.S32.F32 s26,s6
	   VMOV.F32 r0,s26
	   ;VCVT.F32.S32 s26,s26
	   BL printMsg
	   
	   ; NAND weights - s11,s12,s13,s14
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =5.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid
	   VCVTR.S32.F32 s27,s6
	   VMOV.F32 r0,s27
	   ;VCVT.F32.S32 s27,s27
	   BL printMsg
	   
	   ; NOR weights - s11,s12,s13,s14
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid
	   VCVTR.S32.F32 s28,s6
	   VMOV.F32 r0,s28
	   ;VCVT.F32.S32 s28,s28
	   BL printMsg
	   
	   ; XOR weights - s11,s12,s13,s14
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-1 X1
	   VCVTR.S32.F32 s17,s6
	   VCVT.F32.S32 s17,s17

	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-1 X2
	   VCVTR.S32.F32 s18,s6
	   VCVT.F32.S32 s18,s18
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-1 X3
	   VCVTR.S32.F32 s19,s6
	   VCVT.F32.S32 s19,s19
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =-5.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-1 X4
	   VCVTR.S32.F32 s20,s6
	   VCVT.F32.S32 s20,s20
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s16, =2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s17 ; w1*x1
	   VMUL.F32 s12,s12,s18 ; w2*x2
	   VMUL.F32 s13,s13,s19 ; w3*x3
	   VMUL.F32 s16,s16,s20 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w5*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s16 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-2 Y1 output
	   VCVTR.S32.F32 s29,s6
	   VMOV.F32 r0,s29
	   ;VCVT.F32.S32 s29,s29
	   BL printMsg
	   
	   ; XNOR weights - s11,s12,s13,s14
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-1 X1
	   VCVTR.S32.F32 s17,s6
	   VCVT.F32.S32 s17,s17
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-1 X2
	   VCVTR.S32.F32 s18,s6
	   VCVT.F32.S32 s18,s18
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-1 X3
	   VCVTR.S32.F32 s19,s6
	   VCVT.F32.S32 s19,s19
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =5.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-1 X4
	   VCVTR.S32.F32 s20,s6
	   VCVT.F32.S32 s20,s20
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s16, =2.0
	   VLDR.F32 s14, =-7.0
	   
	   VMUL.F32 s11,s11,s17 ; w1*x1
	   VMUL.F32 s12,s12,s18 ; w2*x2
	   VMUL.F32 s13,s13,s19 ; w3*x3
	   VMUL.F32 s16,s16,s20 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; w5*bias
	   
	   VLDR.F32 s15, =0.0
	   VADD.F32 s15,s15,s14
	   VADD.F32 s15,s15,s11 ;
	   VADD.F32 s15,s15,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s16 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid ;Hidden Layer-2 Y1 output
	   VCVTR.S32.F32 s30,s6
	   VMOV.F32 r0,s30
	   ;VCVT.F32.S32 s30,s30
	   BL printMsg
	   
	   ;NOT weight - s11,s14
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s14,s14,s10 ; w4*bias
	   
	   VADD.F32 s15,s11,s14 ;
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid ;Hidden Layer-2 Y1 output
	   VCVTR.S32.F32 s31,s6
	   VMOV.F32 r0,s31
	   ;VCVT.F32.S32 s31,s31
	   BL printMsg
	   
	   ;BL printMsg	 ; Refer to ARM Procedure calling standards.
fullstop    B  fullstop ; stop program	   
     endfunc
     end 
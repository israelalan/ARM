#include "TM4C123GH6PM.h"
void printGate(const int a)
{
	 char *ptr_n;
	 
	 if(a==0){ ptr_n = "Logical AND\n"; }
	 if(a==1){ ptr_n = "Logical OR\n"; }
	 if(a==2){ ptr_n = "Logical NAND\n"; }
	 if(a==3){ ptr_n = "Logical NOR\n"; }
	 if(a==4){ ptr_n = "Logical XOR\n"; }
	 if(a==5){ ptr_n = "Logical XNOR\n"; }
	 if(a==6){ ptr_n = "Logical NOT\n"; }
	
	 while(*ptr_n != '\0'){
      ITM_SendChar(*ptr_n);
      ++ptr_n;
   }
	 return;
}


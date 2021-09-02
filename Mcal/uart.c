#include"uart.h"
// pointer hold address for uart0D to Receive and Send  0x101f1000
#define UART0D    *((volatile unsigned long int*)((unsigned long int *)0x101f1000)) 

static int var=10;

void F_UART0_TX(unsigned char *P_tx_string)
{
	
  while (*P_tx_string != '\0')
  {
      UART0D = (unsigned long int)*P_tx_string;
      P_tx_string++;
  }
   
}
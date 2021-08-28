#include"../HAl/uart.h"

unsigned char string[100]="Learn_depth_<Elabbas Salah>";
unsigned char const string2[100]="Learn_depth_<Elabbas Salah>";



void main(void)
{
  F_UART0_TX(string);
}
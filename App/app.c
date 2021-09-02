#include"../Mcal/uart.h"

unsigned char string[100]="Learn_depth_<Elabbas Salah>";
unsigned char const string2[100]="Learn_depth_<Elabbas Salah>";

static int var=10;

static int var2;


extern int x;
int y;

void main(void)
{
  F_UART0_TX(string);
}

int x=0;

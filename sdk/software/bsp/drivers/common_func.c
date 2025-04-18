#include "common_func.h"

void RegWrite(unsigned int addr,unsigned int var)
{
	*((volatile unsigned int *)(addr)) = var;
}

unsigned int RegRead(unsigned int addr)
{
	return (*((volatile unsigned int *)(addr)));
}



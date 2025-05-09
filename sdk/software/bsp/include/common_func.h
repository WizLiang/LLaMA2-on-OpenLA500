#ifndef common_func_H
#define common_func_H

#include <larchintrin.h>

typedef signed int S32;
typedef unsigned int U32;
typedef unsigned int uint32_t;
typedef signed short S16;
typedef unsigned short U16;
typedef signed char S8;
typedef unsigned char U8;
typedef long long S64;
typedef unsigned long long U64;

void RegWrite(unsigned int addr,unsigned int var);
unsigned int RegRead(unsigned int addr);

static inline U32 csr_readl(U32 reg)
{
	return __csrrd_w(reg);
}

static inline U64 csr_readq(U32 reg)
{
	return __csrrd_w(reg);
}

static inline void csr_writel(U32 val, U32 reg)
{
	__csrwr_w(val, reg);
}

static inline void csr_writeq(U64 val, U32 reg)
{
	__csrwr_w(val, reg);
}

static inline U32 csr_xchgl(U32 val, U32 mask, U32 reg)
{
	return __csrxchg_w(val, mask, reg);
}

static inline U64 csr_xchgq(U64 val, U64 mask, U32 reg)
{
	return __csrxchg_w(val, mask, reg);
}

#endif

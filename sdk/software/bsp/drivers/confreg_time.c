#include "confreg_time.h"
#include "time.h"

unsigned long __attribute__((weak)) CONFREG_TIMER_BASE = 0xbf20f100;
unsigned long __attribute__((weak)) CONFREG_CLOCKS_PER_SEC = 50000000L;
unsigned long __attribute__((weak)) CORE_CLOCKS_PER_SEC = 33000000L;

unsigned long get_confreg_clock_count()
{
    unsigned long contval;
    asm volatile(
        "la.local $r25, CONFREG_TIMER_BASE\n\t"
        "ld.w $r25, $r25, 0\n\t"
        "ld.w %0,$r25,0\n\t"
        :"=r"(contval)
        :
        :"$r25"
    );
    return  contval;
}

unsigned long get_cpu_clock_count()
{
    unsigned long contval;
    asm volatile(
        "rdcntvl.w %0\n\t"
        :"=r"(contval)
    );
    return  contval;
}

unsigned long get_clock_count()
{
#ifdef USE_CPU_CLOCK_COUNT
    return  get_cpu_clock_count();
#else
    return get_confreg_clock_count();
#endif
}

unsigned long get_ns(void)
{
    unsigned long n=0;
    n = get_clock_count();
#ifdef USE_CPU_CLOCK_COUNT
    n=n*(NSEC_PER_USEC/(CORE_CLOCKS_PER_SEC/USEC_PER_SEC));
#else
    n=n*(NSEC_PER_USEC/(CONFREG_CLOCKS_PER_SEC/USEC_PER_SEC));
#endif
    return n;
}

unsigned long get_us(void)
{
    unsigned long n=0;
    n = get_clock_count();
#ifdef USE_CPU_CLOCK_COUNT
    n=n/(CORE_CLOCKS_PER_SEC/USEC_PER_SEC);
#else
    n=n/(CONFREG_CLOCKS_PER_SEC/USEC_PER_SEC);
#endif
    return n;
}

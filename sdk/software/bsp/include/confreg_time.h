#ifndef _CONFREG_TIME_H_H
#define _CONFREG_TIME_H_H

extern unsigned long CONFREG_TIMER_BASE;
extern unsigned long CONFREG_CLOCKS_PER_SEC;
extern unsigned long CORE_CLOCKS_PER_SEC;

#define MSEC_PER_SEC 1000L
#define USEC_PER_MSEC 1000L
#define NSEC_PER_USEC 1000L
#define NSEC_PER_MSCEC 1000000L
#define USEC_PER_SEC 1000000L
#define NSEC_PER_SEC 1000000000L
#define FSEC_PER_SEC 1000000000000000LL

unsigned long get_cpu_clock_count();//获取处理器核统计的时钟周期数
unsigned long get_confreg_clock_count();//获取CONFREG的时钟周期数
unsigned long get_clock_count();//根据是否存在宏 USE_CPU_CLOCK_COUNT 输出 处理器核/CONFREG 的计数器值
unsigned long get_ns(void);//获取统计的纳秒数
unsigned long get_us(void);//获取统计的微秒数

#endif

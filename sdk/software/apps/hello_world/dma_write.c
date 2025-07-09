#include <stdio.h> 
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

//BSP板级支持包所需全局变量
unsigned long UART_BASE = 0xbf000000;					//UART16550的虚地址
unsigned long CB_BASE = 0xbf100000;
unsigned long CONFREG_TIMER_BASE = 0xbf20f100;			//CONFREG计数器的虚地址
unsigned long CONFREG_CLOCKS_PER_SEC = 50000000L;		//CONFREG时钟频率
unsigned long CORE_CLOCKS_PER_SEC = 33000000L;			//处理器核时钟频率

#define CPSIZE 12
char src[CPSIZE] = "this is src";
char dst[CPSIZE] = "this is dst";


static inline void cb_write(unsigned long offset, unsigned long value)
{
    RegWrite(CB_BASE + offset, value);
}

static inline unsigned long cb_read(unsigned long offset)
{
    return RegRead(CB_BASE + offset);
}

int main(int argc, char** argv)
{
	int a = 100;
	float b = 3.2564;
	double c = 5478.47563;
	char *str;

	printf("Hello Loongarch32r!\n");
	// printf("a = %d\n",  a);
	// printf("b = %f\n",  b);
	// printf("c = %lf\n", c);

    // str = (char *)malloc(6);
    // strcpy(str, "ABCDE");
    // printf("String = %s,  Address = 0x%x\n", str, str);

	// memcpy(dst, src, CPSIZE);
    // printf("%s\n", dst);


	printf("Hello world from CB test\n");
    unsigned long test_val = 0x12345678;
    cb_write(0, test_val);
    unsigned long read_back = cb_read(0);
    if (read_back == test_val) {
        printf("CB_BASE read/write success\n");
    } else {
        printf("CB_BASE read/write failed\n");
    }
    // read_back = cb_read(0);
    // printf("csr_crtl =  %x\n",read_back);
    // cb_write(0x10,0x1c000000);
    // read_back = cb_read(0x10);
    // printf("csr_vi_addr =  %x\n",read_back);

    // cb_write(0,0x1);
    // read_back = cb_read(0);
    // printf("csr_crtl =  %x\n",read_back);


    read_back = cb_read(0);
    printf("csr_crtl =  %x\n",read_back);
    cb_write(0x18,0x1f100020);
    read_back = cb_read(0x10);
    printf("csr_vi_addr =  %x\n",read_back);

    cb_write(0,0x1);
    read_back = cb_read(0);
    printf("csr_crtl =  %x\n",read_back);

    while(1){

    }

  
	return 0;
}
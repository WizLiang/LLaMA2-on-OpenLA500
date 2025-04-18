#include "core_time.h"
#include "confreg_time.h"

// default : 33 mhz 

void delay_ms(uint32_t ms)
{ 
    unsigned char overflow;
    unsigned long time,target_time,time_r,target_time_r;

    time = get_cpu_clock_count();
    time_r = time;
    target_time = time + (CORE_CLOCKS_PER_SEC/1000)*ms;
    target_time_r = target_time;
    if( target_time < time){
        overflow = 1;
        target_time = 0xffffffff;
    }
    while(time < target_time){
        time = get_cpu_clock_count();
        if (time_r > time) break;
        time_r = time;
    }
    if (overflow) {
        while( time < target_time_r){
            time = get_cpu_clock_count();
        }
        overflow = 0;
    }
}

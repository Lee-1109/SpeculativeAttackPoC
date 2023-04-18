#include "x86intrin.h"
#include "emmintrin.h"
#include "stdint.h"
#include "stdio.h"
#include "stdlib.h"

uint8_t array[256*512];


int main(){
    int junk =0;
    register uint64_t timeBegin,timeEnd;
    volatile uint64_t *addr;
    for (size_t i = 0; i < 256; i++)
    {
        array[i*512]=1;
    }
    //将其从cache中驱逐
    for (size_t i = 0; i < 256; i++)
    {
        _mm_clflush(&array[i*512]);
    }
    array[10*512]=8;
    array[11*512]=8;
    array[13*512]=8;
    array[98*512]=8;
    array[99*512]=9;
    array[100*512]=8;

    for (size_t i = 0; i < 256; i++)
    {
        addr = &array[i*512];
        timeBegin = __rdtscp(&junk);
        junk = *addr;
        timeEnd = __rdtscp(&junk)-timeBegin;
        printf("the index %lu, access time = %lu\n",i,timeEnd); 
    }
    return 0;
}
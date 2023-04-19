/**
 * 这个程序返回一个放置在内存中的字符串的物理地址，为了帮助可读
*/
#include "libkdump.h"
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

const char *strings[] = {
    "School of information engineering,NingXia University",
    "Collaborative Innovation Center for Ningxia Big Data and Artificial Intelligence Co-founded by Ningxia Municipality and Ministry of Education"
    };

int main(int argc, char *argv[]) {
  libkdump_config_t config;
  config = libkdump_get_autoconfig();
  libkdump_init(config);

  srand(time(NULL));
  const char *secret = strings[rand() % (sizeof(strings) / sizeof(strings[0]))];
  int len = strlen(secret);

  printf("\x1b[32;1m[+]\x1b[0m Secret: \x1b[33;1m%s\x1b[0m\n", secret);

  size_t paddr = libkdump_virt_to_phys((size_t)secret);
  if (!paddr) {
    printf("\x1b[31;1m[!]\x1b[0m Program requires root privileges (or read access to /proc/<pid>/pagemap)!\n");
    libkdump_cleanup();
    exit(1);
  }

  printf("\x1b[32;1m[+]\x1b[0m Physical address of secret: \x1b[32;1m0x%zx\x1b[0m\n", paddr);
  printf("\x1b[32;1m[+]\x1b[0m Exit with \x1b[37;1mCtrl+C\x1b[0m if you are done reading the secret\n");
  
  while (1) {
    // keep string cached for better results
    volatile size_t dummy = 0, i;
    for (i = 0; i < len; i++) {
      dummy += secret[i];
    }
    sched_yield();
  }//while(1)

  libkdump_cleanup();

  return 0;
}

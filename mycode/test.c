//test driver program memdec.c,and get the attacker target address

#define _GNU_SOURCE

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h> 
#include <stdio.h>
#include <x86intrin.h>
#include <signal.h>
#include <ucontext.h>
#include <sched.h>
#define IOCTL 0
unsigned long long test_memdev(){
    printf("\n******************** test memdev ********************\n");

    //打开驱动程序文件
    int fd = 0;
    char* memdev = "/dev/memdev0";
    fd = open(memdev, O_RDONLY);
    printf("fd = %d\n", fd);

    //执行驱动程序的ioctl
    int ioctl_result = 0;
    ioctl_result = ioctl(fd, IOCTL);
    printf("ioctl_result = %d\n", ioctl_result);

    //执行驱动程序的read（读出来的数据为64位地址）
    int data_count = 0, i = 0;
    unsigned char data[8];
    unsigned long long address = 0;
    for(i=0; i<8; i++) data[i] = 0;
    data_count = read(fd, data, sizeof(data));
    printf("data_count = %d\n", data_count);
    printf("data =");
    for(i=0; i<8; i++) printf(" 0x%02x", data[i]);
    printf("\n");
    for(i=0; i<8; i++) address += (((unsigned long long)data[i])<<(i*8));
    printf("address = 0x%016llx\n", address);

    //关闭驱动程序文件
    int close_result = 0;
    close_result = close(fd);
    printf("close_result = %d\n", close_result);

    printf("*****************************************************\n\n");
    return address;
}
int main(){
    test_memdev();
    return 0;
}
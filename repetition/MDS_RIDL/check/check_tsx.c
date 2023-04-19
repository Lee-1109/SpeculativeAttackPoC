#include "stdio.h"
#include "immintrin.h"

int main(int argc, char const *argv[])
{
    unsigned int eax,ebx,ecx,edx;

    eax = 7;
    ecx = 0;
    __asm__("cpuid"
            :"=a"(eax),"=b"(ebx),"=c"(ecx),"=d"(edx)
            :"0"(eax),"2"(ecx));
    if ((ecx &(1<<11))!=0){
        printf("support");

    }else{
        printf("not support");
    }
    return 0;
}

#include "stdio.h"

int main(){
    int a = 10;
    int b = 20;
    int result;

    __asm__ __volatile__ (
        "addl %%ebx, %%eax;"
        : "=a" (result) /* output */
        : "a" (a), "b" (b) /* input */
    );

    printf("Result: %d\n", result);
    return 0;
}



#include <stdio.h>

void print_hex_to_binary(unsigned int hex) {
    unsigned int mask = 0x80000000;
    while (mask > 0) {
        if ((hex & mask) == 0) {
            printf("0");
        } else {
            printf("1");
        }
        mask >>= 1;
    }
}

int main() {
    unsigned int hex = ~0xffff;
    print_hex_to_binary(hex);
    return 0;
}
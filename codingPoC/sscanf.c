#include "stdio.h"
#include "string.h"
int main(){

    int year, day;
    char weekday[100],month[100];
    char str[100] = "thurday,march,6 2023";
    sscanf(str,"%s%s%d%d",weekday,month,day,year);
    printf(weekday,month,day,year);
    return 0;
}
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "plus.h"

void run(int count)
{
    long long start = current_timestamp();
    long long end;
    
    int x = 0;
    while (x < count)
        x = plusone(x);
    
    printf("result=%d, time=%lld\n", x, current_timestamp() - start);
}

int main(int argc, char** argv)
{
    if (argc == 1) {
        printf("First arg is required \n");
        return 1;
    }
    
    int count = atoi(argv[1]);
    if (count <= 0 || count > 2000000000) {
        printf("Must be a positive number not exceeding 2 billion.\n");
        return 1;
    }
    
    // start immediately
    run(count);

    return 0;
}

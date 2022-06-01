#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <sys/time.h>

static const int N = 268435456;

//hope this workss

int main (void)
{
    int *ha, *hb, *hc; 
    int i;
    struct timeval t1, t2;
    ha = new int[N];
    hb = new int[N];
    hc = new int[N];

    for (i = 0; i < N; i++)
    {
      ha[i] = rand () % 10000;
      hb[i] = rand () % 10000;
    }  
    gettimeofday(&t1, 0);
    for (i = 0; i < N; i++)
    {
      hc[i] = ha[i] + hb[i];
    }
    gettimeofday(&t2, 0);
    double time = (1000000.0*(t2.tv_sec-t1.tv_sec) + t2.tv_usec-t1.tv_usec)/1000.0;

    printf("Se tardo :  %e ms \n", time);
}

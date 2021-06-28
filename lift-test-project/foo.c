#include<stdio.h>
#include<stdlib.h>

void foo(int a, int b){
  char *p;
  if (a > b){
    p = malloc(100);
  }
  if(a > b +1){
    free(p);
  }
}

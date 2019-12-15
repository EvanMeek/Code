#include <stdio.h>

int main(){
  int i = 0;
  int count = 0;
  for(;count<=10&&(i%7==0||i%10==7);i++,count++){
    printf("%d",i);
  }
  return 0;
}

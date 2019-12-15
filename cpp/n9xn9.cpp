#include <iostream>

using namespace std;

unsigned int n9xn9(unsigned int,unsigned int);

int main(){
  cout<<n9xn9(999,999)<<endl;
  return 0;
}

unsigned int n9xn9(unsigned int num1,unsigned int num2){
  if(num1 == 0)
    return 1;
  else
    return num1*n9xn9(num1,num2-1);
}

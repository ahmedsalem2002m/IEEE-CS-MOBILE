import 'dart:io';

void main() {
  int input = int.parse(stdin.readLineSync()!);
  print(dblLinear(n: input));
}

int dblLinear({required int n}) {
  List<int> u=[1];
  int i2 = 0 ,i3 = 0;

  while(u.length <= n){
    int y = 2 * u[i2] + 1;
    int z = 3 * u[i3] + 1;
    if(y < z){
      u.add(y);
      i2++;
    }else if(z < y){
      u.add(z);
      i3++;
    }else{
      u.add(y);
      i2++;
      i3++;
    }
  }
  return u[n];
}

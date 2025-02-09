import 'dart:io';

void main(){
  int num;
  String? input = stdin.readLineSync();
  num = int.parse(input!);
  for(int i = num;i > 0;i--){
    if(num % i ==0){
      print(i);
    }
  }

}
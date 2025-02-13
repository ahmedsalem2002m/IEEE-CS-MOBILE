import 'dart:io';
import 'dart:math';

void main(){
  int? numberOfInputs = int.parse(stdin.readLineSync()!);
  List<int> num = [];
  for(int i =0;i< numberOfInputs;i++){
    num.add(int.parse(stdin.readLineSync()!));
  }
  print(squareSum(numbers: num));
}
int squareSum({required List<int> numbers}) {
  int sum = 0;
  for(int i =0;i< numbers.length;i++){
    sum += pow(numbers[i],2).toInt();
  }
  return sum;
}
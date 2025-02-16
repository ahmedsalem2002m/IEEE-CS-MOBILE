import 'dart:io';

void main(){
  String? input = stdin.readLineSync();
  print(descendingOrder(input!));

}

bool descendingOrder(String n) {
  bool flag = true;
  List<String> char = n.toString().split("");
  List<int> numbers = [];
  for(int i = 0;i < char.length;i++){
    int number = int.parse(char[i]);
    numbers.add(number);
  }
  for(int i = 0;i < char.length-1;i++){
    if(numbers[i] > numbers[i+1]){
      flag = false;
    }
  }

  return flag;
}
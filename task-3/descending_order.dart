import 'dart:io';

void main(){
  String? input = stdin.readLineSync();
  int? number = int.parse(input!);
  print(descendingOrder(number));

}

int descendingOrder(int number) {
  List<String> char = number.toString().split("");
  char.sort((a,b) => b.compareTo(a));

  int result = int.parse(char.join());


  return result;
}
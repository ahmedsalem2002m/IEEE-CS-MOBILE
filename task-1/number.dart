

void main(){
  String word = "405.6";
  double doubleNumber = double.parse(word);
  int integerNumber = doubleNumber.toInt();
  print("Integer: $integerNumber");
  print("Double: $doubleNumber");
}
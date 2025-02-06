import 'dart:io';

void main() {
  int length, width, area, perimeter;

  print("Enter the length of the rectangle:");
  String? input1 = stdin.readLineSync();
  length = int.parse(input1!);

  print("Enter the width of the rectangle:");
  String? input2 = stdin.readLineSync();
  width = int.parse(input2!);

  area = length * width;
  perimeter = 2 * (length + width);
  
  print("Length: $length");
  print("Width: $width");
  print("Area: $area");
  print("Perimeter: $perimeter");
}

import 'dart:io';

void main() {
  int p0,w0,p1;
  p0 = int.parse(stdin.readLineSync()!); 
  w0 = int.parse(stdin.readLineSync()!); 
  p1 = int.parse(stdin.readLineSync()!); 
  print(potatoes(p0, w0, p1)); 
}

int potatoes(int p0, int w0, int p1) {
  double dryMatter = w0 * (100 - p0) / 100;

  int w1 = (dryMatter * 100 / (100 - p1)).truncate();

  return w1;
}



import 'dart:io';

void main() {
  int? x = int.parse(stdin.readLineSync()!);
  int? y = int.parse(stdin.readLineSync()!);
  print("=> ${quadrants(x: x, y: y)}");
}

int quadrants({required int x, required int y}) {
  if (x > 0 && y > 0)
    return 1;
  else if (x < 0 && y > 0)
    return 2;
  else if (x < 0 && y < 0)
    return 3;
  else
    return 4;
}

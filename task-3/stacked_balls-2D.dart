import 'dart:io';
import 'dart:math';
void main() {
  int? layers = int.parse(stdin.readLineSync()!);
  print(stackedBalls2D(layers: layers));
}

double stackedBalls2D({required int layers}) {
  if (layers == 0)
    return 0;
  else
    return 1 + (layers - 1) * (sqrt(3) / 2);
}

import 'dart:io';

void main() {
  String? input = stdin.readLineSync();
  print("--> ${getMiddle(s: input!)}");
}

String getMiddle({required String s}) {
  int index = ((s.length / 2)).toInt();
  if (s.length <= 2)
    return s;
  else if (s.length % 2 == 0) {
    // int num = (index / 2 - 1).toInt();
    return "${s[index-1]}${s[index]}";
  } else
    return "${s[index]}";
}

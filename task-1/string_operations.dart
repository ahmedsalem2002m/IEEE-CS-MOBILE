void main (){
  String name_1 = "Hello" ,name_2 = "World";
  String fullWord = "$name_1 $name_2";
  print("Concatenated: $fullWord");
  print("Length: ${fullWord.length}");
  print("Substring: ${fullWord.substring(0,7)}");
  print("Uppercase: ${fullWord.toUpperCase()}");
  print("LowerCase: ${fullWord.toLowerCase()}");
}
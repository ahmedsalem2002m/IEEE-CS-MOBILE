import 'dart:io';

void main(){
  String? text = stdin.readLineSync()?.toLowerCase(); 
  String input = text!.replaceAll(" ", "");
  bool flag = true;
  int s = 0,e = input.length-1 ;
  while(s < e){
    if(input[s] != input[e]){
      flag = false;
      break;
    }
    s++;
    e--;
  }
  if(flag){
    print("This input is palindrome: $input");
  }else{
    print("This input is not palindrome: $input");
  }
}
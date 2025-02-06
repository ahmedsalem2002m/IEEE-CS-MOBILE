void main(){
  int num1 = 10,num2 = 20,num3 = 15;
  print("Numbers: $num1, $num2, $num3");
  int largest = (num1 > num2 && num1 > num3) ? num1 
  :(num2 > num3) ?  num2
  : num3 ;
  int smallest = (num1 < num2 && num1 < num3) ? num1
  :(num2 < num3) ? num2
  : num3;
  print("Largest number: $largest");
  print("Smallest number: $smallest");



}
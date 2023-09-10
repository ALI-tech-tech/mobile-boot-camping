import 'myfunction.dart';

void main(List<String> args) {
  int sum=0;
  int count=0;
  while (count<5) {
    String num=input("enter number : ");
    if(isdigit(num)){
      if(int.parse(num)%2==0){
        sum+=int.parse(num);
        count++;
      }
    }
  }
  print(sum);
  

   
}
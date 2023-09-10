//علي عبدالله بن جحلان

void main(List<String> args) {
  List<int>numbers=[2,10,4,1,3,4]; 
  List h=minmax(numbers);
  print(h);
  print("max is : ${h[0]}");
  print("min is : ${h[1]}");
}
 List minmax(List num){
  int i=num[0];
  int x=num[0];
  for (var element in num) {
    if (element > x) {
      x =element;  
    }
    if (element < i) {
      i =element;  
    }
  }
  return [x,i];
}



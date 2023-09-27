import 'PizzaBulder.dart';

class Pizza {
  late String size;
  late Set<String> toppings;
  Pizza(PizzaBulder pi){
    size=pi.size;
    toppings=pi.toppings;
  }
  printdata(){
    print("A delicous ${this.size} pizza covered in ${handel(this.toppings)}.");
  }
  handel(Set<String> s){
    List<String> l=s.toList();
   String st= "";
   for (var i = 0; i < l.length; i++) {
     if (i==0) {
       st+=l.first;
     }
     else if(i>0 && i<(s.length-1)){
      st+=", "+l[i];
     }else{
      st+=" and "+l[i];
     }
   }
   
  return st;
  }
}
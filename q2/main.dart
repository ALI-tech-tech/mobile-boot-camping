import 'Pizza.dart';
import 'PizzaBulder.dart';

void main(List<String> args) {
  PizzaBulder pz=PizzaBulder(size: Size.S.name.toString());
  pz.addtoppings("pepperoni");
  Pizza pizza1=pz.build();
  pizza1.printdata();

  PizzaBulder pz2=PizzaBulder(size: Size.S.name.toString());
  pz2.addtoppings("anchovies");
  pz2.addtoppings("caviar");
  pz2.addtoppings("diamonds");
  Pizza pizza3=pz2.build();
  pizza3.printdata();
}


 enum Size {M,S,L}
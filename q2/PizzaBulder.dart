import 'Pizza.dart';

class  PizzaBulder {
  late String size;
  late Set<String> toppings={"cheese"};
  PizzaBulder({required this.size});

  addtoppings(String top){
    toppings.add(top);
  }

  Pizza build()=> Pizza(this);

}
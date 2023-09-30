import 'Obs.dart';
import 'person.dart';

void main(List<String> args) {
  Obs o=Obs();
  o.add(Person(name: "Tyler", phone: "715924217"));
  o.add(Person(name: "Kate", phone: "715924217"));
  o.notify("coffee's done!");
}
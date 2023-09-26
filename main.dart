import 'Vessel.dart';

import 'myfunction.dart';

void main(List<String> args) {
  
  for (var i = 0; i < personStatus.values.length; i++) {
    print("${i+1}-${personStatus.values[i].name}");
  }
  int num=int.parse( input("What is your status ? "));
  Vessel ve=Vessel.factory(personStatus.values[num-1]);
  print("A ${personStatus.values[num-1].name} person NEEDS"+ ve.ToString());

}


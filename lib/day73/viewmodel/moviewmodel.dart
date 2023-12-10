import 'package:flutter/material.dart';
import 'package:flutter_practis/day73/model/m.dart';

class MoViewModel with ChangeNotifier {
  List<Mo> avilable=[];
  List<Mo> choose=[];
  

MoViewModel(){
  getavilable();
}

  getavilable(){
    avilable=[Mo(name:"SA",cost:  350),Mo(name:"US",cost:  1500),Mo(name:"URO",cost:  400),];
  }

  multi(String value){
    choose.forEach((element) {
      element.amount=double.parse((element.cost!/int.parse(value.isEmpty?"0":value)).toString());
    });
    notifyListeners();
  }

  addchoosen(Mo m){
    choose.add(m);
    notifyListeners();
  }
  removechoosen(Mo m){
    choose.remove(m);
    notifyListeners();
  }
}
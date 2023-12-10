// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Mo with ChangeNotifier {
  String? name;
  int? cost;
  double? amount=0;
  bool _select = false;
  double? get getAmount => this.amount;

  set setAmount(double? amount) {
    this.amount = amount;
    notifyListeners();
  }

  
  Mo({
    this.name,
    this.cost,
   
    
  });
  get getSelect => this._select;

  set setSelect(select) {
    this._select = select;
    notifyListeners();
  }
}

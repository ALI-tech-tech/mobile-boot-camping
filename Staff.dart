
import 'Person.dart';

class Staff extends Person {
  late String _school;
  late double _pay;
  Staff({required String name,required String address, required String school,required double pay}):super(name: name, address: address){
    this._school=school;
    this._pay=pay;
  }
  String get getSchool=>this._school;
  set  setSchool(String school)=>this._school=school;
  double get getPay=>this._pay;
  set  setPay(double pay)=>this._pay=pay;

  String toString(){
    return "Person[name=${this._school},Address=${this._pay}]";
  }
 
}
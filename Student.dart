

import 'Person.dart';

class Student extends Person {
  late String _program;
  late int _year;
  late double _fee;
  Student({required String name, required String address,required String program,
  required int year ,required double fee}):super(name: name,address: address){
    this._program=program;
    this._fee=fee;
    this._year=year;
  }
  

  String get getProgram => this._program;
  set setProgram(String program )=>this._program=program;

  int get getYear=>this._year;
  set setYear(int year)=>this._year=year;

  double get getFee=>this._fee;
  set setFee(double fee)=>this._fee=fee;

  String toString(){
    return "Student[${super.toString()},program=${this.getProgram},year=${this.getYear},fee=${this.getFee} ]";
  }

}
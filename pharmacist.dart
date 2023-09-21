import 'Person.dart';

class Pharmacist extends Person {
  late int _salary;

  Pharmacist({required super.name, required super.mobile ,required int salsry}){
    this._salary=salsry;
  }

  @override
  displayinfo() {
    // TODO: implement displayinfo
    
    print( "${super.displayinfo()} Salary : ${this._salary}");
  }
}
import 'Person.dart';

class Suppliers extends Person{
  late String Company;

  Suppliers({required super.name, required super.mobile,required String company}){
    this.Company=company;
  }

  displayinfo(){
    print("${super.displayinfo()}, Company Name : ${this.Company}");
  }

}
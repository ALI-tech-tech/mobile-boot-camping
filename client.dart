import 'Invoice.dart';
import 'Person.dart';

class Client extends Person{
  late String Address;
  late String BirthDate;
  late int registeredFrom;
  late DateTime _register;
  late List<Invoice> invoices=[];
  get getAddress => this.Address;

 set setAddress( Address) => this.Address = Address;

  get getBirthDate => this.BirthDate;

 set setBirthDate( BirthDate) => this.BirthDate = BirthDate;

  get getRegisteredFrom {
    
    
    return Registeredfrom(_register);
  }

 set setRegisteredFrom( registeredFrom) => this.registeredFrom = registeredFrom;

  Client({required super.name, required super.mobile,required String address,required String BirthDate}){
    this.Address=address;
    this.BirthDate=BirthDate;
    this._register=DateTime.now();
  } 

  displayinfo(){
  print("${super.displayinfo()} ,Address : ${this.Address}, Birth Date : ${this.BirthDate},  registeredFrom : ${this.getRegisteredFrom}");
}
}
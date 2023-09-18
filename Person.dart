

abstract class Person {
  late  String? _name;
  late String? _address;

  Person( {required String name ,required String address}){
    this._name=name;
    this._address=address;
  }

  String? get getName=> this._name;
  String? get getAddress=> this._address;

  set setAddress(String address)=> this._address=address;
  String toString(){
    return "Person[name=${this._name},Address=${this._address}]";
  }
}
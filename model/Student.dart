import 'Grads.dart';

class Student {
  String? _name;
  int? _id;
  List<Grad> _grads=[];
 List<Grad>? get getGrads => this._grads;

 set setGrads(Grad grads) { this._grads.add(grads);}
 String? get name => this._name;

 set name(String? value) => this._name = value;

  get id => this._id;

 set id( value) => this._id = value;

  Student({required id,required name}){
    this._id=id;
    this._name=name;
  }

}
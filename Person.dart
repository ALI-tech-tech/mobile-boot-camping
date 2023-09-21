import 'dart:math';

import 'person_more_operation.dart';

abstract class Person with person_more_operation {
  late String _id;
  late String _name;
  late String _mobile;
  get id => this._id;
Person({required String name ,required String mobile}){
  this._name=name;
  this._mobile=mobile;
  this._id=Random().nextInt(1000).toString();
}

 set id( value) { 
  Random rnd= new Random();
  this._id=rnd.nextInt(1000).toString();
  }

  get name => this._name;

 set name( value) => this._name = value;

  get mobile => this._mobile;

 set mobile( value) => this._mobile = value;

displayinfo(){
  return("ID : ${this.id}, Name : ${this.name}, Mobile Number : ${this.mobile}");
}


}
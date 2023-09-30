

import 'Course.dart';

class Grad {
  Course? _cours;
  int? _mark;
  String? _Grade;

  Grad({required Course Course,required mark}){
    this._cours=Course;
    this._mark=mark;
    
  }
 Course? get cours => this._cours;

 set cours(Course? value) => this._cours = value;

  get mark => this._mark;

 set mark( value) => this._mark = value;

  get Grade {
  if(mark>=90){
    this._Grade="A";
  }else if(mark>=80 && mark<90){
    this._Grade="B";
  }else if(mark<80){
    this._Grade="D";
  }
 }

 

}
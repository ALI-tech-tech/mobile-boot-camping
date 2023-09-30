import 'Student.dart';

class Course {
  String? _name;
  int? _noofhours;
  double? _fee;
  List<Student> _students=[];
 List<Student> get students => this._students;

 set students(List<Student> value) => value.length<=3? this._students=value:print("3 students to register only as the maximum ") ;
 String? get name => this._name;

 set name(String? value) => value!.length==4?value:"The course name must be 4 character";

  get noofhours => this._noofhours;

 set noofhours( value) => this._noofhours = value;

  get fee => this._fee;

 set fee( value) => this._fee = value;

  Course({required String name,required int no, required double fee}){
    this.name=name;
    this.noofhours=no;
    this.fee=fee;
  }

}
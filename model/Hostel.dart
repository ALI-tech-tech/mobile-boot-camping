import '../main.dart';
import 'Student.dart';

class Hostel{
  Types? type;
  int? room;
  int? block;
  bool?_paid=false;
  List<Student>? students;
 bool? get paid => this._paid;

 set paid(bool? value) => this._paid = value ;
  int? fees;

  Hostel({required this.type,required this.room,required this.block,required this.fees});


}


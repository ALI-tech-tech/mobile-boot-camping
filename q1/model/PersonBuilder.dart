import '../Exptions/Myexption.dart';

class PersonBuilder {
  String? firstName;
  String? lastName;
  int? _age;
 int? get age => this._age;
 String? _profession;
  List<String>_hobbies=[];
 List<String> get hobbies => this._hobbies;

 set hobbies( value) {
   if (value!=null || !value.isEmpty) {
      this._hobbies=value.split(" ");
    }
    else{
      MyExption e= MyExption(msg: "Hobby item cannot be empty");
      print(e.msg);
    }
 }

  get profession => this._profession;

 set profession(value) {
  if (value!=null) {
    this._profession=value;
  }else{
    MyExption e= MyExption(msg: "profession cannot be empty");
    print(e.msg);
  }
 }

 
 set age(int? value) {
  if (value!>0) {
    this._age=value;
  }else{
    MyExption e= MyExption(msg: "age cannot be less than 0");
    print(e.msg);
  }
 }
  


  
  PersonBuilder({required this.firstName,required this.lastName});



}
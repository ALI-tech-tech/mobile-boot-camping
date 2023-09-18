

abstract class Person {
  late String _id;
  late  String? _fname;
  late  String? _lname;
  

  Person( { String? id, required String fname ,required String lname}){
    this._id=id??'';
    this._fname=fname;
    this._lname=lname;
  }

set setID(String id)=>this._id;
  // String? get getName=> this._fname;
  // String? get getAddress=> this._address;

  //set setAddress(String address)=> this._address=address;
  String Displayinfo(){
    return "ID=${this._id} name : ${this._fname} ${this._lname}";
  }
}
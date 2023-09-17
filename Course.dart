class Course {
  late String _name;
  late int _number;
  bool _isAvailable=true;


  set name(String name)=> this._name=name;
  String get name=>this._name;

  set number(int number)=>this._number=number;
  int get number=>this._number;

  set isAvailable(bool ava)=>this._isAvailable=ava;
  bool get isAvailable=>this._isAvailable;
}
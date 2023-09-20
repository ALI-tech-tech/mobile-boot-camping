class Person {
  late String _name;
  late String _birthdate;
  get name => this._name;

 set name( value) => this._name = value;

  get birthdate => this._birthdate;

 set birthdate( value) => this._birthdate = value;

  Person(this._birthdate,this._name);
 
  
}